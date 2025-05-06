FillType = nil;
FillTypeManager = {};

local FillTypeManager_mt = Class(FillTypeManager, AbstractManager)

--- create new instance
-- @param table customMt
-- @return FillTypeManager newObject
function FillTypeManager.new(customMt)
    return AbstractManager.new(customMt or FillTypeManager_mt)
end

---Gets a fillType by index
-- @param integer index the fillType index
-- @return FillTypeDesc fillType the fillType object
function FillTypeManager:getFillTypeByIndex(index)
    return self.fillTypes[index]
end

---Gets a fillType title by index
-- @param integer index the fillType index
-- @return string fillTypeTitle the localized fillType title
function FillTypeManager:getFillTypeTitleByIndex(index)
    return self.indexToTitle[index]
end

---Gets a fillTypeName by index
-- @param integer index the fillType index
-- @return string fillTypeName the fillType name
function FillTypeManager:getFillTypeNameByIndex(index)
    return self.indexToName[index]
end

---Gets a fillType index ny name
-- @param string name the fillType name
-- @return integer fillTypeIndex
function FillTypeManager:getFillTypeIndexByName(name)
    return 1;
end

g_fillTypeManager = FillTypeManager.new();