PowerConsumer = {};

---Loads needed power spec value
---@param xmlFile XMLFile xml file to load the value from
---@param customEnvironment any custom environment
---@param baseDir any base directory
---@return table neededPower needed power
function PowerConsumer.loadSpecValueNeededPower(xmlFile, customEnvironment, baseDir)
    local neededPower = {}
    neededPower.base = xmlFile:getValue("vehicle.storeData.specs.neededPower")
    neededPower.maxPower = xmlFile:getValue("vehicle.storeData.specs.neededPower#maxPower")
    neededPower.config = {}

    local i = 0
    while true do
        local baseKey = string.format("vehicle.powerConsumer.powerConsumerConfigurations.powerConsumerConfiguration(%d)", i)
        if not xmlFile:hasProperty(baseKey) then
            break
        end

        neededPower.config[i+1] = xmlFile:getValue(baseKey .. "#neededPower")

        i = i + 1
    end


    return neededPower
end