---@class GuiElement
GuiElement = {}

local GuiElement_mt = Class(GuiElement)

---Creates a new instance
---@param target table|nil
---@param customMt table|nil
---@return GuiElement
function GuiElement.new(target, customMt)
    local self = setmetatable({}, customMt or GuiElement_mt);
    self.target = target;
    return self;
end