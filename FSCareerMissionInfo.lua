---@class FSCareerMissionInfo
FSCareerMissionInfo = {};

local FSCareerMissionInfo_mt = Class(FSCareerMissionInfo, MissionInfo);

---Creates a new instance
---@param baseDirectory string base directory used to resolve mod/map relative paths
---@param customEnvironment? any custom mod environment
---@param savegameIndex integer savegame slot index
---@param customMt? table custom metatable for the subclass instance
---@return FSCareerMissionInfo newObject
function FSCareerMissionInfo.new(baseDirectory, customEnvironment, savegameIndex, customMt)
    local self = FSCareerMissionInfo:superClass().new(baseDirectory, customEnvironment, customMt or FSCareerMissionInfo_mt);
    self.savegameIndex = savegameIndex;
    self.savegameDirectory = self:getSavegameDirectory(self.savegameIndex);
    self.displayName = g_i18n:getText("ui_savegame") .. " " .. self.savegameIndex;
    self.xmlKey = "careerSavegame";
    self.tipTypeMappings = {};
    self.weedsEnabled = true
    return self
end