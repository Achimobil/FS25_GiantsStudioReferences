---@class Client
Client = {};

local Server_mt = Class(Client, NetworkNode);

---Creates a new instance
---@return Client
function Client.new()
    local self = NetworkNode.new(Server_mt)
    return self
end

---@return table serverConnection connection to the server
function Client:getServerConnection(p110)
    return p110.serverConnection
end

g_client = Client.new()