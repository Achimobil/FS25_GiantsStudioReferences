FSCareerMissionInfo = {};

local FSCareerMissionInfo_mt = Class(FSCareerMissionInfo, MissionInfo);

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