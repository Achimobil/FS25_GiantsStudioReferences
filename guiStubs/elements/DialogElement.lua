---@class DialogElement
DialogElement = {}

local DialogElement_mt = Class(DialogElement, ScreenElement)

---Creates a new instance
---@param target table|nil
---@param customMt table|nil
---@return DialogElement
function DialogElement.new(target, customMt)
    local v5 = ScreenElement.new(target, customMt or DialogElement_mt)
    return v5
end