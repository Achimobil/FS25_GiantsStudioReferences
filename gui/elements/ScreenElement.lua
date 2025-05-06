ScreenElement = {}

local ScreenElement_mt = Class(ScreenElement, FrameElement)

--- create new instance
-- @param table customMt
-- @return ScreenElement newObject
function ScreenElement.new(target, customMt)
    local self = FrameElement.new(target,customMt or ScreenElement_mt)
    return self
end