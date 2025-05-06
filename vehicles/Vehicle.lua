Vehicle = {};
Vehicle.rootNode = 12;

local Vehicle_mt = Class(Vehicle, Object);

function Vehicle.new(isServer, isClient, customMt)
    local self = Object.new(isServer, isClient, customMt or Vehicle_mt);
    return self;
end


---
function Vehicle:loadFinished()
end

---
function Vehicle.loadSpecValueWorkingWidth(xmlFile, customEnvironment, baseDir)
    return xmlFile:getValue("vehicle.storeData.specs.workingWidth")
end

---
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

---
function Vehicle.loadSpecValueSpeedLimit(xmlFile, customEnvironment, baseDir)
    return xmlFile:getValue("vehicle.base.speedLimit#value")
end