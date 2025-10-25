AnimalType = nil;

AnimalSystem = {};

local AnimalSystem_mt = Class(AnimalSystem);

function AnimalSystem.new(isServer, mission, customMt)
    local self = setmetatable({}, customMt or AnimalSystem_mt);
    self.subTypes = {};
    return self;
end


function AnimalSystem:getVisualAnimalIndexByAge(subTypeIndex, age)
    return {};
end

function AnimalSystem:getVisualByAge(subTypeIndex, age)
end

function AnimalSystem:getSubTypeByIndex(index)
    return {};
end