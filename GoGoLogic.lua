local GetContainerNumSlots = C_Container.GetContainerNumSlots
local GetContainerItemLink = C_Container.GetContainerItemLink
local playerClass = UnitClass("player")
local playerRace = UnitRace("player")
local playerLevel = UnitLevel("player")
local outside = IsOutdoors()
local swimming = IsSwimming("player")
local inCombat = InCombatLockdown()
local playerRaceID = getSelectedRaceID()
local matchedMounts = findMatchingClassForms(playerLevel, playerRaceID)
local GoGoMountData = {}
GoGoMountData.matchedMounts = {}
GoGoMountData.playerKnownSpells = {} -- Declare table outside the function

function findMatchingClassForms(playerLevel, playerClass)
    local matchedMounts = {}
  
    -- Check for eligible classes (druid, hunter, shaman)
    if playerClass == GoGoMountData.classIndex[11] or
       playerClass == GoGoMountData.classIndex[3] or
       playerClass == GoGoMountData.classIndex[7] then
  
      -- Iterate through class forms, checking for matches and player level requirement
      for spellID, mountData in pairs(GoGoMountData.classForms) do
        local spellName = GetSpellInfo(spellID)  -- Get spell name from ID
  
        -- Check if player knows the spell and meets level requirement
        if GoGoMountData.playerKnownSpells[spellName] and playerLevel >= mountData.level then
          table.insert(matchedMounts, {
            name = spellName,
            type = mountData.type,
            usable = mountData.usable,
            combat = mountData.combat,
          })
        end
      end
    end
  
    return matchedMounts
  end
  


function ScanPlayerSpellbook()
  GoGoMountData.playerKnownSpells = {} -- Clear the table
  for i = 1, GetNumSpellTabs() do
    local offset, numSlots = select(3, GetSpellTabInfo(i))

    for j = offset + 1, offset + numSlots do
      local spellName, _, spellID = GetSpellBookItemName(j, BOOKTYPE_SPELL)
      GoGoMountData.playerKnownSpells[spellID] = spellName
    end
  end
  return GoGoMountData.playerKnownSpells
end
  
  -- TODO: build function to find current riding skill (Maybe only if player >= level 40)
  --ScanPlayerSpellbook() -- Call the function to populate the table -- even if we called this function from GoGoMount.lua via event trigger
  
  -- Function to find matching mounts
  local matchingMounts = {}

--[[ Function to find known spell mounts
function knownSpellMounts()
  local matchingSpells = {}

  -- Check for classes with spell mounts
  if playerClass ~= "PALADIN" and playerClass ~= "WARLOCK" then
    local spellmounts = GoGoMountData.mounts[playerClass]  -- Retrieve spell mounts for the player's class
    if spellmounts then
      for _, mountInfo in pairs(mounts) do
        -- Check if the player knows the spell
        if GoGoMountData.playerKnownSpells[mountInfo.name] then
          table.insert(matchingSpells, mountInfo)
        end
      end
    end
  end

  return matchingSpells
end]]--

-- Initialize inventory table with itemIDs
GoGoMountData.playerInventory = {}

function playerItemMounts()
  local matchingMounts = {}

  for bag = 0, NUM_BAG_FRAMES do
    for slot = 1, C_Container.GetContainerNumSlots(bag) do
      local itemID = C_Container.GetContainerItemID(bag, slot)
      GoGoMountData.playerInventory[itemID] = true
    end
  end

  -- Combine scanning and matching
  for itemID, _ in pairs(GoGoMountData.itemMounts) do
    if GoGoMountData.playerInventory[itemID] then
      table.insert(matchingMounts, {
        itemID = itemID,
        -- Add other necessary item information here
      })
      return matchingMounts  -- Return early if a match is found
    end
  end

  return matchingMounts
end


function smartmountClick()
  if InCombatLockdown() then
    return false  -- Do nothing or display a message
  end
  matchingMounts = FindMatchingMounts()

  -- Print the names of the matching mounts
  for _, mountData in pairs(matchingMounts) do
    print("Matching mount:", mountData.name)
    table.insert(GoGoMountData.matchingMounts, mountData.index)
  end

  -- Find all matching forms, spells, and items
  local classForms = knownClassForms()
  local spellmounts = knownSpellmounts()
  local itemmounts = playerItemmounts() -- Add item mounts when implemented

  -- Combine results into a single table
  GoGomountData.matchingmounts = {}  -- Clear the table
  for _, mountInfo in pairs(classForms) do
    table.insert(GoGomountData.matchingmounts, mountInfo)
  end
  for _, mountInfo in pairs(mounts) do
    table.insert(GoGomountData.matchingmounts, mountInfo)
  end
  for _, mountInfo in pairs(itemmounts) do
    table.insert(GoGomountData.matchingmounts, mountInfo)
  end

  -- ... further filtering and decision-making logic based on level, location, swimming, etc. ...

  -- Use the selected mount or form
  -- ... implement logic to use the selected mount or form ...

  return true  -- Indicate success
end

GoGoMountData.playerInventory = {}
function ScanInventory() end

function ScanInventory()
  print("Scan Inventory Function has been called!, Running Scan now")
  GoGoMountData.playerInventory = {} -- Initialize inventory table
  for bag = 0, NUM_BAG_FRAMES do
    for slot = 1, C_Container.GetContainerNumSlots(bag) do
      local itemLink = C_Container.GetContainerItemLink(bag, slot)
      local itemName = itemLink and itemLink:match("%[(.-)%]")
      local itemID = C_Container.GetContainerItemID(bag, slot)   -- Retrieve itemID
      table.insert(GoGoMountData.playerInventory, {
        name = itemName,
        itemID = itemID,
        itemLink = itemLink,
        bag = bag,
        slot = slot,
      })
      print(GoGoMountData.playerInventory)
    end
  end
  return GoGoMountData.playerInventory
end

ScanInventory()
function FindMatchingMounts()
  -- Iterate through class forms and spell mounts
  for category, mountData in pairs({ classForms = GoGoMountData.classForms, spellMounts = GoGoMountData.spellMounts }) do
    for spellName, spellID in pairs(mountData) do
      if GoGoMountData.playerKnownSpells[spellName] then
        table.insert(matchingMounts, {
          name = spellID.name,
          spellID = spellID,
          item = spellID.item,
          spell = spellID.spell,
          level = spellID.level,
        })
      end
    end
  end
  return matchingMounts
end

  -- If no suitable special movement found, check for regular mounts
  if #matchedMounts == 0 and playerLevel >= 40 then
    local mountData = FindMatchingMounts()
    local filteredMounts = table.filter(mountData, function(mountInfo)
      return mountInfo.level == playerLevel
    end)
    table.insert(matchedMounts, filteredMounts)
  end
--[[
  -- Select the best available mode of transport
  local bestMode = nil

  -- Prioritize instant forms/aspects if player is moving
  if playerMoving then
    for _, option in pairs(matchedMounts) do
      if option.type == "form" or option.type == "buff" then -- Check for "form" or "buff" types
        bestMode = option
        break
      end
    end
  end

  -- If no instant option found, choose based on speed and usability
  if not bestMode then
    -- Implement logic to prioritize speed and usability criteria
  end

  -- Randomize if multiple options with equal priority
  if #matchedMounts > 1 and not bestMode then
    local randomIndex = math.random(1, #matchedMounts)
    bestMode = matchedMounts[randomIndex]
  end

  -- Use the selected mode
  if bestMode then
    -- Set macro or use ability based on bestMode.type
  end

  return true -- Indicate success
end
]]
-- Function to print mount information for debugging
--[[function DebugMounts(mountList, arg)
  local category = arg and arg:lower() or "class"
  for _, mountData in pairs(mountList) do
    print("Name:", mountData.name)
    print("SpellID:", mountData.spellID)
    print("Icon:", mountData.icon)
    print("IsClassForm:", mountData.isClassForm)
    print("Usable:", mountData.usable)
    print("----------")
  end
end]]--