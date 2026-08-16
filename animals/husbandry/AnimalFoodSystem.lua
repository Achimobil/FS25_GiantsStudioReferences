---@class AnimalFoodSystem
AnimalFoodSystem = {};

local AnimalFoodSystem_mt = Class(AnimalFoodSystem);

AnimalFoodSystem.FOOD_CONSUME_TYPE_SERIAL = 1;
AnimalFoodSystem.FOOD_CONSUME_TYPE_PARALLEL = 2;

---Creates a new instance
---@param mission table
---@param customMt? table
---@return AnimalFoodSystem
function AnimalFoodSystem.new(mission, customMt)
    local self = setmetatable({}, customMt or AnimalFoodSystem_mt);
    self.animalTypeIndexToFood = {};
    return self;
end

---@param animalTypeIndex integer
---@return table? animalFood
function AnimalFoodSystem:getAnimalFood(animalTypeIndex)
    return self.animalTypeIndexToFood[animalTypeIndex];
end

---@param animalTypeIndex integer
---@param amountToConsume number
---@param foodOwner table
---@param consumedFood table
---@return number productionWeight
function AnimalFoodSystem:consumeFood(animalTypeIndex, amountToConsume, foodOwner, consumedFood)
end

---@param amount number
---@param foodGroups table
---@param foodOwner table
---@param consumedFood table
---@return number productionWeight
function AnimalFoodSystem:consumeFoodSerially(amount, foodGroups, foodOwner, consumedFood)
end

---@param amount number
---@param foodGroups table
---@param foodOwner table
---@param consumedFood table
---@return number productionWeight
function AnimalFoodSystem:consumeFoodParallelly(amount, foodGroups, foodOwner, consumedFood)
end

---@param animalFood table
---@param xmlFile table
---@param key string
---@return boolean
function AnimalFoodSystem:loadAnimalFoodData(animalFood, xmlFile, key)
end

---@param fillTypes table
---@param usedFillTypes table
---@param xmlFile table
---@param key string
---@return boolean
function AnimalFoodSystem:getFillTypesFromXML(fillTypes, usedFillTypes, xmlFile, key)
end

---@param mixture table
---@param xmlFile table
---@param key string
---@return boolean
function AnimalFoodSystem:loadMixture(mixture, xmlFile, key)
end

---@param xmlFile table
---@param missionInfo table
---@return boolean
function AnimalFoodSystem:loadMapData(xmlFile, missionInfo)
end