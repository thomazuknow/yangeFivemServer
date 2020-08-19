local weaponNames = {'PWD', 'Pistol', 'FlareGun', 'Railgun'}
local weaponCodes = {}




RegisterCommand("clearWeaponsOnPed", function()
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    TriggerEvent('chat:addMessage', {args = {'Weapons remved'}})
end)

Citizen.CreateThread(function()
    local hKey = 74
    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1, hKey) then
            giveWeapon(getWeaponByName("Railgun").code)
            TriggerEvent('chat:addMessage', {args = {'Weapons given to you'}})
        end
    end

end)

RegisterCommand("rmv", function()
    RemoveAllPedWeapons(GetPlayerPed(-1))
end)

RegisterCommand("weaps", function()
    local w = getWeapons();
    TriggerEvent('chat:addMessage', {args = {w[1].name}})
    TriggerEvent('chat:addMessage', {args = {w[1].price}})
    TriggerEvent('chat:addMessage', {args = {w[1].code}})
end)

RegisterCommand("w", function(source, args)
    print("w argument",args[1])
    local asd = tostring(args[1])
    print("ASD", asd)
    local wa = getWeaponByName(asd)
    TriggerEvent('chat:addMessage', {args = {wa.name}})
    TriggerEvent('chat:addMessage', {args = {wa.price}})
    TriggerEvent('chat:addMessage', {args = {wa.code}})
end)

-- I would like to store these instances of weapons instead of recreating them in a variable,
--but dont know how except a global variable and stll loding them.
function getWeapons()
    if weaponItems == nil then 
        local a = Item:new("Weapon", "CombatPWD", "weapon_CombatPDW", 500)
        local b = Item:new("Weapon", "Pistol", "weapon_Pistol", 250)
        local c = Item:new("Weapon", "FlareGun", "weapon_FlareGun", 350)
        local d = Item:new("Weapon", "Railgun", "weapon_Railgun", 1200)
        return {a,b,c,d}
    end
end

function getWeaponByName(name)
   -- loadWeap()
    local w = getWeapons();
    print(w)
    return findItemByName(w, name);
end


function getWeaponNames()
    return weaponNames;
end


function giveWeapon(wHash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(wHash), 9999, false, false)
end
