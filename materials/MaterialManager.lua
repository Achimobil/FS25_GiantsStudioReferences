---@class MaterialManager
MaterialManager = {};

local MaterialManager_mt = Class(MaterialManager, AbstractManager)

---Creates a new instance
---@param customMt? table custom metatable for the subclass instance
---@return MaterialManager
function MaterialManager.new(customMt)
    return AbstractManager.new(customMt or MaterialManager_mt);
end

---Returns the font material for the given name, optionally scoped to a custom environment (e.g. mod)
---@param materialName string name of the font material
---@param customEnvironment? string custom environment prefix (e.g. mod name) to look up an overridden material first
---@return table material font material
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