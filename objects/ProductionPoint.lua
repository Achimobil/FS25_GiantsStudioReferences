ProductionPoint = {};

ProductionPoint.OUTPUT_MODE = {};
ProductionPoint.OUTPUT_MODE.KEEP = 0;
ProductionPoint.OUTPUT_MODE.DIRECT_SELL = 1;
ProductionPoint.OUTPUT_MODE.AUTO_DELIVER = 2;
ProductionPoint.OUTPUT_MODE_NUM_BITS = 2;

ProductionPoint.PROD_STATUS = {};
ProductionPoint.PROD_STATUS.INACTIVE = 0;
ProductionPoint.PROD_STATUS.RUNNING = 1;
ProductionPoint.PROD_STATUS.MISSING_INPUTS = 2;
ProductionPoint.PROD_STATUS.NO_OUTPUT_SPACE = 3;

ProductionPoint.PROD_STATUS_TO_L10N = {
    [ProductionPoint.PROD_STATUS.INACTIVE] = "ui_production_status_inactive",
    [ProductionPoint.PROD_STATUS.RUNNING] = "ui_production_status_running",
    [ProductionPoint.PROD_STATUS.MISSING_INPUTS] = "ui_production_status_materialsMissing",
    [ProductionPoint.PROD_STATUS.NO_OUTPUT_SPACE] = "ui_production_status_outOfSpace"
}

local ProductionPoint_mt = Class(ProductionPoint, Object);

--- create new instance
-- @param boolean isServer
-- @param boolean isClient
-- @param string baseDirectory
-- @param table customMt
-- @return ProductionPoint newObject
function ProductionPoint.new(isServer, isClient, baseDirectory, customMt)
    local self = Object.new(isServer, isClient, customMt or ProductionPoint_mt);

    self.baseDirectory = baseDirectory;

    return self;
end