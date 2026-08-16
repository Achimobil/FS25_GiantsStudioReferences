---@class ConfigurationManager
ConfigurationManager = {};

local ConfigurationManager_mt = Class(ConfigurationManager, AbstractManager);

---Creates a new instance
---@param typeName string
---@param rootElementName string
---@param customMt? table
---@return ConfigurationManager newObject
function ConfigurationManager.new(typeName, rootElementName, customMt)
    local self = AbstractManager.new(customMt or ConfigurationManager_mt);
    return self
end

---Returns all configurations
---@return table configurations
function ConfigurationManager:getConfigurations()
    return self.configurations
end

g_vehicleConfigurationManager = ConfigurationManager.new("vehicle", "vehicle")
g_placeableConfigurationManager = ConfigurationManager.new("placeable", "placeable")