Gui = {};
Gui.screenControllers = {}

local Gui_mt = Class(Gui);

---
-- @return Gui self
function Gui.new()
    local self = setmetatable({}, Gui_mt);
    return self;
end
---Load a UI screen view's elements from an XML definition.
-- @param string xmlFilename View definition XML file path, relative to application root.
-- @param string name Screen name
-- @param table controller FrameElement instance which serves as the controller for loaded elements
-- @param boolean|any isFrame [optional, default=false] If true, will interpret the loaded view as a frame to be used in multiple places.
-- @return GuiElement Root GuiElement instance of loaded view or nil if the definition XML file could not be loaded.
function Gui:loadGui(xmlFilename, name, controller, isFrame)
    local gui = GuiElement.new(controller)
    gui.name = name
    gui.xmlFilename = xmlFilename
    return gui
end

---Display a dialog identified by name.
-- @param string guiName
-- @param boolean|any closeAllOthers
-- @return Root GuiElement of dialog or nil if the name did not match any known dialog.
function Gui:showDialog(guiName, closeAllOthers)
    return GuiElement
end

g_gui = Gui.new();