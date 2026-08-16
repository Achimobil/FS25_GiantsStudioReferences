Utils = {}

---Resolves a relative filename against a base directory
---@param relFilename? string filename, may be relative or start with '$' for the game base path
---@param baseDirectory? string base directory to prepend
---@return string|nil filename resolved filename
---@return boolean|nil isRelativeToBaseDir whether the base directory was applied
function Utils.getFilename(relFilename, baseDirectory)
end

---Combines two functions so both get called in sequence when the returned function is invoked
---@param originalFunc? function original function, called first if given
---@param appendFunc function function called after the original function
---@return function
function Utils.appendedFunction(originalFunc, appendFunc)
end

---Returns the first argument if it is not nil, otherwise the second
---@param first any value to check
---@param second any fallback value used if first is nil
---@return any
function Utils.getNoNil(first, second)
end
