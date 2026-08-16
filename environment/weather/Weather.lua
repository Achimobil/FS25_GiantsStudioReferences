---@class Weather
Weather = {};

local Weather_mt = Class(Weather);

---Creates a new instance
---@param owner Environment
---@param customMt? table
---@return Weather newObject
function Weather.new(owner, customMt)
    local self = setmetatable({}, customMt or Weather_mt);

    self.owner = owner;

    return self;
end

function Weather:getIsRaining()
    return self:getRainFallScale() > 0.05;
end