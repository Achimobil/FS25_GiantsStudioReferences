AnimalFoodSystem = {};
local AnimalFoodSystem_mt = Class(AnimalFoodSystem);

AnimalFoodSystem.FOOD_CONSUME_TYPE_SERIAL = 1;
AnimalFoodSystem.FOOD_CONSUME_TYPE_PARALLEL = 2;

--- create new instance
-- @param BaseMission mission
-- @param table? customMt
-- @return AnimalFoodSystem newObject
function AnimalFoodSystem.new(mission, customMt)
    local self = setmetatable({}, customMt or AnimalFoodSystem_mt);
    self.animalTypeIndexToFood = {};
    return self;
end

function AnimalFoodSystem:getAnimalFood(animalTypeIndex)
    return self.animalTypeIndexToFood[animalTypeIndex];
end

function AnimalFoodSystem:consumeFood(animalTypeIndex, amountToConsume, foodOwner, consumedFood)
end

function AnimalFoodSystem:consumeFoodSerially(amount, foodGroups, foodOwner, consumedFood)
end

function AnimalFoodSystem:consumeFoodParallelly(amount, foodGroups, foodOwner, consumedFood)
end

function AnimalFoodSystem:loadAnimalFoodData(animalFood, xmlFile, key)
end

function AnimalFoodSystem:getFillTypesFromXML(fillTypes, usedFillTypes, xmlFile, key)
end

function AnimalFoodSystem:loadMixture(mixture, xmlFile, key)
end

function AnimalFoodSystem:loadMapData(xmlFile, missionInfo)
end