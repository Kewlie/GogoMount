--local GoGoMountData.classForms = _G.GoGoMountData


GoGoMountData.classForms = {
    [783] = {
        name = "Travel Form",
        item = false,
        level = 30,
        outdoors = true,
        swim = false,
        races = {
            GoGoMountData.raceID[4],
            GoGoMountData.raceID[5],
        },
    },
    [768] = {
        name = "Cat Form",
        item = false,
        level = 20,
        outdoors = true,
        swim = false,
        races = {
            GoGoMountData.raceID[4],
            GoGoMountData.raceID[5]
        },
    },
    [5061] = {
        name = "Aquatic Form",
        item = false,
        level = 16,
        outdoors = nil,
        swim = true,
        races = {
            GoGoMountData.raceID[4],
            GoGoMountData.raceID[5]
        },
    },
    [2645] = {
        name = "Ghost Wolf",
        item = false,
        level = 20,
        outdoors = true,
        races = {
            GoGoMountData.raceID[2],
            GoGoMountData.raceID[5],
            GoGoMountData.raceID[8]
        },
    },
    [5118] = {
        name = "Aspect of the Cheetah",
        item = false,
        level = 20,
        group = false,
        races = {
            GoGoMountData.raceID[2],
            GoGoMountData.raceID[4],
            GoGoMountData.raceID[5],
            GoGoMountData.raceID[6],
            GoGoMountData.raceID[8]
        },
    },
    [13159] = {
        name = "Aspect of the Pack",
        item = false,
        level = 40,
        group = true,
        races = {
            GoGoMountData.raceID[2],
            GoGoMountData.raceID[4],
            GoGoMountData.raceID[5],
            GoGoMountData.raceID[6],
            GoGoMountData.raceID[8]
        },
    },
}