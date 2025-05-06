NetworkNode = {};

local NetworkNode_mt = Class(NetworkNode);

function NetworkNode.new(customMt)
    local self = setmetatable({}, customMt or NetworkNode_mt);
    return self;
end