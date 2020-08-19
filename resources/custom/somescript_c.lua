

function msg(test) TriggerEvent("chatMessage", "[Server]", {255, 0, 0}, test) end

RegisterCommand("die", function()
    SetEntityHealth(GetPedAndCoords().pedId, 0)
    print("you died")
end, false)



RegisterCommand("test", function()
    --Account:deposit(1000.00);
    acc = Account:new()
    print(acc.balance)
    acc:deposit(1000)
    print(acc.balance)
    print(acc.name)
    acc.name = "Konto"
    print(acc.name)
   --


end)


RegisterCommand("citem", function() 
    print('########A')
    a = Item:new("Weapon", "Pistol", "weapon_pistol", 200)
    print(a)
    print(a.name)
    print(a.code)
    print(a.itemType)
    print(a.price)
    print("type",type(a))    
    print("",getmetatable(a))
    print('')
    print('########C')
    c = Item:new("Weapon", "Pistol2", "weapon_pistol2", 250)
    print(c)
    print(c.name)
    print(c.code)
    print("type",type(c))    
    print("metadata",getmetatable(c))

    assert(a ~= c, "A should not be the same as C")
    assert(a.name ~= c.name, "name is the same")

    c:setName("apa")
    print(c)
    print(c.name)
    print(c.code)
    print(c.itemType)
    print(c.price)
    print("type",type(c))    
    print("metadata",getmetatable(c))
    print(a.price)
    print(a.price)
    print(a.price)



    local tempList = {a,c}
   local itemApa= findItemByName(tempList, "apa")
    print("Item from findList: ",itemApa.name)




    -- print('')
    -- print('########B')
    -- b = WeaponItem:new("Hand Granade", "weapon_granade", 200)
    -- print(b)
    -- print(b.name)
    -- print(b.code)
    -- print(b.price)
    -- b:setPrice(250)
    -- print(b.price)
    -- print(type(b))   
    -- print('')
    -- print('########D')
    -- d = WeaponItem:new("Hand Granade", "weapon_granade", 200)
    -- print(d)
    -- print(d.name)
    -- print(d.code)
    -- print(d.price)
    -- b:setPrice(300)
    -- print(d.price)
    -- print(type(d))  
    -- --print(y:type())
    -- print('')
    -- print('########B')
    -- --b = WeaponItem:new("Hand Granade", "weapon_granade", 200)
    -- print(b)
    -- print(b.name)
    -- print(b.code)
    -- print(b.price)
    -- b:setPrice(250)
    -- print(b.price)
    -- print(type(b))   
    -- print('')

end)

-- RegisterCommand("witem", function() 
--     local x = Item:new("Pistol", "weapon_pistol")
--     print(x)
--     print(x.name)
--     print(x.code)
    

--     local y = WeaponItem:new("Hand Granade", "weapon_granade", 200)
--     print(y)
--     print(y.name)
--     print(y.code)
--     print(y.price)
--     y:setPrice(250)
--     print(y.price)
--     --print(y:type())
    
--    -- local list = {x, y}



    



--     -- i:setPrice(100)
--     -- print(i:getPrice())
--     -- print(i.price)
-- end)