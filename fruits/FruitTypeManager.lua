FruitType = nil;
FruitTypeManager = {};

local FruitTypeManager_mt = Class(FruitTypeManager, AbstractManager);

--- create new instance
-- @param table customMt
-- @return FruitTypeManager newObject
function FruitTypeManager.new(customMt)
    -- upvalues: (copy) FruitTypeManager_mt
    return AbstractManager.new(customMt or FruitTypeManager_mt);
end

---Gets a fruitType by index
-- @param integer index the fruit index
-- @return table fruit the fruit object
function FruitTypeManager:getFruitTypeByIndex(index)
    return self.indexToFruitType[index]
end

g_fruitTypeManager = FruitTypeManager.new()