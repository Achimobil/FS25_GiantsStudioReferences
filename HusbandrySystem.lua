---@class HusbandrySystem
HusbandrySystem = {};

local HusbandrySystem_mt = Class(HusbandrySystem);

HusbandrySystem.placeables = {};

---Creates a new instance
---@param isServer boolean whether this instance runs on the server
---@param mission table owning mission instance
---@param customMt? table custom metatable for the subclass instance
---@return HusbandrySystem newObject
function HusbandrySystem.new(isServer, mission, customMt)
    local self = setmetatable({}, customMt or HusbandrySystem_mt)
    return self
end

---Gets all husbandry placeables owned by the given farm
---@param farmId? integer farm id to filter by (defaults to the local player's farm)
---@param animalTypeIndex? integer animal type index to filter by
---@return table placeables
function HusbandrySystem:getPlaceablesByFarm(farmId, animalTypeIndex)
    return self.placeables;
end