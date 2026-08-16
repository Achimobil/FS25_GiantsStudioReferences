---@class ScreenElement
ScreenElement = {}

local ScreenElement_mt = Class(ScreenElement, FrameElement)

---Creates a new instance
---@param target table|nil
---@param customMt table|nil
---@return ScreenElement
function ScreenElement.new(target, customMt)
    local self = FrameElement.new(target,customMt or ScreenElement_mt)
    return self
end