
local GoGoMount = CreateFrame("Frame")
GoGoMount:RegisterEvent("ADDON_LOADED")
GoGoMount:RegisterEvent("PLAYER_LOGIN")  -- Trigger the scan upon login
GoGoMount:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Optional, if needed for other purposes
GoGoMount:RegisterEvent("UNIT_AURA")
GoGoMount:SetScript("OnEvent", GoGoAddon_OnEvent)


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
SlashCmdList["GOGOMOUNT"] = function(msg, editbox)
SLASH_GOGOMOUNT1 = "/gogomount"  -- Redundant slash command removed
SLASH_GOGOMOUNT2 = "/ggm"  -- Redundant slash command removed
SLASH_GOGOMOUNT3 = "/mountlist"  -- Primary slash command
SLASH_GOGOMOUNT4 = "/ml"  -- Optional shorter version
end

-- Event handler
function GoGoAddon_OnEvent(self, event, arg1, ...)
  if event == "PLAYER_LOGIN" then
--    local logic = require("GoGoLogic")
--    if logic then print("Logic Loaded!") end
    print("GoGoMount Addon Loaded")    -- Check for existing keybind and update UI
    ScanPlayerSpellbook()  -- Call the function on load so that we can populate data from the game client
    ScanInventory()
    --[[elseif event == "PLAYER_REGEN_ENABLED" then
      ScanPlayerSpellbook()
    ScanInventory() -- call function here to keep data up to date or maybe register spell book change?
    else return nil]]--
    end
end