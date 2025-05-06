Logging = {};

---Prints an info to console and logfile, prepends 'Info:'
-- @param string infoMessage the warning message. Can contain string-format placeholders
-- @param any ... variable number of parameters. Depends on placeholders in warning message
function Logging.info(infoMessage, ...)
    print(string.format("  Info: "..infoMessage, ...))
end

---Print the info to the log file when developer warnings are active
-- @param string infoMessage the text to print formated
-- @param any ... format parameter
function Logging.devInfo(infoMessage, ...)
end

---Prints an error to console and logfile, prepends 'Error:'
-- @param string errorMessage the warning message. Can contain string-format placeholders
-- @param any ... variable number of parameters. Depends on placeholders in warning message
function Logging.error(errorMessage, ...)
    printError(string.format("  Error: "..errorMessage, ...))
end