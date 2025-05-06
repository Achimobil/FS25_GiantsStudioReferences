Lighting = {}
Lighting.sunLightId = 4711;

local Lighting_mt = Class(Lighting);

--- create new instance
-- @param table|any customMt
-- @return Lighting newObject
function Lighting.new(customMt)
    local self = setmetatable({}, customMt or Lighting_mt);
    return self;
end