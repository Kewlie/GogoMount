local GoGoMount = CreateFrame("Frame")
GoGoMount:RegisterEvent("ADDON_LOADED")
GoGoMount:RegisterEvent("PLAYER_LOGIN")
GoGoMount:RegisterEvent("PLAYER_REGEN_ENABLED") -- Added for secure buttons
GoGoMount:RegisterEvent("UNIT_AURA")
GoGoMount:SetScript("OnEvent", GoGoAddon_OnEvent)
---@class GoGoMountFrame : Frame

-- Class forms data (accessible from other files)
local GoGoMountData = _G.GoGoMountData  -- Create the table if it doesn't exist
--GoGoMountData.classForms = require("ClassForms")  -- Load the classForms data
--GoGoMountData.spellMounts = require("SpellMounts") -- Load the Spell Based Mounts
--GoGoMountData.itemMounts = require("ItemMounts") -- Load the Item Based Mounts

-- SetKeyBind in WoW Interface Options
local defaultKeybind = "`"  -- Replace "`" with your desired default key
local optionsFrame = CreateFrame("Frame", "GoGoMountOptionsFrame", UIParent)
optionsFrame.name = "GoGoMount"  -- Now allowed using ---@class
InterfaceOptions_AddCategory(optionsFrame)
local keybindButton = CreateFrame("Button", "GoGoMountKeybindButton", optionsFrame, "UIPanelButtonTemplate")
keybindButton:SetText("Mount")
keybindButton:SetPoint("TOPLEFT", optionsFrame, "TOPLEFT", 15, -15)
local defaultLabel = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
defaultLabel:SetText("Default Keybind: " .. defaultKeybind)
defaultLabel:SetPoint("TOPLEFT", keybindButton, "BOTTOMLEFT", 0, -5)
keybindButton:SetScript("OnClick", function()
  -- ... (keybind setup code)
end)

-- Slash Commands
SlashCmdList["GOGOMOUNT"] = GoGoMount_SlashCommand
SLASH_GOGOMOUNT1 = "/gogomount"  -- Redundant slash command removed
SLASH_GOGOMOUNT2 = "/ggm"  -- Redundant slash command removed
SLASH_GOGOMOUNT3 = "/mountlist"  -- Primary slash command
SLASH_GOGOMOUNT4 = "/ml"  -- Optional shorter version

-- Event handler
function GoGoAddon_OnEvent(self, event, arg1, ...)
  if event == "ADDON_LOADED" and arg1 == "GoGoMount" then
    -- Code to execute when addon is loaded
    DEFAULT_CHAT_FRAME:AddMessage("GoGoMount addon loaded!")
  elseif event == "PLAYER_LOGIN" then
    -- Check for existing keybind and update UI
    local key = GetBindingKey("GoGoMount_Activate")
    if key then
      keybindButton:SetText(key)
    end
  elseif event == "PLAYER_REGEN_ENABLED" then
    ScanPlayerSpellbook()
    -- ... (handle mountButton binding in combat)
  elseif event == "UNIT_AURA" then
    -- ... (handle dismountButton binding based on mounted/dismounted state)
  end
end
