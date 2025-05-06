YesNoDialog = {};

local YesNoDialog_mt = Class(YesNoDialog, MessageDialog);

--- create new instance
-- @param table customMt
-- @return YesNoDialog newObject
function YesNoDialog.new(target, customMt)
    local self = MessageDialog.new(target, customMt or YesNoDialog_mt);
    return self;
end