AnimalType = nil;

---@class AnimalSystem
AnimalSystem = {};

local AnimalSystem_mt = Class(AnimalSystem);

---@param isServer boolean
---@param mission table
---@param customMt? table
---@return AnimalSystem
function AnimalSystem.new(isServer, mission, customMt)
    local self = setmetatable({}, customMt or AnimalSystem_mt);
    self.subTypes = {};
    return self;
end


---@param subTypeIndex integer
---@param age number
---@return integer? visualAnimalIndex
function AnimalSystem:getVisualAnimalIndexByAge(subTypeIndex, age)
    return {};
end

---@param subTypeIndex integer
---@param age number
---@return table? visual
function AnimalSystem:getVisualByAge(subTypeIndex, age)
end

---@param index integer
---@return table? subType
function AnimalSystem:getSubTypeByIndex(index)
    return {};
end

---@param subTypeIndex integer
---@return integer typeIndex
function AnimalSystem:getTypeIndexBySubTypeIndex(subTypeIndex)
    return {};
end