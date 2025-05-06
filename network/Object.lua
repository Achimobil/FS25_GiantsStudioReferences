Object = {};

local Object_mt = Class(Object);

--- create new instance
-- @param boolean isServer
-- @param boolean isClient
-- @param table customMt
-- @return ProductionPoint newObject
function Object.new(isServer, isClient, customMt)
    local self = setmetatable({}, customMt or Object_mt);
    return self;
end