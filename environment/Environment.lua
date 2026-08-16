---@class Environment
Environment = {};
Environment.lighting = Lighting.new();

local Environment_mt = Class(Environment);

---Creates a new instance
---@param mission table
---@return Environment newObject
function Environment.new(mission)
    local self = setmetatable({}, Environment_mt);

    self.mission = mission;

    self.isSunOn = true;

    self.currentDay = 1;
    self.currentHour = 1;
    self.daysPerPeriod = 1;
    self.timeAdjustment = 1 / self.daysPerPeriod;
    self.weather = Weather.new(self)

    return self;
end