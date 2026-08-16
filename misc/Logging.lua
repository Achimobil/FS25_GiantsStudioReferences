Logging = {};

---Prints an info message to console and logfile, prepends 'Info:'
---@param infoMessage string the info message. Can contain string-format placeholders
---@param ... any variable number of parameters. Depends on placeholders in infoMessage
function Logging.info(infoMessage, ...)
    print(string.format("  Info: "..infoMessage, ...))
end

---Prints the info to the log file when developer warnings are active
---@param infoMessage string the text to print formatted
---@param ... any format parameters
function Logging.devInfo(infoMessage, ...)
end

---Prints an error to console and logfile, prepends 'Error:'
---@param errorMessage string the error message. Can contain string-format placeholders
---@param ... any variable number of parameters. Depends on placeholders in warning message
function Logging.error(errorMessage, ...)
    printError(string.format("  Error: "..errorMessage, ...))
end