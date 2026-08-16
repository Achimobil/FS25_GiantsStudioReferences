Player = Player;

---Gets the position.
---@return number X position
---@return number Y position
---@return number Z position
function Player:getPosition()
    return 1,2,3
end

g_localPlayer = Player.new(true, true)