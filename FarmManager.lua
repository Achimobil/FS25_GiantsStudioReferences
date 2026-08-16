FarmManager = {}
local FarmManager_mt = Class(FarmManager, AbstractManager)

---Creates a new farm manager instance
---@param customMt? table custom metatable
---@return FarmManager
function FarmManager.new(customMt)
end

---Gets the farm with the given farm id
---@param farmId integer id of the farm to look up
---@return Farm farm the found farm
function FarmManager:getFarmById(farmId)
end

g_farmManager = FarmManager.new();
