fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'ug-status'
description 'Player Status (hunger & thirsty) for UgCore by UgDev'
author 'UgDev'
version '3.5'
url 'https://github.com/ugcore-framework/ug-status'

shared_script 'config.lua'

client_scripts {
    'client/main.lua',
    'client/functions.lua',
    'client/status.lua',
    'client/events.lua',
    'client/threads.lua',
    'client/status/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/functions.lua',
    'server/status.lua',
    'server/events.lua',
    'server/threads.lua',
    'server/items.lua',
    'server/status/*.lua',
    'server/version.lua'
}

dependencies {
    'ug-core',
    'oxmysql'
}