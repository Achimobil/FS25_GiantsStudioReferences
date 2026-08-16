FruitType = nil;
---@class FruitTypeManager
FruitTypeManager = {};

local FruitTypeManager_mt = Class(FruitTypeManager, AbstractManager);

---Creates a new instance
---@param customMt? table custom metatable for the subclass instance
---@return FruitTypeManager
function FruitTypeManager.new(customMt)
    -- upvalues: (copy) FruitTypeManager_mt
    return AbstractManager.new(customMt or FruitTypeManager_mt);
end

---Gets a fruitType by index
---@param index integer the fruit index
---@return table fruit the fruit object
function FruitTypeManager:getFruitTypeByIndex(index)
    return self.indexToFruitType[index]
end

g_fruitTypeManager = FruitTypeManager.new()