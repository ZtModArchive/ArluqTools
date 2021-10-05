include "scenario/scripts/misc.lua"

--- Service for time properties
TimeService = {}

---- MONTH ----

--- Get current month
--- @return float
function TimeService.getMonth ()
    return getCurrentMonth()
end

---- TIME ----

--- Get current time of day
--- @return float
function TimeService.getTime ()
    return getCurrentTimeOfDay()
end

--- Get real time
--- @return float
function TimeService.getRealTime ()
    return getRealTime()
end

--- Get sim time
--- @return float
function TimeService.getSimTime ()
    return getCurrentSimTime()
end