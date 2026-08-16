---@class FrameElement
FrameElement = {}

local FrameElement_mt = Class(FrameElement, GuiElement)

---Creates a new instance
---@param target table|nil
---@param customMt table|nil
---@return FrameElement
function FrameElement.new(target, customMt)
    local self = GuiElement.new(target, customMt or FrameElement_mt)
    return self
end