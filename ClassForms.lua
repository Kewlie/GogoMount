GoGoMountData.classForms = {
    [783] = {
        name = "Travel Form",
        type = "form",
        level = 30,
        useable = {"outdoors",},
        swim = false, -- can't use in while swimming anyway but for data lookups we might need this to exclude if we have both aqua form and travel form but are swimming
        races = {GoGoMountData.raceID[4],GoGoMountData.raceID[5],},
    },
    [768] = {
        name = "Cat Form",
        type = "form",
        level = 20,
        useable = {"indoors","outdoors",},
        swim = false, -- can use swimming but for logic we want to shift into Aquatic Form
        races = {GoGoMountData.raceID[4],GoGoMountData.raceID[5]},
    },
    [5061] = {
        name = "Aquatic Form",
        type = "form",
        useable = {"outdoors",},
        level = 16,
        swim = true,
        races = {GoGoMountData.raceID[4],GoGoMountData.raceID[5]}, -- this data is pulling raceId[4] and [5] from the global table wich inidcate that race = night elf and tauren
    },
    [2645] = {
        name = "Ghost Wolf",
        type = "buff",
        level = 20,
        useable = {"outdoors",},
        swim = "false",
        races = {GoGoMountData.raceID[2],GoGoMountData.raceID[5],GoGoMountData.raceID[8]},
    },
    [5118] = {
        name = "Aspect of the Cheetah",
        type = "buff",
        level = 20,
        useable = {"indoors","outdoors",},
        swim = false,
        races = {GoGoMountData.raceID[2],GoGoMountData.raceID[4],GoGoMountData.raceID[5],GoGoMountData.raceID[6],GoGoMountData.raceID[8]},
    },
    [13159] = {
        name = "Aspect of the Pack",
        type = "buff",
        level = 40,
        swim = false,
        races = {GoGoMountData.raceID[2],GoGoMountData.raceID[4],GoGoMountData.raceID[5],GoGoMountData.raceID[6],GoGoMountData.raceID[8]},
    },
}