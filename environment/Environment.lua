Environment = {};
Environment.lighting = Lighting.new();

local Environment_mt = Class(Environment);

--- create new instance
-- @param table mission
-- @return Environment newObject
function Environment.new(mission)
    local self = setmetatable({}, Environment_mt);

    self.mission = mission;

    self.isSunOn = true;

    self.currentDay = 1;
    self.currentHour = 1;
    self.daysPerPeriod = 1;
    self.timeAdjustment = 1 / self.daysPerPeriod;

    return self;
end