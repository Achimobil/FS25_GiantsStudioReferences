FSBaseMission = {};

FSBaseMission.activatableObjectsSystem = ActivatableObjectsSystem;
FSBaseMission.storageSystem = StorageSystem;
FSBaseMission.productionChainManager = ProductionChainManager;
FSBaseMission.husbandrySystem = HusbandrySystem.new()
FSBaseMission.placeableSystem = PlaceableSystem;
FSBaseMission.environment = Environment;
FSBaseMission.missionInfo = FSCareerMissionInfo;
FSBaseMission.animalSystem = AnimalSystem.new();
FSBaseMission.isExitingGame = false;
FSBaseMission.hud = HUD;

local FSBaseMission_mt = Class(FSBaseMission, BaseMission)

--- create new instance
-- @param string baseDirectory
-- @param table customMt
-- @return FSBaseMission newObject
function FSBaseMission.new(baseDirectory, customMt)
    local self = FSBaseMission:superClass().new(baseDirectory, customMt or FSBaseMission_mt);
    self.animalFoodSystem = AnimalFoodSystem.new(self);
    self.animalSystem = AnimalSystem.new();
    return self;
end

---Get the Farm Id of the current player
-- @return integer farmId
function FSBaseMission:getFarmId()
    return 1;
end

---Has the Player a certain permission
-- @param string permission permission
-- @param table? connection connection
-- @param integer? farmId
-- @param boolean? unknown nicht bekannt
-- @return boolean true if permission granted
function FSBaseMission:getHasPlayerPermission(permission, connection, farmId, unknown)
    return true;
end

g_currentMission = FSBaseMission.new();

---This is sub class of FSBaseMission
Mission00 = FSBaseMission;