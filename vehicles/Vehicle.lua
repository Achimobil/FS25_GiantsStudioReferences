---@class Vehicle
Vehicle = {};
Vehicle.rootNode = 12;

local Vehicle_mt = Class(Vehicle, Object);

---Creates a new instance
---@param isServer boolean
---@param isClient boolean
---@param customMt? table
---@return Vehicle
function Vehicle.new(isServer, isClient, customMt)
    local self = Object.new(isServer, isClient, customMt or Vehicle_mt);
    return self;
end


---Called after the vehicle has finished loading
function Vehicle:loadFinished()
end

---Loads the working width spec value
---@param xmlFile XMLFile xml file to load the value from
---@param customEnvironment any custom environment
---@param baseDir any base directory
---@return number|nil workingWidth working width in meters
function Vehicle.loadSpecValueWorkingWidth(xmlFile, customEnvironment, baseDir)
    return xmlFile:getValue("vehicle.storeData.specs.workingWidth")
end

---Loads the per-configuration working width spec values
---@param xmlFile XMLFile xml file to load the value from
---@param customEnvironment any custom environment
---@param baseDir any base directory
---@return table|nil workingWidths working widths grouped by configuration name and index
function Vehicle.loadSpecValueWorkingWidthConfig(xmlFile, customEnvironment, baseDir)
    local workingWidths = nil

    for name, configDesc in pairs(g_vehicleConfigurationManager:getConfigurations()) do
        for configurationIndex, configurationKey in xmlFile:iterator(configDesc.configurationKey) do
            local workingWidth = xmlFile:getValue(configurationKey .. "#workingWidth")
            if workingWidth ~= nil then
                workingWidths = workingWidths or {}
                workingWidths[name] = workingWidths[name] or {}
                workingWidths[name][configurationIndex]= workingWidth
            end
        end
    end

    return workingWidths
end

---Loads the speed limit spec value
---@param xmlFile XMLFile xml file to load the value from
---@param customEnvironment any custom environment
---@param baseDir any base directory
---@return number|nil speedLimit speed limit
function Vehicle.loadSpecValueSpeedLimit(xmlFile, customEnvironment, baseDir)
    return xmlFile:getValue("vehicle.base.speedLimit#value")
end