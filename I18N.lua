I18N = {};

---Translates the text, optionally in mod context
---@param text string the text to print formatted
---@param modEnvironment? any format parameter
---@return string translatedText
function I18N:getText(text, modEnvironment)
    return "";
end

---@param value number the number to format
---@param decimalPlaces? integer number of decimal places (defaults to 0)
---@param someBool? boolean force showing the decimal part even if zero
---@return string formatedtext
function I18N:formatNumber(value, decimalPlaces, someBool)
    return "";
end

---@param volume number volume in liters
---@param decimalPlaces? integer number of decimal places
---@param unit? string unit suffix to display (defaults to the current volume unit)
---@return string formatedtext
function I18N:formatVolume(volume, decimalPlaces, unit)
    return "";
end

---@param mass number mass to format
---@param maxMass? number maximum mass, used to decide the display unit for small values
---@param unit? boolean whether small masses should be shown in kg
---@return string formatedtext
function I18N:formatMass(mass, maxMass, unit)
    return "";
end

---@param power number format parameter
---@return string formatedtext
function I18N:getPower(power)
    return "";
end

---Gets the localized speed measuring unit text
---@return string unit
function I18N:getSpeedMeasuringUnit()
    return "";
end

---@param speed number speed in km/h
---@return string formatedtext
function I18N:getSpeed(speed)
    return "";
end

---@param month integer number of months
---@return string formatedtext
function I18N:formatNumMonth(month)
    return "";
end

---Formats a duration given in minutes as a localized hours/minutes string
---@param minutes? integer duration in minutes
---@return string formatedtext
function I18N:formatMinutes(minutes)
    return "";
end

---Formats a money amount for display
---@param number number amount to format
---@param precision? integer number of decimal places
---@param addCurrency? boolean whether to append the currency symbol (defaults to true)
---@param prefixCurrencySymbol? boolean whether to prefix instead of suffix the currency symbol
---@return string formatedtext
function I18N:formatMoney(number, precision, addCurrency, prefixCurrencySymbol)
    return "";
end

g_i18n = I18N;