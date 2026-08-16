---@class AbstractManager
AbstractManager = {}

local AbstractManager_mt = Class(AbstractManager)

---Creates a new instance
---@param customMt? table custom metatable for the subclass instance
---@return AbstractManager
function AbstractManager.new(customMt)
    local self = setmetatable({}, customMt or AbstractManager_mt);
    return self;
end