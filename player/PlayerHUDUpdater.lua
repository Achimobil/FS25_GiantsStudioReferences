---@class PlayerHUDUpdater
PlayerHUDUpdater = {};

local PlayerHUDUpdater_mt = Class(PlayerHUDUpdater);

---Creates a new instance
---@return PlayerHUDUpdater
function PlayerHUDUpdater.new()
    local self = setmetatable({}, PlayerHUDUpdater_mt);
    return self
end