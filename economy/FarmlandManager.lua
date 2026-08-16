---@class FarmlandManager
FarmlandManager = {};

local FarmlandManager_mt = Class(FarmlandManager, AbstractManager);

---Creates a new instance
---@param customMt? table custom metatable for the subclass instance
---@return FarmlandManager
function FarmlandManager.new(customMt)
    return AbstractManager.new(customMt or FarmlandManager_mt);
end

---Gets the farmland with the given id
---@param farmlandId integer id of the farmland
---@return table farmland the farmland
function FarmlandManager:getFarmlandById(farmlandId)
    return self.farmlands[farmlandId];
end

---Gets the id of the farm owning the given farmland
---@param farmlandId integer id of the farmland
---@return integer farmId the id of the owning farm, or NO_OWNER_FARM_ID if unowned
function FarmlandManager:getFarmlandOwner(farmlandId)
    return self.farmlandMapping[farmlandId];
end

---Gets the id of the farmland at the given world position
---@param worldPosX number world position x
---@param worldPosZ number world position z
---@return integer farmlandId the id of the farmland at the given position
function FarmlandManager:getFarmlandIdAtWorldPosition(worldPosX, worldPosZ)
end

g_farmlandManager = FarmlandManager.new();