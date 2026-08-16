---@class TreePlantManager
TreePlantManager = {};

local TreePlantManager_mt = Class(TreePlantManager, AbstractManager)

---Creates a new instance
---@param customMt? table custom metatable for the subclass instance
---@return TreePlantManager
function TreePlantManager.new(customMt)
    local self = AbstractManager.new(customMt or TreePlantManager_mt)

    return self
end

---Initializes the tree plant manager's runtime data (called once on mission start)
function TreePlantManager:initialize()
    local rootNode = createTransformGroup("trees")
    link(getRootNode(), rootNode)

    self.treesData = {}
    self.treesData.rootNode = rootNode
    self.treesData.growingTrees = {}
    self.treesData.splitTrees = {}
    self.treesData.clientTrees = {}
    self.treesData.updateDtGame = 0
    self.treesData.treeCutJoints = {}
    self.treesData.numTreesWithoutSplits = 0
end

---Returns the tree type description for the given tree type index
---@param index integer tree type index
---@return table? treeTypeDesc
function TreePlantManager:getTreeTypeDescFromIndex(index)
    if self.treeTypes ~= nil then
        return self.treeTypes[index]
    end
    return nil
end

g_treePlantManager = TreePlantManager.new();