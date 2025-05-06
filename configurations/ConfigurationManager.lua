ConfigurationManager = {};

local ConfigurationManager_mt = Class(ConfigurationManager, AbstractManager);

--- create new instance
-- @param string typeName
-- @param string rootElementName
-- @param table customMt
-- @return ConfigurationManager newObject
function ConfigurationManager.new(typeName, rootElementName, customMt)
    local self = AbstractManager.new(customMt or ConfigurationManager_mt);
    return self
end

--- get all configurations
-- @return table configurations
function ConfigurationManager:getConfigurations()
    return self.configurations
end

g_vehicleConfigurationManager = ConfigurationManager.new("vehicle", "vehicle")
g_placeableConfigurationManager = ConfigurationManager.new("placeable", "placeable")