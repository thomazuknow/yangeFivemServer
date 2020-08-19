local weathers =
    {
        "CLEAR",
        "EXTRASUNNY",
        "CLOUDS",
        "OVERCAST",
        "RAIN",
        "CLEARING",
        "THUNDER",
        "SMOG",
        "FOGGY",
        "XMAS",
        "SNOWLIGHT",
        "BLIZZARD",
    }

    

RegisterCommand("getWeather", function()
  getCurrentWeather();
end, false)

RegisterCommand("setWeather", function(source, args)
   setCurrentWeather(args)
  end, false)


function setCurrentWeather(args)
    local weather = tostring(args[1]);
    local validWeather = tableContainsValue(weathers, weather);
    if  validWeather then
        SetOverrideWeather(weather);
    else
        TriggerEvent('chat:addMessage', {
            args = { '['..weather..'] Is not a valid weather' }
        });
    end
end

function getCurrentWeather()
    local weather = GetHashKey(GetPrevWeatherTypeHashName());
    TriggerEvent("chatMessage", "[ServerDebug]", {255,0,0}, weather)
end


