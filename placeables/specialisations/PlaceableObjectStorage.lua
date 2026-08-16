---@class PlaceableObjectStorage
PlaceableObjectStorage = {};

---Updates the object storage's visual spawn areas
function PlaceableObjectStorage:updateObjectStorageVisualAreas()
    return true;
end

---Registers specialization functions on the given placeable type
---@param placeableType table placeable type object receiving the registered functions
function PlaceableObjectStorage.registerFunctions(placeableType)
end