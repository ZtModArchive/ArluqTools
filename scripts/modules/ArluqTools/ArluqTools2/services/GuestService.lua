--- @todo
-- get/set inventory
-- get/set favourite animal type
-- get/set cash

-- Include Zoo Tycoon 2 libraries
include "scenario/scripts/entity.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"

--- Service for modifiying guests
GuestService = {}


---- AMUSEMENT ----

--- Get guest amusement stat
--- @param guest guest
--- @return float
function GuestService.getAmusement (guest)
    return guest:BFG_GET_ATTR_FLOAT("amusement")
end

--- Set guest amusement stat
--- @param guest guest
--- @param amusement float
function GuestService.setAmusement (guest, amusement)
    setNeed(guest, "amusement", amusement)
end

---- BATHROOM ----

--- Get guest bathroom stat
--- @param guest guest
--- @return float
function GuestService.getBathroom (guest)
    return guest:BFG_GET_ATTR_FLOAT("bathroom")
end

--- Set guest bathroom stat
--- @param guest guest
--- @param bathroom float
function GuestService.setBathroom (guest, bathroom)
    setNeed(guest, "bathroom", bathroom)
end

---- DELETE ----

--- Delete guest
--- @param guest guest
function GuestService.delete (guest)
    deleteEntity(guest)
end

---- FAVORITE ----

--- Set favorite animal
--- @param guest guest
--- @param species species
function GuestService.setFavorite (guest, species)
    if species == nil then
        species = getSpeciesFromType(getRandomAnimalType())
    end
    guest:sendMessage("ZTAI_SET_FAVORITE_ANIMAL", species)
end

---- DESSERT ----

--- Get guest dessert stat
--- @param guest guest
--- @return float
function GuestService.getDessert (guest)
    return guest:BFG_GET_ATTR_FLOAT("dessert")
end

--- Set guest dessert stat
--- @param guest guest
--- @param dessert float
function GuestService.setDessert (guest, dessert)
    setNeed(guest, "dessert", dessert)
end

---- GENDER ----

--- Get guest gender, returns true if male, false if female
--- @param guest guest
--- @return bool
function GuestService.getGender (guest)
    return guest:BFG_GET_ATTR_BOOLEAN("b_Male")
end

--- Get guest gender as sting
--- @param guest guest
--- @return string
function GuestService.getGenderString (guest)
    local isMale = guest:BFG_GET_ATTR_BOOLEAN("b_Male")
    if isMale then
        return "M"
    end
    return "F"
end

---- GIFT ----

--- Get guest gift stat
--- @param guest guest
--- @return float
function GuestService.getGift (guest)
    return guest:BFG_GET_ATTR_FLOAT("gift")
end

--- Set guest gift stat
--- @param guest guest
--- @param gift float
function GuestService.setGift (guest, gift)
    setNeed(guest, "gift", gift)
end

---- HUNGER ----

--- Get guest hunger
--- @param guest guest
--- @return float
function GuestService.getHunger (guest)
    return guest:BFG_GET_ATTR_FLOAT("hunger")
end

--- Set guest hunger
--- @param guest guest
--- @param hunger float
function GuestService.setHunger (guest, hunger)
    setNeed(guest, "hunger", hunger)
end

---- VARIANTS ----

--- Morph into businessman
--- @param guest guest
function GuestService.morphBusiness (guest)
    guest:BFG_ENTITY_MORPH_TO_NEW_ENTITY("Guest_Adult_M_Business")
end

--- Morph into caveman
--- @param guest guest
function GuestService.morphCaveman (guest)
    guest:BFG_ENTITY_MORPH_TO_NEW_ENTITY("Guest_Adult_M_Caveman")
end

--- Morph into hippie
--- @param guest guest
function GuestService.morphHippie (guest)
    guest:BFG_ENTITY_MORPH_TO_NEW_ENTITY("Guest_Adult_M_Photographer")
end

--- Morph into oceanographer
--- @param guest guest
function GuestService.morphOceanographer (guest)
    guest:BFG_ENTITY_MORPH_TO_NEW_ENTITY("Guest_Adult_M_Oceanographer")
end

--- Morph into photographer
--- @param guest guest
function GuestService.morphPhotographer (guest)
    guest:BFG_ENTITY_MORPH_TO_NEW_ENTITY("Guest_Adult_M_Photographer")
end

--- Morph into pirate
--- @param guest guest
function GuestService.morphPirate (guest)
    guest:BFG_ENTITY_MORPH_TO_NEW_ENTITY("Guest_Adult_M_Pirate")
end

--- Morph into rockstar
--- @param guest guest
function GuestService.morphRockstar (guest)
    guest:BFG_ENTITY_MORPH_TO_NEW_ENTITY("Guest_Adult_F_Rockstar")
end

--- Morph into scientist
--- @param guest guest
function GuestService.morphScientist (guest)
    guest:BFG_ENTITY_MORPH_TO_NEW_ENTITY("Guest_Adult_M_Scientist")
end

---- NAME ----

--- Get guest name
--- @param guest guest
--- @return string
function GuestService.getName (guest)
    return guest:BFG_GET_ATTR_STRING("s_name")
end

--- Set guest name
--- @param guest guest
--- @param name string
function GuestService.setName (guest, name)
    guest:BFG_SET_ATTR_STRING("s_name", name)
end

---- REST ----

--- Get guest rest stat
--- @param guest guest
--- @return float
function GuestService.getRest (guest)
    return guest:BFG_GET_ATTR_FLOAT("rest")
end

--- Set guest rest stat
--- @param guest guest
--- @param rest float
function GuestService.setRest (guest, rest)
    setNeed(guest, "rest", rest)
end

---- SOCIAL ----

--- Get guest social stat
--- @param guest guest
--- @return float
function GuestService.getSocial (guest)
    return guest:BFG_GET_ATTR_FLOAT("social")
end

--- Set guest social stat
--- @param guest guest
--- @param social float
function GuestService.setSocial (guest, social)
    setNeed(guest, "social", social)
end

---- THIRST ----

--- Get guest thirst
--- @param guest guest
--- @return float
function GuestService.getThirst (guest)
    return guest:BFG_GET_ATTR_FLOAT("thirst")
end

--- Set guest thirst
--- @param guest guest
--- @param thirst float
function GuestService.setThirst (guest, thirst)
    setNeed(guest, "thirst", thirst)
end

---- VIEWANIMALS ----

--- Get guest viewanimals stat
--- @param guest guest
--- @return float
function GuestService.getViewAnimals (guest)
    return guest:BFG_GET_ATTR_FLOAT("viewanimals")
end

--- Set guest viewanimals stat
--- @param guest guest
--- @param viewanimals float
function GuestService.setViewAnimals (guest, viewanimals)
    setNeed(guest, "viewanimals", viewanimals)
end