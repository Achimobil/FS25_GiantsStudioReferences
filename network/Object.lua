---@class Object
Object = {};

local Object_mt = Class(Object);

---Creates a new instance
---@param isServer boolean
---@param isClient boolean
---@param customMt? table custom metatable for the subclass instance
---@return Object
function Object.new(isServer, isClient, customMt)
    local self = setmetatable({}, customMt or Object_mt);
    return self;
end