--- @todo
-- suppressing rampage
-- get/set variations
-- get/set skin variations
-- get/set deletable

-- Include Zoo Tycoon 2 libraries
include "scenario/scripts/entity.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"

--- Service for modifiying animals
AnimalService = {}

---- ADOPTION ----

--- Get whether or not an animal can be put up for adoption
--- @param animal animal
--- @return bool
function AnimalService.getAdoptOption (animal)
    return animal:BFG_GET_ATTR_BOOLEAN("b_showAdopt")
end

--- Set whether or not an animal can be put up for adoption
--- @param animal animal
--- @param canBeAdopted bool
function AnimalService.setAdoptOption (animal, canBeAdopted)
    animal:BFG_SET_ATTR_BOOLEAN("b_showAdopt", canBeAdopted)
end

---- AGE ----

--- Get animal age, returns true if adult, false if young
--- @param animal animal
--- @return bool
function AnimalService.getAge (animal)
    return animal:BFG_GET_ATTR_BOOLEAN("b_Adult")
end

--- Get animal age as sting
--- @param animal animal
--- @return string
function AnimalService.getAgeString (animal)
    local isAdult = animal:BFG_GET_ATTR_BOOLEAN("b_Adult")
    if isAdult then
        return "_Adult"
    end
    return "_Young"
end

--- Set animal age
--- @param animal animal
--- @param age string
function AnimalService.setAge (animal, age)
    local species = animal:BFG_GET_ATTR_STRING("s_Species")
    local gender = AnimalService.getGenderString(animal)
    local super = AnimalService.getSuperString(animal)
    local old = ""
    if (age == "_Adult") then
        old = AnimalService.getOldString(animal)
    end

    animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. age .. gender .. old .. super, false, 0, false, 1)

end

--- Get if an animal is old
--- @param animal animal
--- @return bool
function AnimalService.getOld (animal)
    return animal:BFG_GET_ATTR_BOOLEAN("b_Old")
end

--- Get if an animal is old as a string
--- @param animal animal
--- @return string
function AnimalService.getOldString (animal)
    local isOld = animal:BFG_GET_ATTR_BOOLEAN("b_Old")
    if isOld then
        return "_Old"
    end
    return ""
end

--- Set if an animal is old
--- @param animal animal
--- @param isOld bool
function AnimalService.setOld (animal, isOld)
    local species = animal:BFG_GET_ATTR_STRING("s_Species")
    local gender = AnimalService.getGenderString(animal)
    local super = AnimalService.getSuperString(animal)
    local age = AnimalService.getAgeString(animal)
    local old = ""
    if isOld then
        old = "_Old"
    end

    animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. age .. gender .. old .. super, false, 0, false, 1)
end

---- BATHROOM ----

--- Get animal bathroom stat
--- @param animal animal
--- @return float
function AnimalService.getBathroom (animal)
    return animal:BFG_GET_ATTR_FLOAT("bathroom")
end

--- Set animal bathroom stat
--- @param animal animal
--- @param bathroom float
function AnimalService.setBathroom (animal, bathroom)
    setNeed(animal, "bathroom", bathroom)
end

---- CRATE ----

--- Set animal crated status
--- @param animal animal
--- @param isCrated bool
function AnimalService.setCrated (animal, isCrated)
    if isCrated then
        crateEntity(animal)
    else
        uncrateEntity(animal)
    end
end

---- DELETE ----

--- Delete animal
--- @param animal animal
function AnimalService.delete (animal)
    deleteEntity(animal)
end

---- ENVIROMENT ----

--- Get animal enviroment suitability
--- @param animal animal
--- @return float
function AnimalService.getEnviroment (animal)
    return animal:BFG_GET_ATTR_FLOAT("enviroment")
end

--- Set animal enviroment suitability
--- @param animal animal
--- @param enviroment float
function AnimalService.setEnviroment (animal, enviroment)
    setNeed(animal, "enviroment", enviroment)
end

---- EXERCISE ----

--- Get animal exercise stat
--- @param animal animal
--- @return float
function AnimalService.getExercise (animal)
    return animal:BFG_GET_ATTR_FLOAT("exercise")
end

--- Set animal exercise stat
--- @param animal animal
--- @param exercise float
function AnimalService.setExercise (animal, exercise)
    setNeed(animal, "exercise", exercise)
end

---- GENDER ----

--- Get animal gender, returns true if male, false if female
--- @param animal animal
--- @return bool
function AnimalService.getGender (animal)
    return animal:BFG_GET_ATTR_BOOLEAN("b_Male")
end

--- Get animal gender as sting
--- @param animal animal
--- @return string
function AnimalService.getGenderString (animal)
    local isMale = animal:BFG_GET_ATTR_BOOLEAN("b_Male")
    if isMale then
        return "_M"
    end
    return "_F"
end

--- Set animal gender
--- @param animal animal
--- @param gender string
function AnimalService.setGender (animal, gender)
    local species = animal:BFG_GET_ATTR_STRING("s_Species")
    local age = AnimalService.getAgeString(animal)
    local super = AnimalService.getSuperString(animal)
    local old = ""
    if (age == "_Adult") then
        old = AnimalService.getOldString(animal)
    end

    animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. age .. gender .. old .. super, false, 0, false, 1)
end

---- HEALTH ----

--- Get animal health
--- @param animal animal
--- @return float
function AnimalService.getHealth (animal)
    return animal:BFG_GET_ATTR_FLOAT("health")
end

--- Set animal health
--- @param animal animal
--- @param health float
function AnimalService.setHealth (animal, health)
    setNeed(animal, "health", health)
end

---- HUNGER ----

--- Get animal hunger
--- @param animal animal
--- @return float
function AnimalService.getHunger (animal)
    return animal:BFG_GET_ATTR_FLOAT("hunger")
end

--- Set animal hunger
--- @param animal animal
--- @param hunger float
function AnimalService.setHunger (animal, hunger)
    setNeed(animal, "hunger", hunger)
end

---- HYGIENE ----

--- Get animal hygiene
--- @param animal animal
--- @return float
function AnimalService.getHygiene (animal)
    return animal:BFG_GET_ATTR_FLOAT("hygiene")
end

--- Set animal hygiene
--- @param animal animal
--- @param hygiene float
function AnimalService.setHygiene (animal, hygiene)
    setNeed(animal, "hygiene", hygiene)
end

---- NAME ----

--- Get animal name
--- @param animal animal
--- @return string
function AnimalService.getName (animal)
    return animal:BFG_GET_ATTR_STRING("s_name")
end

--- Set animal name
--- @param animal animal
--- @param name string
function AnimalService.setName (animal, name)
    animal:BFG_SET_ATTR_STRING("s_name", name)
end

---- PREGNANCY ----

--- Get if animal is pregnant
--- @param animal animal
--- @return float
function AnimalService.getPregnant (animal)
    return animal:BFG_GET_ATTR_BOOLEAN("b_Pregnant")
end

--- Set animal pregnancy
--- @param animal animal
--- @param isPregnant bool
function AnimalService.setPregnant (animal, isPregnant)
    local isMale = animal:BFG_GET_ATTR_BOOLEAN("b_Male")

    if isPregnant then
        if (isMale == false) then
            local pregnantSeed = string.format("[[<BFAIToken Name=\"%s\" Force=\"%d\" Timeout=\"%.1f\" Timein=\"%.1f\" />]]", "t_Pregnant", 100, -1, 90)
            local pregnantSeedToken = loadComponent(pregnantSeed)
            animal:BFG_SEND_TOKEN(pregnantSeedToken)
            animal:BFG_SET_ATTR_BOOLEAN("b_Pregnant", true)
        end
    else
        animal:BFG_SET_ATTR_BOOLEAN("b_Pregnant", false)
    end
end

---- PRIVACY ----

--- Get animal privacy
--- @param animal animal
--- @return float
function AnimalService.getPrivacy (animal)
    return animal:BFG_GET_ATTR_FLOAT("privacy")
end

--- Set animal privacy
--- @param animal animal
--- @param privacy float
function AnimalService.setPrivacy (animal, privacy)
    setNeed(animal, "privacy", privacy)
end

---- RAMPAGE ----

--- Get animal rampage status
--- @param animal animal
--- @return bool
function AnimalService.getRampage (animal)
    return animal:BFG_GET_ATTR_BOOLEAN("b_Rampage")
end

--- Trigger a rampage
--- @param animal animal
function AnimalService.triggerRampage (animal)
    local rampageManager = queryObject("BFGRampageMgr")
    rampageManager:BFG_FORCE_RAMPAGE(animal)
end

---- RELEASE ----

--- Get whether or not an animal can be released to the wild
--- @param animal animal
--- @return bool
function AnimalService.getReleaseOption (animal)
    return animal:BFG_GET_ATTR_BOOLEAN("b_showRelease")
end

--- Set whether or not an animal can be released to the wild
--- @param animal animal
--- @param canBeReleased bool
function AnimalService.setReleaseOption (animal, canBeReleased)
    animal:BFG_SET_ATTR_BOOLEAN("b_showRelease", canBeReleased)
end

---- REST ----

--- Get animal rest status
--- @param animal animal
--- @return float
function AnimalService.getRest (animal)
    return animal:BFG_GET_ATTR_FLOAT("rest")
end

--- Set animal rest status
--- @param animal animal
--- @param rest float
function AnimalService.setRest (animal, rest)
    setNeed(animal, "rest", rest)
end

---- SOCIAL ----

--- Get animal social stat
--- @param animal animal
--- @return float
function AnimalService.getSocial (animal)
    return animal:BFG_GET_ATTR_FLOAT("social")
end

--- Set animal social stat
--- @param animal animal
--- @param social float
function AnimalService.setSocial (animal, social)
    setNeed(animal, "social", social)
end

---- SPECIES ----

--- Get animal species
--- @param animal animal
--- @return species
function AnimalService.getSpecies (animal)
    return getSpeciesFromType(animal:BFG_GET_BINDER_TYPE())
end

--- Get animal species as string
--- @param animal animal
--- @return string
function AnimalService.getSpeciesString (animal)
    return animal:BFG_GET_ATTR_STRING("s_Species")
end

--- Set animal species
--- @param animal animal
--- @param setSpecies string
function AnimalService.setSpecies (animal, species)
    local gender = AnimalService.getGenderString(animal)
    local age = AnimalService.getAgeString(animal)
    local super = AnimalService.getSuperString(animal)
    local old = ""
    if (age == "_Adult") then
        old = AnimalService.getOldString(animal)
    end

    animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. age .. gender .. old .. super, false, 0, false, 1)
end

---- STIMULATION ----

--- Get animal stimulation
--- @param animal animal
--- @return float
function AnimalService.getStimulation (animal)
    return animal:BFG_GET_ATTR_FLOAT("stimulation")
end

--- Set animal stimulation
--- @param animal animal
--- @param stimulation float
function AnimalService.setStimulation (animal, stimulation)
    setNeed(animal, "stimulation", stimulation)
end

---- SUPER ----

--- Get animal super status as a boolean
--- @param animal animal
--- @return bool
function AnimalService.getSuper (animal)
    return animal:BFG_GET_ATTR_BOOLEAN("b_Super")
end

--- Get animal super status as sting
--- @param animal animal
--- @return string
function AnimalService.getSuperString (animal)
    local isSuper = animal:BFG_GET_ATTR_BOOLEAN("b_Super")
    if isSuper then
        return "_Super"
    end
    return ""
end

--- Set animal super status
--- @param animal animal
--- @param isSuper bool
function AnimalService.setSuper (animal, isSuper)
    local species = animal:BFG_GET_ATTR_STRING("s_Species")
    local age = AnimalService.getAgeString(animal)
    local gender = AnimalService.getGenderString(animal)
    local old = ""
    if (age == "_Adult") then
        old = AnimalService.getOldString(animal)
    end

    local super = ""
    if isSuper then
        super = "_Super"
    end

    animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. age .. gender .. old .. super, false, 0, false, 1)

end

---- THIRST ----

--- Get animal thirst
--- @param animal animal
--- @return float
function AnimalService.getThirst (animal)
    return animal:BFG_GET_ATTR_FLOAT("thirst")
end

--- Set animal thirst
--- @param animal animal
--- @param thirst float
function AnimalService.setThirst (animal, thirst)
    setNeed(animal, "thirst", thirst)
end