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
  print("Starting spellbook scan...")  -- Add debugging output
GoGoMountData.playerKnownSpells = {}  -- Clear the table
  for i = 1, GetNumSpellTabs() do
    local offset, numSlots = select(3, GetSpellTabInfo(i))

    for j = offset + 1, offset + numSlots do
      local spellName, _, spellID = GetSpellBookItemName(j, BOOKTYPE_SPELL)
      GoGoMountData.playerKnownSpells[spellID] = spellName
    end
  end
  print("Spellbook scan completed. PlayerKnownSpells:", GoGoMountData.playerKnownSpells)  -- Add debugging output
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
          levelReq = spellID.level,
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