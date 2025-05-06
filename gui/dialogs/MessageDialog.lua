MessageDialog = {}
local MessageDialog_mt = Class(MessageDialog, DialogElement)

--- create new instance
-- @param table customMt
-- @return MessageDialog newObject
function MessageDialog.new(target, customMt)
    local self = DialogElement.new(target, customMt or MessageDialog_mt)
    return self
end