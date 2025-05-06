PlayerHUDUpdater = {};

local PlayerHUDUpdater_mt = Class(PlayerHUDUpdater);

function PlayerHUDUpdater.new()
    local self = setmetatable({}, PlayerHUDUpdater_mt);
    return self
end