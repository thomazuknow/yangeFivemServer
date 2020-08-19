
-- Resource Metadata
fx_version 'bodacious'
games {'gta5' }

author 'Jon Doe'
description 'Example resource'
version '1.0.0'

-- What to run
client_scripts {
    'c-weather.lua',
    'c-car.lua',
    'c-location.lua',
    'c-money.lua',
    'c-shop.lua',
    'utils.lua',
    'c-spawn.lua',
    'test.lua',
    'item.lua',
    'c-weapon.lua',
    'c-somescript.lua',
    
    
}

--export Util
--client_script 
 export('getWeaponList')
 export('tableContainsKey')

-- exports(exportList)

-- client_script 'utils.lua'
-- export 'HasStringValue'
