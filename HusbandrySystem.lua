HusbandrySystem = {};

local HusbandrySystem_mt = Class(HusbandrySystem);

HusbandrySystem.placeables = {};

function HusbandrySystem.new(isServer, mission, customMt)
    local self = setmetatable({}, customMt or HusbandrySystem_mt)
    return self
end

function HusbandrySystem:getPlaceablesByFarm(farmId, animalTypeIndex)
    return self.placeables;
end