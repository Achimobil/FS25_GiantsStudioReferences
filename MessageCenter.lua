MessageCenter = {}
local MessageCenter_mt = Class(MessageCenter)

function MessageCenter.new(customMt)
    local self = setmetatable({}, MessageCenter_mt)
    self.subscribers = {}
    self.queue = {}

    return self
end

function MessageCenter:subscribe(messageType, callback, callbackTarget, argument, isOneShot)
end

function MessageCenter:unsubscribe(messageType, callbackTarget, callback)
end

g_messageCenter = MessageCenter.new();