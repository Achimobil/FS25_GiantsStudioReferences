GuiElement = {}

local GuiElement_mt = Class(GuiElement)

--- create new instance
-- @param table customMt
-- @return GuiElement newObject
function GuiElement.new(target, customMt)
    local self = setmetatable({}, customMt or GuiElement_mt);
    self.target = target;
    return self;
end