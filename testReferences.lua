
g_currentModName = "CurrentModName";
g_currentModDirectory = "CurrentModName";

---Add trigger to a rigid body shape
---@param triggerNodeId integer
---@param callbackFunctionName string callback(entityId triggerId, entityId otherId, boolean onEnter, boolean onLeave, boolean onStay, entityId otherShapeId, integer subShapeIndex)
---@param callbackTarget? table target object [optional]
---@param reportOnStay? boolean if true, the callback function is called every frame while an object is inside [optional, default=false]
---@param callbackFunction? function a function that is called. If nil, callback is called by the 'callbackFunctionName' and 'callbackTarget' [optional, default=nil]
---@return integer callbackId
function addTrigger(triggerNodeId, callbackFunctionName, callbackTarget, reportOnStay, callbackFunction)
end

---Remove trigger
---@param triggerNodeId integer
---@param callbackId? integer [optional] if not provided, the callback with no callbackFunction is removed
function removeTrigger(triggerNodeId, callbackId)
end

function addModEventListener(mod)
end

function renderText3D(x, y, z, rx, ry, rz, textSize, text)
end

function Class(current, baseClass)
end

function addTimer(timeInMiliSeconds, callbackName, callbackObject)
end

---Entity exists
---@param objectId integer
---@return boolean doesExist
function entityExists(objectId)
    return true;
end

---Checks whether a file exists at the given path
---@param filePath string Absolute or mod-relative path to the file
---@return boolean
function fileExists(filePath)
end

function getIsSplitShapeSplit(objectId)
end

function getSplitShapeStats(objectId)
end