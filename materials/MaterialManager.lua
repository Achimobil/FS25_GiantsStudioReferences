MaterialManager = {};

local MaterialManager_mt = Class(MaterialManager, AbstractManager)

--- create new instance
-- @param table customMt
-- @return MaterialManager newObject
function MaterialManager.new(customMt)
    return AbstractManager.new(customMt or MaterialManager_mt);
end

function MaterialManager:getFontMaterial(materialName, customEnvironment)
    if customEnvironment ~= nil and customEnvironment ~= "" then
        local customMaterialName = customEnvironment .. "." .. materialName;
        if self.fontMaterialsByName[customMaterialName] ~= nil then
            return self.fontMaterialsByName[customMaterialName];
        end
    end
    return self.fontMaterialsByName[materialName];
end

g_materialManager = MaterialManager.new();