
-- need to add type check for string because of string:lower()
function tableContainsKey(table, val)
    local value = tostring(val):lower();
    for k in pairs(table) do
        local key = tostring(k):lower();
        if key == value then return true end
    end
    print( val,' was not found in table')
    return false
end

function isNumber(value) return type(value) == "number" end

function tryParseNumber(value)
    if isNumber(value) then return true, value end
    local n = tonumber(value)
    if n ~= nil then
        return true, n
    else
        print('unable to parse to number: ', value)
        return false, nil
    end

end

function tryParseVector3(args)
    local xValid,x = tryParseNumber(args[1])
    local yValid,y = tryParseNumber(args[2])
    local zValid,z = tryParseNumber(args[3])
    if not xValid or not yValid or not zValid then
        print('tryParseVector3 unvalid argument')
        return false, nil
    end
    return true, vector3(x,y,z)
end


-- used for debugging prints, the global variable is located in the manifest.
-- there is probably somekind of built debug command i dont know.
function printDebug(msg)
    if not type(Debug) == boolean then return end
    if Debug then print(msg) end
end

