---@class NetworkNode
NetworkNode = {};

local NetworkNode_mt = Class(NetworkNode);

---Creates a new instance
---@param customMt? table custom metatable for the subclass instance
---@return NetworkNode
function NetworkNode.new(customMt)
    local self = setmetatable({}, customMt or NetworkNode_mt);
    return self;
end