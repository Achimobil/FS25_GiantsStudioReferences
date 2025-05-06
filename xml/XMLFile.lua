XMLFile = {};

local XMLFile_mt = Class(XMLFile);


--- Create file instance without loading it
-- @param string objectName
-- @param string xmlFilename
-- @return XMLFile newObject
function XMLFile.new(objectName, filename, handle, schema)
    local self = setmetatable({}, XMLFile_mt);
    return self;
end

--- Load the file
-- @param string objectName
-- @param string xmlFilename
-- @return XMLFile newObject
function XMLFile.load(objectName, xmlFilename, schema)
    return "";
end