Client = {};

local Server_mt = Class(Client, NetworkNode);

function Client.new()
    local self = NetworkNode.new(Server_mt)
    return self
end

function Client:getServerConnection(p110)
    return p110.serverConnection
end

g_client = Client.new()