local _, GoGoMountData = ...
GoGoMountData = {}

-- Storing ClassID as assigned by Blizzard
GoGoMountData.classIndex = {
    [1] = "WARRIOR",
    [2] = "PALADIN",
    [3] = "HUNTER",
    [4] = "ROGUE",
    [5] = "PRIEST",
    [6] = nil,
    [7] = "SHAMAN",
    [8] = "MAGE",
    [9] = "WARLOCK",
    [10] = nil,
    [11] = "DRUID",
}

--Storing RaceID as assigned by Blizzard
GoGoMountData.raceID = {
    [1] = "HUMAN",
    [2] = "ORC",
    [3] = "UNDEAD",
    [4] = "NIGHT ELF",
    [5] = "TAUREN",
    [6] = "DWARF",
    [7] = "GNOME",
    [8] = "TROLL",
}
-- Storing Factions (TABLE) as assigned by Blizzard

-- we could just call apon C_CreatureInfo.GetFactionInfo(GetUnitRace("player")) but having this hard coded prevents api calls
GoGoMountData.factions = {
    ALLIANCE = {
        GoGoMountData.raceID[1],
        GoGoMountData.raceID[4],
        GoGoMountData.raceID[6],
        GoGoMountData.raceID[7],
    },
    HORDE = { 
        GoGoMountData.raceID[2],
        GoGoMountData.raceID[3],
        GoGoMountData.raceID[5],
        GoGoMountData.raceID[8],
    },
}
--Storing RaceID to Faction ALLIANCE as a string (maybe not needed)
GoGoMountData.allRaceA = table.concat(GoGoMountData.factions.ALLIANCE, ",")
--Storing RaceID to Faction HORDE as a string (maybe not needed)
GoGoMountData.allRaceH = table.concat(GoGoMountData.factions.HORDE, ",")
--Storing RaceID to Both Factions as a string (maybe not needed)
GoGoMountData.allRaceB = table.concat(GoGoMountData.factions.ALLIANCE, ",") .. "," .. table.concat(GoGoMountData.factions.HORDE, ",")

--just in case we need to call apon it via string search
function CustomConcat(table, separator)
    local result = ""
    for key, value in pairs(table) do
        if key ~= 6 and key ~= 10 then -- Exclude specific indices
            if result ~= "" then
                result = result .. separator
            end
            result = result .. value
        end
    end
    return result
end
_G.GoGoMountData = GoGoMountData