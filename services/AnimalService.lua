-- Include Zoo Tycoon 2 libraries
include "scenario/scripts/entity.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"

--- Service for modifiying animals.
AnimalService = {}

--- Delete animal
--- @param animal animal
function AnimalService.delete (animal)
    deleteEntity(animal)
end

--- Get animal age as sting
--- @param animal animal
--- @return string
function AnimalService.getAgeString (animal)
    local isAdult = animal:BFG_GET_ATTR_BOOLEAN("b_Adult")
    if isAdult then
        return "Adult"
    end
    return "Young"
end

--- Get animal gender as sting
--- @param animal animal
--- @return string
function AnimalService.getGenderString (animal)
    local isMale = animal:BFG_GET_ATTR_BOOLEAN("b_Male")
    if isMale then
        return "M"
    end
    return "F"
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

--- Set whether or not an animal can be put up for adoption
--- @param animal animal
--- @param canBeAdopted bool
function AnimalService.setAdoptOption (animal, canBeAdopted)
    animal:BFG_SET_ATTR_BOOLEAN("b_showAdopt", canBeAdopted)
end

--- Set animal age
--- @param animal animal
--- @param age string
function AnimalService.setAge (animal, age)
    local species = animal:BFG_GET_ATTR_STRING("s_Species")
    local gender = AnimalService.getGenderString(animal)
    local super = AnimalService.getSuperString(animal)

    animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. "_" .. age .. "_" .. gender .. super, false, 0, false, 1)
end

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

--- Set animal enviroment suitability
--- @param animal animal
--- @param enviroment int
function AnimalService.setEnviroment (animal, enviroment)
    setNeed(animal, "enviroment", enviroment)
end

--- Set animal exercise stat
--- @param animal animal
--- @param exercise int
function AnimalService.setExercise (animal, exercise)
    setNeed(animal, "exercise", exercise)
end

--- Set animal happiness
--- @param animal animal
--- @param happiness int
function AnimalService.setHappiness (animal, happiness)
    setNeed(animal, "happiness", happiness)
end

--- Set animal hunger
--- @param animal animal
--- @param hunger int
function AnimalService.setHunger (animal, hunger)
    setNeed(animal, "hunger", hunger)
end

--- Set animal hygiene
--- @param animal animal
--- @param hygiene int
function AnimalService.setHygiene (animal, hygiene)
    setNeed(animal, "hygiene", hygiene)
end

--- Set animal gender
--- @param animal animal
--- @param gender string
function AnimalService.setGender (animal, gender)
    local species = animal:BFG_GET_ATTR_STRING("s_Species")
    local age = AnimalService.getAgeString(animal)
    local super = AnimalService.getSuperString(animal)

    animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. "_" .. age .. "_" .. gender .. super, false, 0, false, 1)
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

--- Set animal privacy
--- @param animal animal
--- @param privacy int
function AnimalService.setPrivacy (animal, privacy)
    setNeed(animal, "privacy", privacy)
end

--- Set animal rampage status
--- @param animal animal
--- @param isRampaging bool
function AnimalService.setRampage (animal, isRampaging)
    local rampageManager = queryObject("BFGRampageMgr")
    rampageManager:BFG_FORCE_RAMPAGE(animal)
end

--- Set whether or not an animal can be released to the wild
--- @param animal animal
--- @param canBeReleased bool
function AnimalService.setReleaseOption (animal, canBeReleased)
    animal:BFG_SET_ATTR_BOOLEAN("b_showRelease", canBeReleased)
end

--- Set animal rest
--- @param animal animal
--- @param rest int
function AnimalService.setRest (animal, rest)
    setNeed(animal, "rest", rest)
end

--- Set animal social stat
--- @param animal animal
--- @param social int
function AnimalService.setSocial (animal, social)
    setNeed(animal, "social", social)
end

--- Set animal stimulation stat
--- @param animal animal
--- @param stimulation int
function AnimalService.setStimulation (animal, stimulation)
    setNeed(animal, "stimulation", stimulation)
end

--- Set animal super status
--- @param animal animal
--- @param isSuper bool
function AnimalService.setSuper (animal, isSuper)
    local species = animal:BFG_GET_ATTR_STRING("s_Species")
    local age = AnimalService.getAgeString(animal)
    local gender = AnimalService.getGenderString(animal)

    if isSuper then
        animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. "_" .. age .. "_" .. gender .. "_Super", false, 0, false, 1)
    else
        animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. "_" .. age .. "_" .. gender, false, 0, false, 1)
    end
end

--- Set animal species
--- @param animal animal
--- @param setSpecies string
function AnimalService.setSpecies (animal, species)
    local gender = AnimalService.getGenderString(animal)
    local age = AnimalService.getAgeString(animal)
    local super = AnimalService.getSuperString(animal)

    animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. "_" .. age .. "_" .. gender .. super, false, 0, false, 1)
end

--- Set animal thirst
--- @param animal animal
--- @param thirst int
function AnimalService.setThirst (animal, thirst)
    setNeed(animal, "thirst", thirst)
end