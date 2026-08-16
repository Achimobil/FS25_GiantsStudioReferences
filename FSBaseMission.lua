---@class FSBaseMission
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

---Creates a new instance
---@param baseDirectory string base directory used to resolve mod/map relative paths
---@param customMt? table custom metatable for the subclass instance
---@return FSBaseMission newObject
function FSBaseMission.new(baseDirectory, customMt)
    local self = FSBaseMission:superClass().new(baseDirectory, customMt or FSBaseMission_mt);
    self.animalFoodSystem = AnimalFoodSystem;
    self.animalSystem = AnimalSystem.new();
    return self;
end

---Gets the farm id of the current player
---@return integer farmId
function FSBaseMission:getFarmId()
    return 1;
end

---Checks whether the player has a certain permission
---@param permission string permission to check
---@param connection? table connection
---@param farmId? integer
---@param unknown? boolean nicht bekannt
---@return boolean true if permission granted
function FSBaseMission:getHasPlayerPermission(permission, connection, farmId, unknown)
    return true;
end

g_currentMission = FSBaseMission.new();

---This is sub class of FSBaseMission
Mission00 = FSBaseMission;