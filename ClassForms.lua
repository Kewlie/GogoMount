-- Note: raceID table is located in GoGoMountData, using the refrenced table since we are storing the data anyway
-- to me this is a neat way of doing it since we can then use smart logic like table.find(playerClass, GoGoMountData.raceID)
-- and then select spells / mounts that are useable for the current played class
local GoGoMountData = _G.GoGoMountData or {}


classForms = {
    [783] = {
        name = "Travel Form",
        type = "form",
        level = 30,
        useable = { "outdoors", },
        combat = true,
        swim = false,
        loc = nil,
        races = { GoGoMountData.raceID[4], GoGoMountData.raceID[5], },
    },
    [768] = {
        name = "Cat Form",
        type = "form",
        level = 20,
        useable = { "indoors", "outdoors", },
        combat = true,
        swim = false,
        loc = nil,
        races = { GoGoMountData.raceID[4], GoGoMountData.raceID[5] },
    },
    [1066] = {
        name = "Aquatic Form",
        type = "form",
        useable = { "outdoors", },
        level = 16,
        combat = true,
        swim = true,
        loc = nil,
        races = { GoGoMountData.raceID[4], GoGoMountData.raceID[5] },
    },
    [2645] = {
        name = "Ghost Wolf",
        type = "buff",
        level = 20,
        combat = true,
        useable = { "outdoors", },
        swim = "false",
        races = { GoGoMountData.raceID[2], GoGoMountData.raceID[5], GoGoMountData.raceID[8] },
    },
    [5118] = {
        name = "Aspect of the Cheetah",
        type = "buff",
        level = 20,
        useable = { "indoors", "outdoors", },
        combat = true,
        swim = false,
        loc = nil,
        races = { GoGoMountData.raceID[2], GoGoMountData.raceID[4], GoGoMountData.raceID[5], GoGoMountData.raceID[6], GoGoMountData.raceID[8] },
    },
    [13159] = {
        name = "Aspect of the Pack",
        type = "buff",
        level = 40,
        useable = { "indoors", "outdoors", },
        combat = true,
        swim = false,
        loc = nil,
        races = { GoGoMountData.raceID[2], GoGoMountData.raceID[4], GoGoMountData.raceID[5], GoGoMountData.raceID[6], GoGoMountData.raceID[8] },
    },
}

_G.GoGoMountData.classForms = classForms