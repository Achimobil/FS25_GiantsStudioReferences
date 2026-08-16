---@class XMLFile
XMLFile = {};

local XMLFile_mt = Class(XMLFile);


---Creates a file instance without loading it
---@param objectName string
---@param filename string
---@param handle integer
---@param schema? XMLSchema
---@return XMLFile
function XMLFile.new(objectName, filename, handle, schema)
    local self = setmetatable({}, XMLFile_mt);
    return self;
end

---Loads the file
---@param objectName string
---@param xmlFilename string
---@param schema? XMLSchema
---@return XMLFile|nil
function XMLFile.load(objectName, xmlFilename, schema)
    return "";
end