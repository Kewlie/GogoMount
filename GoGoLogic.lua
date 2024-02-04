local GetContainerNumSlots = C_Container.GetContainerNumSlots
local GetContainerItemLink = C_Container.GetContainerItemLink
local playerClass = UnitClass("player")
local playerRace = UnitRace("player")
local playerLevel = UnitLevel("player")
local outside = IsOutdoors()
local swimming = IsSwimming()
local inCombat = InCombatLockdown()

GoGoMountData.playerKnownSpells = {}  -- Declare table outside the function

function ScanPlayerSpellbook()
GoGoMountData.playerKnownSpells = {}  -- Clear the table
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
ScanPlayerSpellbook()  -- Call the function to populate the table

-- Function to find matching mounts
local matchingMounts = {}
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
matchingMounts = FindMatchingMounts()
-- Print the names of the matching mounts
for _, mountData in pairs(matchingMounts) do
  print("Matching mount:", mountData.name)
  table.insert(GoGoMountData.matchingMounts, mountData.index)
end

function CanUseMount(playerClass, mountID)
  -- Check class restrictions:
  local allowedClasses = GoGoMountData.spellMounts[mountID].class  -- Assuming class restrictions are stored here
  if allowedClasses and not table.find(allowedClasses, playerClass) then
    return false  -- Mount not usable by this class
  end
   return true
end


GoGoMountData.playerInventory = {}
function ScanInventory()
  print("Scan Inventory Function has been called!, Running Scan now")
  GoGoMountData.playerInventory = {}  -- Initialize inventory table
    for bag = 0, NUM_BAG_FRAMES do
      for slot = 1, C_Container.GetContainerNumSlots(bag) do
        local name = C_Container.GetContainerItemLink(bag, slot)
        local itemID = C_Container.GetContainerItemID(bag, slot)  -- Retrieve itemID
        print(bag, slot)
        table.insert(GoGoMountData.playerInventory, {
          name = name,
          itemID = itemID,
          bag = bag,
          slot = slot,
          })
      end
    end
    return GoGoMountData.playerInventory
end

function ScanInventory()
  print("Scan Inventory Function has been called!, Running Scan now")
  GoGoMountData.playerInventory = {}  -- Initialize inventory table
    for bag = 0, NUM_BAG_FRAMES do
      for slot = 1, C_Container.GetContainerNumSlots(bag) do
        local itemLink = C_Container.GetContainerItemLink(bag, slot)
        local itemName = itemLink and itemLink:match("%[(.-)%]")
        local itemID = C_Container.GetContainerItemID(bag, slot)  -- Retrieve itemID
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

local function smartMountClick()
  if InCombatLockdown() then
    return false -- Do nothing or display a message
  end

  local matchedMounts = {}

  -- Check for special movement abilities first
  local classInfo = GoGoMountData.classForms[playerClass]
  if classInfo then
    for _, formInfo in pairs(classInfo) do
      if formInfo.level <= playerLevel and -- Level restriction
         (not formInfo.outdoors or IsOutdoors()) and -- Outdoor check
         (not formInfo.swim or IsSwimming()) then -- Aquatic check
        table.insert(matchedMounts, formInfo)
      end
    end
  end

  -- If no suitable special movement found, check for regular mounts
  if #matchedMounts == 0 and playerLevel >= 40 then
    local mountData = FindMatchingMounts()
    local filteredMounts = table.filter(mountData, function(mountInfo)
      return mountInfo.level == playerLevel
    end)
    table.insert(matchedMounts, filteredMounts)
  end

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