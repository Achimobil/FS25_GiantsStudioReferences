SpecializationUtil = {}

---Registers a function that specializations can call on object instances
---@param objectType table specialization type table to register the function on
---@param eventName string name of the function to register
---@param func function function implementation
function SpecializationUtil.registerFunction(objectType, eventName, func)
end

---Registers a specialization as a listener for the given event
---@param objectType table specialization type table to register the listener on
---@param eventName string name of the event
---@param spec table specialization class table implementing the event
function SpecializationUtil.registerEventListener(objectType, eventName, spec)
end

---Registers a function that overwrites an already registered function, receiving the original as an extra argument
---@param objectType table specialization type table whose function will be overwritten
---@param funcName string name of the function to overwrite
---@param func function new function implementation
function SpecializationUtil.registerOverwrittenFunction(objectType, funcName, func)
end

---Checks whether the given specialization is contained in the specializations list
---@param specialization table specialization to check for
---@param specializations table list of specializations
---@return boolean
function SpecializationUtil.hasSpecialization(specialization, specializations)
end