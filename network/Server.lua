---@class Server
Server = {};

local Server_mt = Class(Server, NetworkNode);

---Creates a new instance
---@return Server
function Server.new()
    local self = NetworkNode.new(Server_mt)
    return self
end

---@param event Event event instance to broadcast
---@param sendLocal? boolean also send to the local client connection
---@param ignoreConnection? table connection to exclude from the broadcast
---@param ghostObject? Object only send to connections that already know this object
---@param force? boolean force sending immediately, bypassing queuing
---@param connectionList? table list of connections to send to, defaults to all client connections
---@param allowQueuing? boolean queue the event for connections that don't know ghostObject yet, instead of skipping them
function Server:broadcastEvent(event, sendLocal, ignoreConnection, ghostObject, force, connectionList, allowQueuing)
end

g_server = Server.new()