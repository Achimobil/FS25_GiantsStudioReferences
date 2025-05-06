BunkerSilo = {}
local BunkerSilo_mt = Class(BunkerSilo, Object);
BunkerSilo.STATE_FILL = 0;
BunkerSilo.STATE_CLOSED = 1;
BunkerSilo.STATE_FERMENTED = 2;
BunkerSilo.STATE_DRAIN = 3;
BunkerSilo.NUM_STATES = 4;
BunkerSilo.COMPACTING_BASE_MASS = 5;

---Creating bunker silo object
-- @param boolean isServer is server
-- @param boolean isClient is client
-- @param table? customMt customMt
-- @return table instance Instance of object
function BunkerSilo.new(isServer, isClient, customMt)
    local self = Object.new(isServer, isClient, customMt or BunkerSilo_mt)

    self.interactionTriggerNode = nil

    self.bunkerSiloArea = {}
    self.bunkerSiloArea.offsetFront = 0
    self.bunkerSiloArea.offsetBack = 0

    self.acceptedFillTypes = {}

    self.inputFillType = FillType.CHAFF
    self.outputFillType = FillType.SILAGE
    self.fermentingFillType = FillType.TARP

    self.isOpenedAtFront = false
    self.isOpenedAtBack = false
    self.distanceToCompactedFillLevel = 100

    self.fermentingPercent = 0  -- float from 0 to 1

    self.fillLevel = 0
    self.compactedFillLevel = 0
    self.compactedPercent = 0  -- specially rounded/snapped integer from 0 to 100
    self.emptyThreshold = 100

    self.playerInRange = false
    self.vehiclesInRange = {}
    self.numVehiclesInRange = 0

    self.siloIsFullWarningTimer = 0
    self.siloIsFullWarningDuration = 2000

    self.updateTimer = 0

    self.activatable = BunkerSiloActivatable.new(self)

    self.state = BunkerSilo.STATE_FILL

    self.bunkerSiloDirtyFlag = self:getNextDirtyFlag()

    g_messageCenter:subscribe(MessageType.HOUR_CHANGED, self.onHourChanged, self)

    return self
end

---Load bunker silo
-- @param table components components
-- @param table xmlFile xml file object
-- @param string key xml key
-- @param table i3dMappings i3dMappings
-- @return boolean success success
function BunkerSilo:load(components, xmlFile, key, i3dMappings)
    self.bunkerSiloArea.start = xmlFile:getValue(key..".area#startNode", nil, components, i3dMappings)
    self.bunkerSiloArea.width = xmlFile:getValue(key..".area#widthNode", nil, components, i3dMappings)
    self.bunkerSiloArea.height = xmlFile:getValue(key..".area#heightNode", nil, components, i3dMappings)

    self.bunkerSiloArea.sx, self.bunkerSiloArea.sy, self.bunkerSiloArea.sz = getWorldTranslation(self.bunkerSiloArea.start)
    self.bunkerSiloArea.wx, self.bunkerSiloArea.wy, self.bunkerSiloArea.wz = getWorldTranslation(self.bunkerSiloArea.width)
    self.bunkerSiloArea.hx, self.bunkerSiloArea.hy, self.bunkerSiloArea.hz = getWorldTranslation(self.bunkerSiloArea.height)

    self.bunkerSiloArea.dhx = self.bunkerSiloArea.hx - self.bunkerSiloArea.sx
    self.bunkerSiloArea.dhy = self.bunkerSiloArea.hy - self.bunkerSiloArea.sy
    self.bunkerSiloArea.dhz = self.bunkerSiloArea.hz - self.bunkerSiloArea.sz
    self.bunkerSiloArea.dhx_norm, self.bunkerSiloArea.dhy_norm, self.bunkerSiloArea.dhz_norm = MathUtil.vector3Normalize(self.bunkerSiloArea.dhx, self.bunkerSiloArea.dhy, self.bunkerSiloArea.dhz)

    self.bunkerSiloArea.dwx = self.bunkerSiloArea.wx - self.bunkerSiloArea.sx
    self.bunkerSiloArea.dwy = self.bunkerSiloArea.wy - self.bunkerSiloArea.sy
    self.bunkerSiloArea.dwz = self.bunkerSiloArea.wz - self.bunkerSiloArea.sz
    self.bunkerSiloArea.dwx_norm, self.bunkerSiloArea.dwy_norm, self.bunkerSiloArea.dwz_norm = MathUtil.vector3Normalize(self.bunkerSiloArea.dwx, self.bunkerSiloArea.dwy, self.bunkerSiloArea.dwz)

    self.bunkerSiloArea.inner = {}
    self.bunkerSiloArea.inner.start = xmlFile:getValue(key..".innerArea#startNode", self.bunkerSiloArea.start, components, i3dMappings)
    self.bunkerSiloArea.inner.width = xmlFile:getValue(key..".innerArea#widthNode", self.bunkerSiloArea.width, components, i3dMappings)
    self.bunkerSiloArea.inner.height = xmlFile:getValue(key..".innerArea#heightNode", self.bunkerSiloArea.height, components, i3dMappings)

    self.bunkerSiloArea.inner.sx, self.bunkerSiloArea.inner.sy, self.bunkerSiloArea.inner.sz = getWorldTranslation(self.bunkerSiloArea.inner.start)
    self.bunkerSiloArea.inner.wx, self.bunkerSiloArea.inner.wy, self.bunkerSiloArea.inner.wz = getWorldTranslation(self.bunkerSiloArea.inner.width)
    self.bunkerSiloArea.inner.hx, self.bunkerSiloArea.inner.hy, self.bunkerSiloArea.inner.hz = getWorldTranslation(self.bunkerSiloArea.inner.height)

    self.interactionTriggerNode = xmlFile:getValue(key..".interactionTrigger#node", nil, components, i3dMappings)
    if self.interactionTriggerNode ~= nil then
        addTrigger(self.interactionTriggerNode, "interactionTriggerCallback", self)
    end

    self.acceptedFillTypes = {}
    local data = xmlFile:getValue(key.."#acceptedFillTypes", "chaff grass_windrow dryGrass_windrow"):split(" ")
    for i=1, #data do
        local fillTypeIndex = g_fillTypeManager:getFillTypeIndexByName(data[i])
        if fillTypeIndex ~= nil then
            self.acceptedFillTypes[fillTypeIndex] = true
        else
            Logging.warning("'%s' is an invalid fillType for bunkerSilo '%s'!", tostring(data[i]), key.."#acceptedFillTypes")
        end
    end

    local inputFillTypeName = xmlFile:getValue(key.."#inputFillType", "chaff")
    local inputFillTypeIndex = g_fillTypeManager:getFillTypeIndexByName(inputFillTypeName)
    if inputFillTypeIndex ~= nil then
        self.inputFillType = inputFillTypeIndex
    else
        Logging.warning("'%s' is an invalid input fillType for bunkerSilo '%s'!", tostring(inputFillTypeName), key.."#inputFillType")
    end

    local outputFillTypeName = xmlFile:getValue(key.."#outputFillType", "silage")
    local outputFillTypeIndex = g_fillTypeManager:getFillTypeIndexByName(outputFillTypeName)
    if outputFillTypeIndex ~= nil then
        self.outputFillType = outputFillTypeIndex
    else
        Logging.warning("'%s' is an invalid output fillType for bunkerSilo '%s'!", tostring(outputFillTypeName), key.."#outputFillType")
    end

    g_densityMapHeightManager:setConvertingFillTypeAreas(self.bunkerSiloArea, self.acceptedFillTypes, self.inputFillType)

    self.distanceToCompactedFillLevel = xmlFile:getValue(key.."#distanceToCompactedFillLevel", self.distanceToCompactedFillLevel)
    self.openingLength = xmlFile:getValue(key.."#openingLength", 5)

    local leftWallNode = xmlFile:getValue(key .. ".wallLeft#node", nil, components, i3dMappings)
    if leftWallNode ~= nil then
        self.wallLeft = {}
        self.wallLeft.node = leftWallNode
        self.wallLeft.visible = true
        self.wallLeft.collision = xmlFile:getValue(key .. ".wallLeft#collision", nil, components, i3dMappings)
    end

    local rightWallNode = xmlFile:getValue(key .. ".wallRight#node", nil, components, i3dMappings)
    if rightWallNode ~= nil then
        self.wallRight = {}
        self.wallRight.node = rightWallNode
        self.wallRight.visible = true
        self.wallRight.collision = xmlFile:getValue(key .. ".wallRight#collision", nil, components, i3dMappings)
    end

    self.fillLevel = 0

    -- adjust timings to difficulty
    local difficultyMultiplier = g_currentMission.missionInfo.economicDifficulty
    self.distanceToCompactedFillLevel = self.distanceToCompactedFillLevel/difficultyMultiplier

    self:setState(BunkerSilo.STATE_FILL)

    return true
end

---
function BunkerSilo.registerSavegameXMLPaths(schema, basePath)
    schema:register(XMLValueType.INT, basePath .. "#state", "Current silo state (FILL = 0, CLOSED = 1, FERMENTED = 2, DRAIN = 3)", 0)
    schema:register(XMLValueType.FLOAT, basePath .. "#fillLevel", "Current fill level")
    schema:register(XMLValueType.FLOAT, basePath .. "#compactedFillLevel", "Compacted fill level")
    schema:register(XMLValueType.FLOAT, basePath .. "#fermentingTime", "Fermenting time")
    schema:register(XMLValueType.BOOL, basePath .. "#openedAtFront", "Is opened at front", false)
    schema:register(XMLValueType.BOOL, basePath .. "#openedAtBack", "Is opened at back", false)
end

---Save to XML file
-- @param XMLFile xmlFile XMLFile instance
-- @param string key key
-- @param table usedModNames list of use dmod names
function BunkerSilo:saveToXMLFile(xmlFile, key, usedModNames)
    xmlFile:setValue(key.."#state", self.state)
    xmlFile:setValue(key.."#fillLevel", self.fillLevel)
    xmlFile:setValue(key.."#compactedFillLevel", self.compactedFillLevel)
    xmlFile:setValue(key.."#fermentingTime", self.fermentingPercent * BunkerSilo.MILLISECONDS_PER_DAY * g_currentMission.environment.daysPerPeriod)
    xmlFile:setValue(key.."#openedAtFront", self.isOpenedAtFront)
    xmlFile:setValue(key.."#openedAtBack", self.isOpenedAtBack)
end

---Loading from attributes and nodes
-- @param XMLFile xmlFile XMLFile instance
-- @param string key key
-- @return boolean success success
function BunkerSilo:loadFromXMLFile(xmlFile, key)

    local state = xmlFile:getValue(key.."#state")
    if state ~= nil then
        if state >= 0 and state < BunkerSilo.NUM_STATES then
            self:setState(state)
        end
    end

    local fillLevel = xmlFile:getValue(key.."#fillLevel")
    if fillLevel ~= nil then
        self.fillLevel = fillLevel
    end
    local compactedFillLevel = xmlFile:getValue(key.."#compactedFillLevel")
    if compactedFillLevel ~= nil then
        self.compactedFillLevel = math.clamp(compactedFillLevel, 0, self.fillLevel)
    end
    self.compactedPercent = MathUtil.getFlooredPercent(math.min(self.compactedFillLevel, self.fillLevel), self.fillLevel)

    local fermentingTime = xmlFile:getValue(key.."#fermentingTime")
    if fermentingTime ~= nil then
        -- Convert to percent
        self.fermentingPercent = fermentingTime / (BunkerSilo.MILLISECONDS_PER_DAY * g_currentMission.environment.daysPerPeriod)
    end

    self.isOpenedAtFront = xmlFile:getValue(key.."#openedAtFront", false)
    self.isOpenedAtBack = xmlFile:getValue(key.."#openedAtBack", false)

    if self.isOpenedAtFront then
        self.bunkerSiloArea.offsetFront = self:getBunkerAreaOffset(true, 0, self.outputFillType)
    else
        self.bunkerSiloArea.offsetFront = self:getBunkerAreaOffset(true, 0, self.fermentingFillType)
    end
    if self.isOpenedAtBack then
        self.bunkerSiloArea.offsetBack = self:getBunkerAreaOffset(false, 0, self.outputFillType)
    else
        self.bunkerSiloArea.offsetBack = self:getBunkerAreaOffset(false, 0, self.fermentingFillType)
    end

    if self.fillLevel > 0 and self.state == BunkerSilo.STATE_DRAIN then
        local area = self.bunkerSiloArea
        local offWx = area.wx - area.sx
        local offWz = area.wz - area.sz
        local offW = math.sqrt(offWx*offWx + offWz*offWz)

        local offHx = area.hx - area.sx
        local offHz = area.hz - area.sz
        local offH = math.sqrt(offHx*offHx + offHz*offHz)

        if offW > 0.001 and offH > 0.001 then
            -- offset by 0.9m in each direction (and max 45%)
            local offWScale = math.min(0.45, 0.9 / offW)
            offWx = offWx * offWScale
            offWz = offWz * offWScale

            local offHScale = math.min(0.45, 0.9 / offH)
            offHx = offHx * offHScale
            offHz = offHz * offHScale

            local innerFillLevel1 = DensityMapHeightUtil.getFillLevelAtArea(self.fermentingFillType, area.sx+offWx+offHx,area.sz+offWz+offHz, area.wx-offWx+offHx,area.wz-offWz+offHz, area.hx+offWx-offHx,area.hz+offWz-offHz)
            local innerFillLevel2 = DensityMapHeightUtil.getFillLevelAtArea(self.outputFillType,     area.sx+offWx+offHx,area.sz+offWz+offHz, area.wx-offWx+offHx,area.wz-offWz+offHz, area.hx+offWx-offHx,area.hz+offWz-offHz)
            local innerFillLevel = innerFillLevel1 + innerFillLevel2
            if innerFillLevel < self.emptyThreshold*0.5 then
                DensityMapHeightUtil.removeFromGroundByArea(area.sx,area.sz, area.wx,area.wz, area.hx,area.hz, self.fermentingFillType)
                DensityMapHeightUtil.removeFromGroundByArea(area.sx,area.sz, area.wx,area.wz, area.hx,area.hz, self.outputFillType)
                self:setState(BunkerSilo.STATE_FILL, false)
            end
        end

        DensityMapHeightUtil.changeFillTypeAtArea(area.sx, area.sz, area.wx, area.wz, area.hx, area.hz, self.inputFillType, self.outputFillType)
    elseif self.fillLevel > 0 and (self.state == BunkerSilo.STATE_CLOSED or self.state == BunkerSilo.STATE_FERMENTED) then
        local area = self.bunkerSiloArea
        DensityMapHeightUtil.changeFillTypeAtArea(area.sx, area.sz, area.wx, area.wz, area.hx, area.hz, self.inputFillType, self.fermentingFillType)
    elseif self.state == BunkerSilo.STATE_FILL then
        local area = self.bunkerSiloArea
        local fermentingFillLevel, fermentingPixels, totalFermentingPixels = DensityMapHeightUtil.getFillLevelAtArea(self.fermentingFillType, area.sx,area.sz, area.wx,area.wz, area.hx,area.hz)
        -- Set to fermented state if more than 50% of the area is filled with fermenting fill type
        if fermentingFillLevel > self.emptyThreshold and fermentingPixels > 0.5 * totalFermentingPixels then
            local _inputFillLevel, inputPixels, totalInputPixels = DensityMapHeightUtil.getFillLevelAtArea(self.inputFillType, area.sx,area.sz, area.wx,area.wz, area.hx,area.hz)
            -- Only change if less than 10% is filled with input type (chaff) (ie. the silo is not being filled)
            if inputPixels < 0.1*totalInputPixels then
                self:setState(BunkerSilo.STATE_FERMENTED, false)
            end
        end
    end

    return true
end

---Called on client side on join
-- @param integer streamId stream ID
-- @param table connection connection
function BunkerSilo:readStream(streamId, connection)
    BunkerSilo:superClass().readStream(self, streamId, connection)
    if connection:getIsServer() then
        local state = streamReadUIntN(streamId, 3)
        self:setState(state)
        self.isOpenedAtFront = streamReadBool(streamId)
        self.isOpenedAtBack = streamReadBool(streamId)
        self.fillLevel = streamReadFloat32(streamId)
        self.compactedPercent = streamReadUIntN(streamId, 7)
        self.fermentingPercent = NetworkUtil.readCompressedPercentages(streamId)
    end
end

---Called on server side on join
-- @param integer streamId stream ID
-- @param table connection connection
function BunkerSilo:writeStream(streamId, connection)
    BunkerSilo:superClass().writeStream(self, streamId, connection)
    if not connection:getIsServer() then
        streamWriteUIntN(streamId, self.state, 3)
        streamWriteBool(streamId, self.isOpenedAtFront)
        streamWriteBool(streamId, self.isOpenedAtBack)
        streamWriteFloat32(streamId, self.fillLevel)
        streamWriteUIntN(streamId, self.compactedPercent, 7)
        NetworkUtil.writeCompressedPercentages(streamId, self.fermentingPercent)
    end
end

---Called on client side on update
-- @param integer streamId stream ID
-- @param integer timestamp timestamp
-- @param table connection connection
function BunkerSilo:readUpdateStream(streamId, timestamp, connection)
    BunkerSilo:superClass().readUpdateStream(self, streamId, timestamp, connection)
    if connection:getIsServer() then
        if streamReadBool(streamId) then
            local state = streamReadUIntN(streamId, 3)
            if state ~= self.state then
                self:setState(state, true)
            end

            self.fillLevel = streamReadFloat32(streamId)
            self.isOpenedAtFront = streamReadBool(streamId)
            self.isOpenedAtBack = streamReadBool(streamId)

            if self.state == BunkerSilo.STATE_FILL then
                self.compactedPercent = streamReadUIntN(streamId, 7)
            elseif self.state == BunkerSilo.STATE_CLOSED or self.state == BunkerSilo.STATE_FERMENTED then
                self.fermentingPercent = NetworkUtil.readCompressedPercentages(streamId)
            end
        end
    end
end


---Called on server side on update
-- @param integer streamId stream ID
-- @param table connection connection
-- @param integer dirtyMask dirty mask
function BunkerSilo:writeUpdateStream(streamId, connection, dirtyMask)
    BunkerSilo:superClass().writeUpdateStream(self, streamId, connection, dirtyMask)
    if not connection:getIsServer() then
        if streamWriteBool(streamId, bit32.band(dirtyMask, self.bunkerSiloDirtyFlag) ~= 0) then
            streamWriteUIntN(streamId, self.state, 3)

            streamWriteFloat32(streamId, self.fillLevel)
            streamWriteBool(streamId, self.isOpenedAtFront)
            streamWriteBool(streamId, self.isOpenedAtBack)

            if self.state == BunkerSilo.STATE_FILL then
                streamWriteUIntN(streamId, self.compactedPercent, 7)
            elseif self.state == BunkerSilo.STATE_CLOSED or self.state == BunkerSilo.STATE_FERMENTED then
                NetworkUtil.writeCompressedPercentages(streamId, self.fermentingPercent)
            end
        end
    end
end

---UpdateTick
-- @param float dt time since last call in ms
function BunkerSilo:updateTick(dt)
    if self.isServer then
        self.updateTimer = self.updateTimer - dt
        if self.updateTimer <= 0 then
            self.updateTimer = 200 + math.random()*100 -- update every 200 to 300ms

            local oldFillLevel = self.fillLevel
            self:updateFillLevel()
            if oldFillLevel ~= self.fillLevel then
                self:updateCompacting(self.compactedFillLevel)
            end
        end
    end
    if not self.adjustedOpeningLength then
        self.adjustedOpeningLength = true
        self.openingLength = math.max(self.openingLength, DensityMapHeightUtil.getDefaultMaxRadius(self.outputFillType)+1)
    end
end

---interactionTriggerCallback
-- @param integer triggerId id of trigger
-- @param integer otherId id of actor
-- @param boolean onEnter on enter
-- @param boolean onLeave on leave
-- @param boolean onStay on stay
-- @param integer otherId id of other actor
function BunkerSilo:interactionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId)
    if onEnter or onLeave then
        if g_localPlayer ~= nil and otherId == g_localPlayer.rootNode then
            if onEnter then
                self.playerInRange = true
                g_currentMission.activatableObjectsSystem:addActivatable(self.activatable)
            else
                self.playerInRange = false
                if self.numVehiclesInRange == 0 then
                    g_currentMission.activatableObjectsSystem:removeActivatable(self.activatable)
                end
            end
        else
            local vehicle = g_currentMission:getNodeObject(otherShapeId)
            if vehicle ~= nil and vehicle:isa(Vehicle) then
                if onEnter then
                    if self.vehiclesInRange[vehicle] == nil then
                        self.vehiclesInRange[vehicle] = true
                        self.numVehiclesInRange = self.numVehiclesInRange + 1

                        g_currentMission.activatableObjectsSystem:addActivatable(self.activatable)

                        -- add callback if shovel
                        if vehicle.setBunkerSiloInteractorCallback ~= nil then
                            vehicle:setBunkerSiloInteractorCallback(BunkerSilo.onChangedFillLevelCallback, self)
                        end
                    end
                else
                    if self.vehiclesInRange[vehicle] then
                        self.vehiclesInRange[vehicle] = nil
                        self.numVehiclesInRange = self.numVehiclesInRange - 1

                        if self.numVehiclesInRange == 0 and not self.playerInRange then
                            g_currentMission.activatableObjectsSystem:removeActivatable(self.activatable)
                        end

                        -- remove callback if shovel
                        if vehicle.setBunkerSiloInteractorCallback ~= nil then
                            vehicle:setBunkerSiloInteractorCallback(nil)
                        end
                    end
                end
            end
        end
    end
end

---Get bunker area offset
-- @param boolean updateAtFront update at front
-- @param float offset offset
-- @param integer fillType fill type
-- @return float offset offset
function BunkerSilo:getBunkerAreaOffset(updateAtFront, offset, fillType)
    local area = self.bunkerSiloArea

    local hx, hz = area.dhx_norm, area.dhz_norm
    local hl = MathUtil.vector3Length(area.dhx, area.dhy, area.dhz)

    while offset <= (hl - 1) do
        local pos = offset
        if not updateAtFront then
            pos = hl - offset - 1
        end
        local d1x,d1z = pos*hx, pos*hz
        local d2x,d2z = (pos+1)*hx, (pos+1)*hz

        local a0x, a0z = area.sx + d1x, area.sz + d1z
        local a1x, a1z = area.wx + d1x, area.wz + d1z
        local a2x, a2z = area.sx + d2x, area.sz + d2z

        local fillLevel = DensityMapHeightUtil.getFillLevelAtArea(fillType, a0x,a0z, a1x,a1z, a2x,a2z)
        if fillLevel > 0 then
            return offset
        end
        offset = offset + 1
    end

    return math.max(hl - 1, 0)
end