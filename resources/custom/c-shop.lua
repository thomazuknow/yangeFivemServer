-- chat based shop, open for a limited time by pressing the X key
-- don't know if this appraoch of using citizen.Wait is a good idea, does it stop all other threads for the player or just this thread?
Citizen.CreateThread(function()
    local xKey = 73
    local shopOpen = false
    local number1Key = 157
    local number2Key = 158
    local shop = getShop(); --this shop items

    while true do
        Citizen.Wait(1)     
        if not shopOpen and IsControlJustReleased(1, xKey) then -- if shop no open and we press X
            shopOpen = true; -- yay open
            printItemListToChat(shop)
            TriggerEvent('chat:addMessage', {args = {'Press one of the numbers within 5 seconds to but weapon'}})
            local cycles = 0;
            while shopOpen do  -- Would like to extract shop with out sending it the thread and be able to keep time
                if IsControlPressed(1, number1Key) then -- first item
                    print("pressed first button")
                    --calculate cost, buy if we have money
                    local item1 = shop[1];
                    if buyItemIfPedHasFunds(item1) then -- if player have the funds we buy iy
                        giveWeapon(item1.code)
                        TriggerEvent('chat:addMessage', {args = {'woohoo you got weapon 1'}})
                        -- create some delay after pruchase 
                        -- Citizen.Wait(1000)
                        -- cycles = cycles + 20
                        cycles = delay(cycles)
                    else
                        TriggerEvent('chat:addMessage', {args = {'Not enugh money'}})
                        cycles = delay(cycles)
                    end
                 
                end
                if IsControlPressed(1, number2Key) then -- second item
                    print("pressed second button")

                    local item2 = shop[2];
                    if buyItemIfPedHasFunds(item2) then -- if player have the funds we buy iy
                        giveWeapon(item2.code)
                        TriggerEvent('chat:addMessage', {args = {'woohoo you got weapon 2'}})
                        -- create some delay after pruchase 
                        -- Citizen.Wait(1000)
                        -- cycles = cycles + 20
                        cycles = delay(cycles)
                    else
                        TriggerEvent('chat:addMessage', {args = {'Not enugh money'}})
                        cycles = delay(cycles)
                    end
                end
                Citizen.Wait(50)
                if cycles >= 100 then -- keep shop "open" for 5 seconds
                    shopOpen = false
                    TriggerEvent('chat:addMessage', {args = {'Shop is closed'}})
                end
                cycles = cycles +1
            end
        end
    end
end)

function getShop()
    return createWeaponItemShop()
end

function createWeaponItemShop()
    local pistol = getWeaponByName("Pistol")
    pistol:setPrice(500)
    local pwd = getWeaponByName("CombatPWD")
    pwd:setPrice(750)
    local shop = {}
    shop[1] = pistol
    shop[2] = pwd
    return shop
end


function delay(cycles)
    -- create some delay after pruchase
    Citizen.Wait(1000)
    return cycles + 20
end

-- no transacion scopes gives is not much more to play with
function buyItemIfPedHasFunds(item)
    local sucessful = false
    local amount = GetPedMoney(GetPlayerPed(-1))
    if amount >= item.price then
        addMoney({-item.price})
        sucessful = true;
    end
    return sucessful
end


function getItemByIndexNumber(index)
    if not isNumber(index) then
        print("["..index.."] not a number")
    end
    --Here would like to have a variable with the shop instead of 
end


function printItemListToChat(itemList)
    TriggerEvent(
        'chat:addMessage',
        {
            args = {'####WELCOME TO SHOP####'}
        })
    local index = 1   
    for k,v in pairs(itemList) do
        TriggerEvent(
            'chat:addMessage',
            {

                args = {k..'.'..v.name}
            })
            index = index +1
    end
    TriggerEvent(
        'chat:addMessage',
        {
            args = {'####END OF SHOP####'}
        })
end
