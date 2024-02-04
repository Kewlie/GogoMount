-- Access class form data from the consolidated object (adjust path if needed)
local classForms = _G.GoGoMountData.classForms

-- Slash command handler
function GoGoMount_SlashCommand(msg)
  -- ... (implement slash command handling logic here)
end

-- Function to scan the spellbook for known class forms
function GoGo_ScanSpellbook()
  local knownForms = {}
  for i = 1, C_SpellBook.GetNumSpellTabs() do
    for j = 1, C_SpellBook.GetNumSpells(i) do
      local spellName = C_SpellBook.GetSpellBookItemName(i, j)
      knownForms[spellName] = true
    end
  end
  return knownForms
end

-- Other functions and logic related to mount retrieval and handling
-- ...

-- Secure buttons (unchanged)
local dismountButton = CreateFrame("Button", "GoGoMountDismountButton", nil, "SecureActionButtonTemplate")
dismountButton:SetAttribute("type", "macro")
dismountButton:SetAttribute("macrotext", "/cancelaura [mounted]; /cancelform [form]; /dismount [mounted]")
-- ... (bind dismountButton to a key)

local mountButton = CreateFrame("Button", "GoGoMountMountButton", nil, "ActionButtonTemplate")
-- ... (don't bind mountButton initially)
