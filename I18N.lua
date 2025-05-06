I18N = {};

--- Translate the text, option in mod context
-- @param string text the text to print formated
-- @param any modEnvironment format parameter
-- @return string translatedText
function I18N:getText(text, modEnvironment)
    return "";
end

-- @return string formatedtext
function I18N:formatNumber(value, decimalPlaces, someBool)
    return "";
end

-- @return string formatedtext
function I18N:formatVolume(volume, decimalPlaces, unit)
    return "";
end

-- @return string formatedtext
function I18N:formatMass(mass, maxMass, unit)
    return "";
end

---
-- @param float power format parameter
-- @return string formatedtext
function I18N:getPower(power)
    return "";
end

function I18N:getSpeedMeasuringUnit()
    return "";
end

-- @return string formatedtext
function I18N:getSpeed(speed)
    return "";
end

-- @return string formatedtext
function I18N:formatNumMonth(month)
    return "";
end

g_i18n = I18N;