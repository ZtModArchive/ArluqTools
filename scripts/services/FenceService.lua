-- Include Zoo Tycoon 2 libraries
include "scenario/scripts/entity.lua"
include "scenario/scripts/misc.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"

--- Service for modifiying fences
FenceService = {}

function FenceService.getBreakable (fence)
    return fence:BFG_GET_ATTR_STRING("s_Broken")
end

function FenceService.getStrength (fence)
    return fence:BFG_GET_ATTR_FLOAT("f_FenceStrength")
end

function FenceService.setStrength (fence, fenceStrength)
    return fence:BFG_SET_ATTR_FLOAT("f_FenceStrength", fenceStrength)
end

function FenceService.setBroken (fence)
    return fence:BFG_SET_ATTR_FLOAT("f_FenceStrength", 0)
end