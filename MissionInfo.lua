---@class MissionInfo
MissionInfo = {};

local MissionInfo_mt = Class(MissionInfo);

---Creates a new instance
---@param baseDirectory string
---@param customEnvironment? string
---@param customMt? table
---@return MissionInfo
function MissionInfo.new(baseDirectory, customEnvironment, customMt)
    local self = setmetatable({}, customMt or MissionInfo_mt)
    self.baseDirectory = baseDirectory
    self.customEnvironment = customEnvironment
    return self
end

---Saves the mission info to the savegame XML file
function FSCareerMissionInfo:saveToXMLFile()
end