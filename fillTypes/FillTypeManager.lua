FillType = nil;
---@class FillTypeManager
FillTypeManager = {};

local FillTypeManager_mt = Class(FillTypeManager, AbstractManager);

---Creates a new instance
---@param customMt? table custom metatable for the subclass instance
---@return FillTypeManager
function FillTypeManager.new(customMt)
    return AbstractManager.new(customMt or FillTypeManager_mt);
end

---Gets a fillType description by index
---@param index integer index of the fillType
---@return FillTypeDesc fillType the fillType description
function FillTypeManager:getFillTypeByIndex(index)
    return self.indexToFillType[index];
end

---Gets a fillType description by name
---@param name string name of the fillType
---@return FillTypeDesc fillType the fillType description
function FillTypeManager:getFillTypeByName(name)
    return self.nameToFillType[name];
end

---Gets a fillType's name by index
---@param index integer index of the fillType
---@return string name the fillType name
function FillTypeManager:getFillTypeNameByIndex(index)
    return self.indexToName[index];
end

---Gets a fillType's index by name
---@param name string name of the fillType
---@return integer index the fillType index
function FillTypeManager:getFillTypeIndexByName(name)
    return self.nameToIndex[name];
end

g_fillTypeManager = FillTypeManager.new();