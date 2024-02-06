-- Note: raceID table is located in GoGoMountData, using the refrenced table since swim = false, we are storing the data anyway
-- to me this is a neat way of doing it since we can then use smart logic like table.find(playerClass, GoGoMountData.raceID)
-- and then select spells / mounts that are useable for the current played class
local GoGoMountData = _G.GoGoMountData or {}

GoGoMountData.itemMounts = {

  [15277] = {
    name = "Gray Kodo",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40,
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Kodo Riding"
  },

  [18795] = {
    name = "Great Gray Kodo",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Kodo Riding"
  },

  [15290] = {
    name = "Brown Kodo",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Kodo Riding"
  },

  [18794] = {
    name = "Great White Kodo",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Kodo Riding"
  },

  [18793] = {
    name = "Great White Kodo",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Kodo Riding"
  },

  -- UNDEAD Skeletal Horses

  [13332] = {
    name = "Blue Skeletal Horse",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[8]
    },
    skill = "Undead Horsemanship"
  },

  [13333] = {
    name = "Brown Skeletal Horse",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[8]
    },
    skill = "Undead Horsemanship"
  },

  [13331] = {
    name = "Red Skeletal Horse",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[8]
    },
    skill = "Undead Horsemanship"
  },

  [18791] = {
    name = "Purple Skeletal Warhorse",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[8]
    },
    skill = "Undead Horsemanship"
  },

  [13334] = {
    name = "Green Skeletal Warhorse",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[8]
    },
    skill = "Undead Horsemanship"
  },

  -- Orc Wolves
  [5668] = {
    name = "Horn of the Brown Wolf",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Wolf Riding",
  },

  [5665] = {
    name = "Horn of the Dire Wolf",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Wolf Riding"
  },

  [1132] = {
    name = "Horn of the Timber Wolf",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Wolf Riding",
  },

  [18798] = {
    name = "Horn of the Swift Gray Wolf",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Wolf Riding"
  },

  [18796] = {
    name = "Horn of the Swift Brown Wolf",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Wolf Riding"
  },

  [18797] = {
    name = "Horn of the Swift Timber Wolf",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Wolf Riding"
  },

  -- TROLL Raptors

  [8592] = {
    name = "Whistle of the Violet Raptor",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Raptor Riding"
  },

  [8591] = {
    name = "Whistle of the Turquoise Raptor",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
  },

  [8588] = {
    name = "Whistle of the Emerald Raptor",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Raptor Riding"
  },

  [18790] = {
    name = "Whistle of the Orange Raptor",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Raptor Riding"
  },

  [18789] = {
    name = "Whistle of the Olive Raptor",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Raptor Riding"
  },

  [18788] = {
    name = "Whistle of the Blue Raptor",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Raptor Riding"
  },


  --ALLIANCE Mounts

  [13086] = {
    name = "Reins of the Winterspirng Frostsaber",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Tiger Riding",
  },

  -- DWARF Rams
  [5873] = {
    name = "White Ram",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6]
    },
    skill = "Ram Riding"
  },

  [5872] = {
    name = "Brown Ram",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6]
    },
    skill = "Ram Riding"
  },

  [5864] = {
    name = "Gray Ram",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6]
    },
    skill = "Ram Riding"
  },

  [18785] = {
    name = "Swift White Ram",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6]
    },
    skill = "Ram Riding"
  },

  [18786] = {
    name = "Swift Brown Ram",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6]
    },
    skill = "Ram Riding"
  },

  [18787] = {
    name = "Swift Gray Ram",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6]
    },
    skill = "Ram Riding"
  },

  -- GNOME Mechanostrider

  [13321] = {
    name = "Green Mechanostrider",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, -- Level Requirement to use the Mount
    races = {
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7]
    },
    skill = "Mechanostrider Piloting"
  },

  [13322] = {
    name = "Unpainted Mechanostrider",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, -- Level Requirement to use the Mount
    races = {
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7]
    },
    skill = "Mechanostrider Piloting"
  },

  [8563] = {
    name = "Red Mechanostrider",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, -- Level Requirement to use the Mount
    races = {
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7]
    },
    skill = "Mechanostrider Piloting"
  },

  [8595] = {
    name = "Blue Mechanostrider",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, -- Level Requirement to use the Mount
    races = {
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7]
    },
    skill = "Mechanostrider Piloting"
  },

  [18772] = {
    name = "Swift Green Mechanostrider",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, -- Level Requirement to use the Mount
    races = {
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7]
    },
    skill = "Mechanostrider Piloting"
  },

  [18773] = {
    name = "Swift White Mechanostrider",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7]
    },
    skill = "Mechanostrider Piloting"
  },

  [18774] = {
    name = "Swift Yellow Mechanostrider",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7]
    },
    skill = "Mechanostrider Piloting"
  },

  -- HUMAN Horses

  [2414] = {
    name = "Pinto Bridle",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Horse Riding"
  },

  [5656] = {
    name = "Brown Horse Bridle",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Horse Riding"
  },

  [5655] = {
    name = "Chestnut Mare Bridle",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Horse Riding"
  },

  [18776] = {
    name = "Swift Palomino",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Horse Riding"
  },

  [18777] = {
    name = "Swift Brown Steed",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Horse Riding"
  },

  [18778] = {
    name = "Swift White Steed",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Horse Riding"
  },

  -- NIGHT ELF Nightsaber

  [8632] = {
    name = "Reins of the Spotted Frostsaber",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Tiger Riding"
  },

  [8631] = {
    name = "Reins of the Striped Frostsaber",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Tiger Riding"
  },

  [8629] = {
    name = "Reins of the Striped Nightsaber",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 40, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Tiger Riding"
  },

  [18902] = {
    name = "Reins of the Swift Stormsaber",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Tiger Riding",
  },

  [18767] = {
    name = "Reins of the Swift Mistsaber",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Tiger Riding"
  },

  [18766] = {
    name = "Reins of the Swift Frostsaber",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Tiger Riding"
  },

  --PVP HORDE

  [19029] = {
    name = "Horn of the Frostwolf Howler",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60,
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = nil
    --Reputation -- Exhaulted with Frostwolf Clan "Alterac Valley"
  },

  [18245] = {
    name = "Horn of the Black War Wolf",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Wolf Riding",
    --pvpRank = "Lieutenant General", -- Rank 11?
  },

  [18247] = {
    name = "Black War Kodo",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Kodo Riding",
    --pvpRank = "Lieutenant General", -- Rank 11?
  },

  [18246] = {
    name = "Whistle of the Black War Raptor",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Raptor Riding",
    --pvpRank = "Lieutenant General", -- Rank 11?
  },

  [18248] = {
    name = "Red Skeletal Warhorse",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[8],
    },
    skill = "Undead Horsmaneship",
    --pvpRank = "Lieutenant General", -- Rank 11?
  },

  --PVP ALLIANCE

  [18241] = {
    name = "Black War Steed Bridle",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Horse Riding",
    --pvpRank = "Lieutenant General", -- Rank 11?
  },

  [18244] = {
    name = "Black War Ram",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Ram Riding",
    --pvpRank = "Lieutenant General", -- Rank 11?
  },

  [18242] = {
    name = "Reins of the Black War Tiger",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Tiger Riding",
    --pvpRank = "Lieutenant General", -- Rank 11?
  },

  [18243] = {
    name = "Black Battlestrider",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
    },
    skill = "Mechanostrider Piloting",
    --pvpRank = "Lieutenant General", -- Rank 11?
  },

  -- PVE Dropped Mounts

  [13335] = {
    name = "Deathcharger's Reins",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
      GoGoMountData.raceID[8],
    },
    skill = nil,
  },

  [19872] = {
    name = "Swift Razzashi Raptor",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
      GoGoMountData.raceID[8],
    },
    skill = nil,
  },

  [19902] = {
    name = "Swift Zulian Tiger",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc  = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
      GoGoMountData.raceID[8],
    },
    skill = nil,
  },

  -- AQ Bugs

  [21218] = {
    name = "Blue Qiraji Resonating Crystal",
    type = "item",
    useable = "outdoors",
    combat = false,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
      GoGoMountData.raceID[8],
    },
    skill = nil,
    loc = "Ahn'Qiraj"
  },

  [21323] = {
    name = "Green Qiraji Resonating Crystal",
    type = "item",
    useable = "outdoors",
    combat = false,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
      GoGoMountData.raceID[8],
    },
    skill = nil,
    loc = "Ahn'Qiraj"
  },

  [21321] = {
    name = "Red Qiraji Resonating Crystal",
    type = "item",
    useable = "outdoors",
    combat = false,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
      GoGoMountData.raceID[8],
    },
    skill = nil,
    loc = "Ahn'Qiraj"
  },

  [21324] = {
    name = "Yellow Qiraji Resonating Crystal",
    type = "item",
    useable = "outdoors",
    combat = false,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
      GoGoMountData.raceID[8],
    },
    skill = nil,
    loc = "Ahn'Qiraj"
  },

  [21176] = {
    name = "Black Qiraji Resonating Crystal",
    type = "item",
    useable = "outdoors",
    combat = false,
    loc = nil,
    level = 60, --Level Required to Use
    races = {
      GoGoMountData.raceID[1],
      GoGoMountData.raceID[2],
      GoGoMountData.raceID[3],
      GoGoMountData.raceID[4],
      GoGoMountData.raceID[5],
      GoGoMountData.raceID[6],
      GoGoMountData.raceID[7],
      GoGoMountData.raceID[8],
    },
    skill = nil,
  },
}
_G.GoGoMountData = GoGoMountData