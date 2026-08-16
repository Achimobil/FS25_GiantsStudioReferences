---@class Lighting
Lighting = {}
Lighting.sunLightId = 4711;

local Lighting_mt = Class(Lighting);

---Creates a new instance
---@param customMt? table
---@return Lighting newObject
function Lighting.new(customMt)
    local self = setmetatable({}, customMt or Lighting_mt);
    return self;
end