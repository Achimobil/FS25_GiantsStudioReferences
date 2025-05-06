AbstractManager = {}

local AbstractManager_mt = Class(AbstractManager)

--- create new instance
-- @param table customMt
-- @return AbstractManager newObject
function AbstractManager.new(customMt)
    local self = setmetatable({}, customMt or AbstractManager_mt);
    return self;
end