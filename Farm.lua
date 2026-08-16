---@class Farm
Farm = {};

local Farm_mt = Class(Farm, Object);

Farm.farmId = 0;
Farm.name = "";

Farm.PERMISSION = {
    ["BUY_VEHICLE"] = "buyVehicle",
    ["SELL_VEHICLE"] = "sellVehicle",
    ["BUY_PLACEABLE"] = "buyPlaceable",
    ["SELL_PLACEABLE"] = "sellPlaceable",
    ["MANAGE_CONTRACTS"] = "manageContracts",
    ["TRADE_ANIMALS"] = "tradeAnimals",
    ["CREATE_FIELDS"] = "createFields",
    ["LANDSCAPING"] = "landscaping",
    ["HIRE_ASSISTANT"] = "hireAssistant",
    ["RESET_VEHICLE"] = "resetVehicle",
    ["MANAGE_PRODUCTIONS"] = "manageProductions",
    ["CUT_TREES"] = "cutTrees",
    ["MANAGE_RIGHTS"] = "manageRights",
    ["TRANSFER_MONEY"] = "transferMoney",
    ["UPDATE_FARM"] = "updateFarm",
    ["MANAGE_CONTRACTING"] = "manageContracting"
}

---Creates a new instance
---@param isServer boolean is server
---@param isClient boolean is client
---@param spectator? boolean is spectator farm
---@param customMt? table custom metatable for the subclass instance
---@return Farm
function Farm.new(isServer, isClient, spectator, customMt)
    local self = Object.new(isServer, isClient, customMt or Farm_mt);
    return self;
end