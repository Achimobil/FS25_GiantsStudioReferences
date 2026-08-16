---@class ActivatableObjectsSystem
ActivatableObjectsSystem = {};

---Registers an object as an activatable object (e.g. a shop trigger) so it can react to the player's activate input
---@param activatable table object with an activateText field to register
function ActivatableObjectsSystem:addActivatable(activatable)
end

---Unregisters a previously registered activatable object
---@param activatable table object to unregister
function ActivatableObjectsSystem:removeActivatable(activatable)
end