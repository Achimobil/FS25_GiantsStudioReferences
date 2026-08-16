---@class Gui
Gui = {};
Gui.screenControllers = {}

local Gui_mt = Class(Gui);

---Creates a new instance
---@return Gui self
function Gui.new()
    local self = setmetatable({}, Gui_mt);
    return self;
end
---Load a UI screen view's elements from an XML definition.
---@param xmlFilename string View definition XML file path, relative to application root.
---@param name string Screen name
---@param controller table FrameElement instance which serves as the controller for loaded elements
---@param isFrame? boolean If true, will interpret the loaded view as a frame to be used in multiple places (default false)
---@return table|nil Root GuiElement instance of loaded view, or nil if the definition XML file could not be loaded.
function Gui:loadGui(xmlFilename, name, controller, isFrame)
    local gui = GuiElement.new(controller)
    gui.name = name
    gui.xmlFilename = xmlFilename
    return gui
end

---Display a dialog identified by name.
---@param guiName string
---@param closeAllOthers? boolean
---@return table|nil Root GuiElement of dialog, or nil if the name did not match any known dialog.
function Gui:showDialog(guiName, closeAllOthers)
    return GuiElement
end

g_gui = Gui.new();