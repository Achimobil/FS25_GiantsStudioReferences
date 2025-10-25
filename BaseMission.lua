BaseMission = {};
BaseMission.nodeToObject = {}
BaseMission.currentMapTargetHotspot = {}

local BaseMission_mt = Class(BaseMission);

--- create new instance
-- @param table customMt
-- @return BaseMission newObject
function BaseMission.new(baseDirectory, customMt)
    local self = setmetatable({}, customMt or BaseMission_mt);
    self.maps = {};
    self.isRunning = false;
    return self;
end


---Read if we are on server the host or in SP
function BaseMission:getIsServer()
end

function BaseMission:getNodeObject(nodeId)
    return 1;
end

function BaseMission:addUpdateable(node, customKey)
end