include "scenario/scripts/misc.lua"

--- Service for zoo management
ZooService = {}

---- ANIMALS ----

--- Get number of animals put up for adoption
--- @return float
function ZooService.getAnimalsPutUpForAdoption  ()
    return getAnimalsPutUpForAdoption()
end

--- Get number of released animals
--- @return float
function ZooService.getAnimalsReleased  ()
    return getAnimalsReleased()
end

---- BALLOONS ----

--- Give balloons
function ZooService.giveBalloons   ()
    giveBalloons ()
end

---- ENTRANCE ----

--- Get zoo entrance position
--- @return table
function ZooService.getZooEntrancePos  ()
    return getZooEntrancePos()
end

---- FAME ----

--- Get zoo fame
--- @return float
function ZooService.getZooFame   (cash)
    return getZooFame(cash)
end

---- FINANCE ----

--- Give cash
--- @param cash float
function ZooService.giveCash  (cash)
    giveCash(cash)
end

---- GUESTS ----

--- Get total guest count
--- @return float
function ZooService.getNumGuests ()
    return getNumGuests()
end

---- NAME ----

--- Get zoo name
--- @return string
function ZooService.getZooName ()
    return getZooName ()
end