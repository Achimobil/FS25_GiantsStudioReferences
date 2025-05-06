Server = {};

local Server_mt = Class(Server, NetworkNode);

function Server.new()
    local self = NetworkNode.new(Server_mt)
    return self
end

function Server:broadcastEvent(event, sendLocal, ignoreConnection, ghostObject, force, connectionList, allowQueuing)
end

g_server = Server.new()