DialogElement = {}

local DialogElement_mt = Class(DialogElement, ScreenElement)

--- create new instance
-- @param table customMt
-- @return DialogElement newObject
function DialogElement.new(target, customMt)
    local v5 = ScreenElement.new(target, customMt or DialogElement_mt)
    return v5
end