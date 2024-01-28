fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'ug-status'
description 'Player Status (hunger, thirsty, stress) for UgCore by UgDev'
author 'UgDev'
version '3.5'
url 'https://github.com/UgDevOfc/ug-status'

shared_scripts {
    '@ug-core/languages.lua',
    'languages/*.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/functions.lua',
    'client/status.lua',
    'client/events.lua',
    'client/threads.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/functions.lua',
    'server/status.lua',
    'server/events.lua',
    'server/threads.lua'
}

dependencies {
    'ug-core',
    'oxmysql'
}