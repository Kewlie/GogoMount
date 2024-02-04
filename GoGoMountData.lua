local _, GoGoMountData = ...
_G.GoGoMountData = {}

--nesting classForms, itemMounts, and spellMounts into GoGoMountData
GoGoMountData = GoGoMountData

--Storing Race information in GoGoMountData
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

-- Listing Blizzard Index for Playable Classes
GoGoMountData.classNumbers = {
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
-- spliting races into faction (possibly won't be needed since refrencing factions on mount tables for global setup seems to bug out)
GoGoMountData.factions = {
ALLIANCE = {GoGoMountData.raceID[1], GoGoMountData.raceID[4], GoGoMountData.raceID[6], GoGoMountData.raceID[7]},
HORDE = {GoGoMountData.raceID[2], GoGoMountData.raceID[3], GoGoMountData.raceID[5], GoGoMountData.raceID[8]},
}

--Concating by custom methods to retain the index while in string form to store
--just in case we need to call apon it via string search
function customConcat(table, separator)
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
GoGoMountData.classIndex = customConcat(GoGoMountData.classNumbers, ",")

--Setting concated tables within GoGoMountData for Faction information
GoGoMountData.allRaceA = table.concat(GoGoMountData.factions.ALLIANCE, ",")
GoGoMountData.allRaceH = table.concat(GoGoMountData.factions.HORDE, ",")
GoGoMountData.allRaceB = table.concat(GoGoMountData.factions.ALLIANCE, ",") .. "," .. table.concat(GoGoMountData.factions.HORDE, ",")

_G.GoGoMountData = GoGoMountData