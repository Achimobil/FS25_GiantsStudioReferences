---@class Event
Event = {}
local Event_mt = Class(Event)

---@param customMt table|nil custom metatable for the subclass instance
---@param networkChannel integer|nil network channel to send this event on
---@return Event
function Event.new(customMt, networkChannel)
end

function Event:delete()
end

---@param streamId integer network stream identification
---@param connection table connection information
function Event:readStream(streamId, connection)
end

---@param streamId integer network stream identification
---@param connection table connection information
function Event:writeStream(streamId, connection)
end

---@param connection table connection information
function Event:run(connection)
end
