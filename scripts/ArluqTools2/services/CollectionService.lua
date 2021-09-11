-- Include Zoo Tycoon 2 libraries
include "scenario/scripts/entity.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"

--- Service for modifiying lists
CollectionService = {}

--- Get all animals in the zoo
--- @return list
function CollectionService.getAllAnimals()
    local list = findType("animal")
    if list == nil or type(list) ~= "table" then
        return error("No animals found")
    end
    return list
end

--- Get all fences in the zoo
--- @return list
function CollectionService.getAllFences()
    local list = findType("fence")
    if list == nil or type(list) ~= "table" then
        return error("No fences found")
    end
    return list
end

--- Get all guests in the zoo
--- @return list
function CollectionService.getAllGuests()
    local list = findType("Guest")
    if list == nil or type(list) ~= "table" then
        return error("No guests found")
    end
    return list
end

--- Get all staff in the zoo
--- @return list
function CollectionService.getAllStaff()
    local list = findType("Staff")
    if list == nil or type(list) ~= "table" then
        return error("No staff found")
    end
    return list
end

--- Get all entities that match an entity string
--- @param entityString string
--- @return list
function CollectionService.getMatch(entityString)
    local list = findType(entityString)
    if list == nil or type(list) ~= "table" then
        return error("No entities found")
    end
    return list
end

--- Append entity to list
--- @param list list
--- @param entity entity
function CollectionService.appendEntity(list, entity)
    table.insert(list, entity)
end

--- Append list to list
--- @param baseList list
--- @param addList list
function CollectionService.appendList(baseList, addList)
    table.insert(baseList, unpack(addList))
end