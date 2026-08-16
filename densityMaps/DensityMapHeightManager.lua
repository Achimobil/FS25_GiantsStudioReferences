---@class DensityMapHeightManager
DensityMapHeightManager = {};
local DensityMapHeightManager_mt = Class(DensityMapHeightManager, AbstractManager);

---Creates a new instance
---@param customMt? table
---@return DensityMapHeightManager newObject
function DensityMapHeightManager.new(customMt)
    -- upvalues: (copy) DensityMapHeightManager_mt
    local self = AbstractManager.new(customMt or DensityMapHeightManager_mt);
    return self;
end

---Registers an area (e.g. a bunker silo) whose accepted fill type is converted to another fill type when tipped
---@param bunkerSiloArea table
---@param acceptedFillTypes table
---@param inputFillType integer
function DensityMapHeightManager:setConvertingFillTypeAreas(bunkerSiloArea, acceptedFillTypes, inputFillType)

end

---Removes a previously registered converting fill type area
---@param bunkerSiloArea table
function DensityMapHeightManager:removeConvertingFillTypeAreas(bunkerSiloArea)
end

g_densityMapHeightManager = DensityMapHeightManager.new()