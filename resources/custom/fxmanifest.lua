
-- Resource Metadata
fx_version 'bodacious'
games {'gta5' }

author 'Jon Doe'
description 'Example resource'
version '1.0.0'

-- What to run
client_scripts {
    'weather_c.lua',
    'car_c.lua',
    'c-location.lua',
    'c-money.lua',
    'c-shop.lua',
    'utils.lua',
    'spawn_c.lua',
    'test.lua',
    'item.lua',
    'c-weapon.lua',
    'somescript_c.lua',
    
    
}

--export Util
--client_script 
 export('getWeaponList')
 export('tableContainsKey')

-- exports(exportList)

-- client_script 'utils.lua'
-- export 'HasStringValue'
