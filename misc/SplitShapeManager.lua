---@class SplitShapeManager
SplitShapeManager = {}

local SplitShapeManager_mt = Class(SplitShapeManager, AbstractManager);

---Creates a new instance
---@param customMt? table custom metatable for the subclass instance
---@return SplitShapeManager
function SplitShapeManager.new(customMt)
    return AbstractManager.new(customMt or SplitShapeManager_mt)
end

---Returns split type table by given split type index provided by getSplitType()
---@param index integer splitTypeIndex returned by getSplitType()
---@return table? splitTypeTable
function SplitShapeManager:getSplitTypeByIndex(index)
    -- check each split type index has a registered split type
--#debug     if index ~= 0 and self.typesByIndex[index] == nil then
--#debug         Logging.warning("split type index '%d' has no split type registered", index)
--#debug     end

    return self.typesByIndex[index]
end

g_splitShapeManager = SplitShapeManager.new();