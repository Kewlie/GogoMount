local GetContainerNumSlots = C_Container.GetContainerNumSlots
local GetContainerItemLink = C_Container.GetContainerItemLink
local playerClass = UnitClass("player")
local playerRace = UnitRace("player")
local playerLevel = UnitLevel("player")
local outside = IsOutdoors()
local swimming = IsSwimming()
local inCombat = InCombatLockdown()

local playerKnownSpells = {}  -- Declare table outside the function

  function ScanPlayerSpellbook()
    -- Clear any previous data
    playerKnownSpells = {}
  
    for i = 1, GetNumSpellTabs() do
      local offset, numSlots = select(3, GetSpellTabInfo(i))
  
      for j = offset + 1, offset + numSlots do
        local spellName, _, spellID = GetSpellBookItemName(j, BOOKTYPE_SPELL)
        playerKnownSpells[spellID] = spellName
      end
    end
  return playerKnownSpells
end
-- Call the function to populate the table
ScanPlayerSpellbook()

-- Function to find matching mounts
function FindMatchingMounts()
  local matchingMounts = {}

  -- Iterate through class forms and spell mounts
  for category, mountData in pairs({ classForms = GoGoMountData.classForms, spellMounts = GoGoMountData.spellMounts }) do
    for spellName, spellID in pairs(mountData) do
      if playerKnownSpells[spellName] then
        table.insert(matchingMounts, {
          name = spellName,
          spellID = spellID,
          category = category,
          -- ... other relevant data
        })
      end
    end
  end

  return matchingMounts
end

local matchingMounts = FindMatchingMounts()

-- Print the names of the matching mounts
for _, mountData in pairs(matchingMounts) do
  print("Matching mount:", mountData.name)
end


-- Function to print mount information for debugging
function DebugMounts(mountList, arg)
  local category = arg and arg:lower() or "class"
  for _, mountData in pairs(mountList) do
    print("Name:", mountData.name)
    print("SpellID:", mountData.spellID)
    print("Icon:", mountData.icon)
    print("IsClassForm:", mountData.isClassForm)
    print("Usable:", mountData.usable)
    print("----------")
  end
end

-- Unused function for bag scanning (commented out)
--[[
function GoGo_GetMounts(inventoryMounts)
  local list = {}
  if (table.getn(inventoryMounts) > 0) then
    for bag = 0, NUM_BAG_FRAMES do
      for slot = 1, GetContainerNumSlots(bag) do
        local name = GetContainerItemLink(bag, slot) or ""
        for index, value in ipairs(inventoryMounts) do
          if string.find(name, value) then table.insert(list, {name = name, bag = bag, slot = slot}) end
        end
      end
    end
  end
end
--]]
