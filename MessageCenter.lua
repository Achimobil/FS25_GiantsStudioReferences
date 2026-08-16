---@class MessageCenter
MessageCenter = {}
local MessageCenter_mt = Class(MessageCenter)

---Creates a new instance
---@param customMt? table
---@return MessageCenter
function MessageCenter.new(customMt)
    local self = setmetatable({}, MessageCenter_mt)
    self.subscribers = {}
    self.queue = {}

    return self
end

---Subscribes a callback to a message type
---@param messageType integer
---@param callback function
---@param callbackTarget? table
---@param argument? any
---@param isOneShot? boolean
function MessageCenter:subscribe(messageType, callback, callbackTarget, argument, isOneShot)
end

---Unsubscribes a callback from a message type
---@param messageType integer
---@param callbackTarget table
---@param callback? function
function MessageCenter:unsubscribe(messageType, callbackTarget, callback)
end

g_messageCenter = MessageCenter.new();