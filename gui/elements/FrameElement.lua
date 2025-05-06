FrameElement = {}

local FrameElement_mt = Class(FrameElement, GuiElement)

--- create new instance
-- @param table customMt
-- @return FrameElement newObject
function FrameElement.new(target, customMt)
    local self = GuiElement.new(target, customMt or FrameElement_mt)
    return self
end