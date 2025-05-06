FSBaseMission = {};

FSBaseMission.activatableObjectsSystem = ActivatableObjectsSystem;
FSBaseMission.storageSystem = StorageSystem;
FSBaseMission.productionChainManager = ProductionChainManager;
FSBaseMission.husbandrySystem = HusbandrySystem;
FSBaseMission.placeableSystem = PlaceableSystem;
FSBaseMission.environment = Environment;
FSBaseMission.missionInfo = FSCareerMissionInfo;

FSBaseMission.isExitingGame = false;
FSBaseMission.hud = HUD;

local FSBaseMission_mt = Class(FSBaseMission, BaseMission)

--- create new instance
-- @param string baseDirectory
-- @param table customMt
-- @return FSBaseMission newObject
function FSBaseMission.new(baseDirectory, customMt)
    local self = FSBaseMission:superClass().new(baseDirectory, customMt or FSBaseMission_mt);
    return self;
end

---Get the Farm Id of the current player
-- @return integer farmId
function FSBaseMission:getFarmId()
    return 1;
end

g_currentMission = FSBaseMission.new();

---This is sub class of FSBaseMission
Mission00 = FSBaseMission;