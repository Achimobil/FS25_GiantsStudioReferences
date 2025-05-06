DensityMapHeightManager = {};
local DensityMapHeightManager_mt = Class(DensityMapHeightManager, AbstractManager);

function DensityMapHeightManager.new(customMt)
    -- upvalues: (copy) DensityMapHeightManager_mt
    local self = AbstractManager.new(customMt or DensityMapHeightManager_mt);
    return self;
end

function DensityMapHeightManager:setConvertingFillTypeAreas(bunkerSiloArea, acceptedFillTypes, inputFillType)

end

function DensityMapHeightManager:removeConvertingFillTypeAreas(bunkerSiloArea)
end

g_densityMapHeightManager = DensityMapHeightManager.new()