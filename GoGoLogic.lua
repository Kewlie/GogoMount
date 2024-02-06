local GetContainerNumSlots = C_Container.GetContainerNumSlots
local GetContainerItemLink = C_Container.GetContainerItemLink
local GoGoMountData = _G.GoGoMountData or {}
local playerClass = UnitClass("player")
local playerRace = UnitRace("player")
local playerLevel = UnitLevel("player")
local outside = IsOutdoors()
local swimming = IsSwimming("player")
local inCombat = InCombatLockdown()
local knownSpells = {}
local playerItems = {}
local matchedMounts = {}
-- Scan player Spellook store data in GoGoMountData.knownPlayerSpells

function ScanPlayerSpellbook()
  GoGoMountData.knownSpells = {} -- Clear the table
  for i = 1, GetNumSpellTabs() do
    local offset, numSlots = select(3, GetSpellTabInfo(i))

    for j = offset + 1, offset + numSlots do
      local spellName, _, spellID = GetSpellBookItemName(j, BOOKTYPE_SPELL)
      GoGoMountData.knownSpells[spellID] = spellName
    end
  end
  return GoGoMountData.knownSpells

end
ScanPlayerSpellbook() -- run the function to scan player Spellbook


-- Initialize inventory table with itemIDs
function ScanInventory()
playerItems = {} -- clear the playerItems table
  for bag = 0, NUM_BAG_FRAMES do
    for slot = 1, C_Container.GetContainerNumSlots(bag) do
      local itemID = C_Container.GetContainerItemID(bag, slot)
      local itemLink = C_Container.GetContainerItemLink(bag, slot)
      local itemName = itemLink and itemLink:match("%[(.-)%]")

      if itemName then
        -- Store only essential information for matching and verification
        table.insert(playerItems, {
          itemID = itemID,
          itemName = itemName,
          itemLink = itemLink,
        })

        -- Print only itemID and name for concise output
        --print("itemID:", itemID, "- name:", itemName)
      end
      GoGoMountData.playerItems = playerItems
    end
  end
  --print("playerInventory has been populated")
end
ScanInventory()

function findMatchingSpells()
  local matchedMounts = {}

  for spellID, spellData in pairs(_G.GoGoMountData.classForms) do  -- Use spellID as key
    if _G.GoGoMountData.knownSpells[spellID] then  -- Check known spells using spellID
      table.insert(matchedMounts, spellData)
    end
  end

  for spellID, spellData in pairs(_G.GoGoMountData.spellMounts) do  -- Use spellID as key
    if _G.GoGoMountData.knownSpells[spellID] then  -- Check known spells using spellID
      table.insert(matchedMounts, spellData)
    end
  end

  GoGoMountData.matchedMounts = matchedMounts
end
findMatchingSpells()
if not GoGoMountData.matchingMounts then
  print("Sorry you have no way to increase your movement")
  print("Please play a druid :D")
  GoGoMountData.matchedMounts = {}
end
_G.GoGoMountData = GoGoMountData