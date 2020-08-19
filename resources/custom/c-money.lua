
-- after the lack of infomartion about the 'PedMoney' natives I feel like most server would probably implement
-- their own soulution for keep track of funds.



RegisterCommand("addMoney", function(source, args)
    addMoney(args)
end, false)

RegisterCommand("removeAllMoney", function()
    SetPedMoney(GetPlayerPed(-1), 0)
end, false)



RegisterCommand("currentMoney", function()
    local amount = GetPedMoney(GetPlayerPed(-1))
    print("Cash: " .. amount)
end, false)


function addMoney(args)
    local currentAmount = GetPedMoney(GetPlayerPed(-1))
    local amount = currentAmount + tonumber(args[1])
    print(amount)
    SetPedMoney(GetPlayerPed(-1), amount)
    print('money given')
end
