local Locations = {}
Locations["police"] = vector3(440.1, -982.6, 30.6)
Locations["hospital"] = vector3(294.4, -580.2, 43.1)
Locations["motel"] = vector3(321.9, -211.5, 54.0)

RegisterCommand("tp", function(source, args)
    teleportByVectorOrLoactionName(args)
end, false)

RegisterCommand("getCoords", function()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    print("Current coordinates:" .. pos)
end, false)

function teleportPlayer(vector)
    SetEntityCoords(GetPlayerPed(-1), vector.x, vector.y, vector.z)
end


function teleportByVectorOrLoactionName(args)
    local requestedLocation
    if tableContainsKey(Locations, args[1]) then
         requestedLocation = Locations[args[1]];
    else -- try to parse args as vector3
        local valid, vector3 = tryParseVector3(args)
        if valid then
            requestedLocation = vector3
        else
            print('unvalid args: [', arg, ']')
            return;
        end
    end
    teleportPlayer(requestedLocation)
    print("you teleported to", requestedLocation)
end


RegisterCommand("locations", function(soruce, args)
    printLocations()
end, false)

function printLocations()
    local str = 'Predetermined locations: '
    for k in pairs(Locations) do
        str = str..k..', '
    end
    print(str:sub(1, #str-2))
end


