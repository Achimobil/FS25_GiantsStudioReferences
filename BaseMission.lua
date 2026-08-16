---@class BaseMission
BaseMission = {};
BaseMission.nodeToObject = {}
BaseMission.currentMapTargetHotspot = {}

local BaseMission_mt = Class(BaseMission);

---Creates a new instance
---@param baseDirectory string base directory used to resolve mod/map relative paths
---@param customMt? table custom metatable for the subclass instance
---@return BaseMission newObject
function BaseMission.new(baseDirectory, customMt)
    local self = setmetatable({}, customMt or BaseMission_mt);
    self.maps = {};
    self.isRunning = false;
    return self;
end


---Read if we are on server the host or in SP
function BaseMission:getIsServer()
end

---Gets the object mapped to a scene node id
---@param nodeId integer scene node id
---@return table|nil object instance mapped to `nodeId` (e.g. Vehicle, Player, Farm, Placeable), or nil if not found
function BaseMission:getNodeObject(nodeId)
    return 1;
end

---Registers an object to receive per-frame update() calls
---@param node table object with an update function to call every frame
---@param customKey? any key to store/replace the updateable under (defaults to the object itself)
function BaseMission:addUpdateable(node, customKey)
end

---Sets (or clears) the currently highlighted map target hotspot
---@param mapHotspot? table hotspot to highlight and mark persistent, or nil to clear the current one
function BaseMission:setMapTargetHotspot(mapHotspot)
end