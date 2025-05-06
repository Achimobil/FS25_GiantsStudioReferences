XMLManager = {};

local XMLManager_mt = Class(XMLManager);

function XMLManager.new(customMt)
    local self = setmetatable({}, customMt or XMLManager_mt);
    return self;
end

function XMLManager:addCreateSchemaFunction(createSchemaFunction)
end

g_xmlManager = XMLManager.new();