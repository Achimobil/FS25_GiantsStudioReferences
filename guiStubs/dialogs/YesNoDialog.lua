---@class YesNoDialog
YesNoDialog = {};

local YesNoDialog_mt = Class(YesNoDialog, MessageDialog);

---Creates a new instance
---@param target table|nil
---@param customMt table|nil
---@return YesNoDialog
function YesNoDialog.new(target, customMt)
    local self = MessageDialog.new(target, customMt or YesNoDialog_mt);
    return self;
end