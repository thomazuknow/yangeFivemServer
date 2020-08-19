Item = {}
Item.__index = Item

function Item:new(itemType, name, code, price)
    local itm = {}
    setmetatable(itm, Item)
    itm.name = name
    itm.itemType = itemType
    itm.code = code
    itm.price = price
    itm.internalType = "Item"
    return itm
 end

function Item:setName(name)
  self.name = name
end

function Item:getName()
  return self.name
end

function Item:setPrice(price)
    if not isNumber(price) then
        print("Error setPrice() value not a number, value: ["..price.."]")
    else
        self.price = tonumber(price)
    end
end



-- return first occurence of
function findItemByName(list, name)
    if next(list) == nil then
        return nil
    end
    for k,v in pairs(list) do
        --v.internalType ~= nil and v.internalType == "Item" and 
        if  v.name ~= nil then
            if v.name:lower() == name:lower() then
                return v
            end
        end
    end 
    return nil;
end






--------------------------WeaponItem

-- WeaponItem = {}
-- WeaponItem.__index = WeaponItem

-- -- setmetatable(WeaponItem, {
-- --     __index = Item, -- this is what makes the inheritance work
-- --     __call = function (cls, ...)
-- --     local self = setmetatable({}, cls)
-- --     self:new(...)
-- --     return self
-- --   end,
-- -- })

-- function WeaponItem:new(name, code, price)
--     --Item.new(self, name, code) -- call the base class constructor
--     local weaponItm = {}
--     setmetatable(weaponItm, WeaponItem)
--     weaponItm.price = price
--     return WeaponItem
-- end

-- function WeaponItem:setPrice(price)
--     self.price = price
--   end

-- function WeaponItem:getPrice()
--     return self.price
-- end

-- -- I don't know if this is even valid but it works for now
-- local original_type = type
-- type = function (obj)
--     local otype = original_type( obj )
--      if  otype == "table" and obj == Item then
--         return "Item"
--     end
--     if  otype == "table" and obj == WeaponItem then
--         print('asd', Item)
--         return "WeaponItem"
--     end
--     return otype
-- end 


-- return first occurence of name
-- function findItemByName(list, name)
--     print(list[1].name)
--     print(list[2].name)
--     print(list[3].name)
--     print(list[4].name)
--     for k,v in pairs(list) do
--         if v[name] then
--             if v.name == name then
--                 return v
--             end
--         end
--     end
-- end



-- function WeaponItem:get_value()
--   return self.value + self.value2
-- end

-- local i = WeaponItem(1, 2)
-- print(i:get_value()) --> 3
-- i:set_value(3)
-- print(i:get_value()) --> 5


-- RegisterCommand("witem", function() 
--     local x = Item:new("Pistol", "weapon_pistol")
--     print(x)
--     print(x.name)
--     print(x.code)
--     print(type(x))    
--     print(getmetatable(x))

--     local y = WeaponItem:new("Hand Granade", "weapon_granade", 200)
--     print(y)
--     print(y.name)
--     print(y.code)
--     print(y.price)
--     y:setPrice(250)
--     print(y.price)
--     print(type(y))   
--     --print(y:type())
-- end)