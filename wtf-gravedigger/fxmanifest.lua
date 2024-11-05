fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'WhiskeyTF'
discord 'https://discord.gg/gAXqgJc8zu'
description 'wtf-gravedigger'
version '1.1.2'

shared_scripts {
    '@rsg-core/shared/locale.lua',
    'config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'

}

dependencies {
    'rsg-core',
    'rsg-target',
}

lua54 'yes'
