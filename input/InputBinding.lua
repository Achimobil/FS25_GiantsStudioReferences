g_inputBinding = InputBinding;


---Registers a new action event for the given input action
---@param actionName string InputAction name to bind the event to
---@param targetObject table object the eventCallback is invoked on (self)
---@param eventCallback function callback invoked when the action event triggers
---@param triggerUp? boolean trigger the callback when the input is released
---@param triggerDown? boolean trigger the callback when the input is pressed
---@param triggerAlways? boolean trigger the callback every frame while active
---@param startActive? boolean whether the action event starts active
---@param callbackState? any state value passed through to the eventCallback
---@param disableConflictingBindings? boolean disable other bindings that collide with this action
---@param reportAnyDeviceCollision? boolean also report collisions on other input devices
---@return boolean success true if the action event was registered
---@return string eventId id of the registered action event
---@return table? collidingEvents action events colliding with this registration, if any
function InputBinding:registerActionEvent(actionName, targetObject, eventCallback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, disableConflictingBindings, reportAnyDeviceCollision)
end

---Sets whether the help text of a registered action event should be displayed
---@param eventId string id of the registered action event
---@param isVisible boolean whether the action event's help text should be shown
function InputBinding:setActionEventTextVisibility(eventId, isVisible)
end

InputBinding.nameActions = {}