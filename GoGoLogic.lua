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

local function ChooseBestMount(matchedMounts)
  local conditions = {}

  -- Iterate over matchedMounts and create dynamic conditions
  for _, mountData in pairs(matchedMounts) do
    local conditionFunction = function()
      -- Check data validity (optional)
      if not mountData.type or not mountData.name then
        return false
      end
    end
  end
end

--[[
      -- Check form type (adapt for item mounts if needed)
      if mountData.type == "form" then
        -- Apply specific conditions for forms (e.g., level, race, location, swimming)
        -- Adapt these conditions based on your classForms data and priorities
        if ... then
          return true
        end
      else
        -- Add conditions for other mount types (e.g., item mounts)
        if ... then
          return true
        end
      end

      -- Return false if no conditions match
      return false
    end
    conditions[mountData.name] = conditionFunction
  end

  -- Prioritize and select the best mount
  for conditionName, conditionFunction in pairs(conditions) do
    if conditionFunction() then
      -- Get mount ID from the matchedMounts data
      local mountID = mountData.spellID or mountData.itemID -- Adjust for spell/item mounts
      if mountID then
        return mountID
      end
    end
  end

  -- Return default mount ID if none match
  return GetDefaultMountID()
end
]]--
_G.GoGoMountData = GoGoMountData