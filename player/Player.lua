Player = Player;

---Get position.
-- @return float X position
-- @return float Y position
-- @return float Z position
function Player:getPosition()
    return 1,2,3
end

g_localPlayer = Player.new(true, true)