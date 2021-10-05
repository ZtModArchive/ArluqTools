include "modules/ZtModArchive/ArluqTools/scripts/lua/logging.lua"
include "modules/ZtModArchive/ArluqTools/scripts/lua/try.lua"

include "modules/ZtModArchive/ArluqTools/scripts/services/AnimalService.lua"
include "modules/ZtModArchive/ArluqTools/scripts/services/CollectionService.lua"
include "modules/ZtModArchive/ArluqTools/scripts/services/FenceService.lua"
include "modules/ZtModArchive/ArluqTools/scripts/services/GuestService.lua"
include "modules/ZtModArchive/ArluqTools/scripts/services/TimeService.lua"
include "modules/ZtModArchive/ArluqTools/scripts/services/ZooService.lua"

--- Big Daddy Arluq class
aq = {}

aq.log = log
aq.try = try
aq.tryCatch = tryCatch

aq.collection = CollectionService
aq.animal = AnimalService
aq.fence = FenceService
aq.guest = GuestService
aq.time = TimeService
aq.zoo = ZooService