Player = {};

local Player_mt = Class(Player, Object)

--- create new instance
-- @param boolean isServer
-- @param boolean isClient
-- @return ProductionPoint newObject
function Player.new(isServer, isClient)
    local self = Object.new(isServer, isClient, Player_mt);
    return self;
end

--- Get Position of the player
-- @return float x
-- @return float y
-- @return float z
function Player:getPosition()
    return 0,0,0;
end

g_localPlayer = Player;