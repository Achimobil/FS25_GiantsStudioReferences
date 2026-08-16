---@class XMLManager
XMLManager = {};

local XMLManager_mt = Class(XMLManager);

---Creates a new instance
---@param customMt? table
---@return XMLManager
function XMLManager.new(customMt)
    local self = setmetatable({}, customMt or XMLManager_mt);
    return self;
end

---Registers a function that creates an XML schema, called when schemas are (re-)created
---@param createSchemaFunction function
function XMLManager:addCreateSchemaFunction(createSchemaFunction)
end

g_xmlManager = XMLManager.new();