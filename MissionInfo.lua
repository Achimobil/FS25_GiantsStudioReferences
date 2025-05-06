MissionInfo = {};

local MissionInfo_mt = Class(MissionInfo);

function MissionInfo.new(baseDirectory, customEnvironment, customMt)
    local self = setmetatable({}, customMt or MissionInfo_mt)
    self.baseDirectory = baseDirectory
    self.customEnvironment = customEnvironment
    return self
end

function FSCareerMissionInfo:saveToXMLFile()
end