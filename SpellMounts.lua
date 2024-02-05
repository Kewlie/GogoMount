-- Note: raceID table is located in GoGoMountData, using the refrenced table since we are storing the data anyway
-- to me this is a neat way of doing it since we can then use smart logic like table.find(playerClass, GoGoMountData.raceID)
-- and then select spells / mounts that are useable for the current played class


GoGoMountData.spellMounts = {
    [13819] = {
        name = "Summon Warhorse",
        level = 40,
        type = "spell",
        useable = "outdoors",
        combat = false,
        loc = nil,
        class = GoGoMountData.classIndex[2],
        races = {
            GoGoMountData.raceID[1],
            GoGoMountData.raceID[6]
        },
        skill = nil,
    },
    [23214] = {
        name = "Summon Charger",
        level = 60,
        type = "spell",
        useable = "outdoors",
        combat = false,
        loc = nil,
        class = GoGoMountData.classIndex[2],
        races = {
            GoGoMountData.raceID[1],
            GoGoMountData.raceID[6]
        },
        skill = nil,
    },
    [5784] = {
        name = "Summon Felsteed",
        level = 40,
        type = "spell",
        useable = "outdoors",
        combat = false,
        loc = nil,
        class = GoGoMountData.classIndex[9],
        races = {
            GoGoMountData.raceID[1],
            GoGoMountData.raceID[2],
            GoGoMountData.raceID[3],
            GoGoMountData.raceID[7],
        },
        skill = nil,
    },
    [23161] = {
        name = "Summon Dreadsteed",
        level = 60,
        type = "spell",
        useable = "outdoors",
        combat = false,
        loc = nil,
        class = GoGoMountData.classIndex[9],
        races = {
            GoGoMountData.raceID[1],
            GoGoMountData.raceID[2],
            GoGoMountData.raceID[3],
            GoGoMountData.raceID[7],
        },
        skill = nil,
    },
}