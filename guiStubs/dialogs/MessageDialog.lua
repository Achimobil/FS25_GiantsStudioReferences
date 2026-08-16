---@class MessageDialog
MessageDialog = {}
local MessageDialog_mt = Class(MessageDialog, DialogElement)

---Creates a new instance
---@param target table|nil
---@param customMt table|nil
---@return MessageDialog
function MessageDialog.new(target, customMt)
    local self = DialogElement.new(target, customMt or MessageDialog_mt)
    return self
end