TreePlantManager = {};

local TreePlantManager_mt = Class(TreePlantManager, AbstractManager)

--- create new instance
-- @param table customMt
-- @return TreePlantManager newObject
function TreePlantManager.new(customMt)
    local self = AbstractManager.new(customMt or TreePlantManager_mt)

    return self
end

---
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

---
function TreePlantManager:getTreeTypeDescFromIndex(index)
    if self.treeTypes ~= nil then
        return self.treeTypes[index]
    end
    return nil
end

g_treePlantManager = TreePlantManager.new();