Weather = {};

local Weather_mt = Class(Weather);

--- create new instance
-- @return Weather newObject
function Weather.new(owner, customMt)
    local self = setmetatable({}, customMt or Weather_mt);

    self.owner = owner;

    return self;
end

function Weather:getIsRaining()
    return self:getRainFallScale() > 0.05;
end