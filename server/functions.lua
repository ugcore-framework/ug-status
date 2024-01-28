local UgCore = exports['ug-core']:GetCore()

UgDev.Functions = { }

function UgDev.Functions.SetPlayerStatus(player, data)
    data = data and json.decode(data) or { }
    player.Functions.SetData('status', data)
    UgCore.Players[player.source] = data
    TriggerClientEvent('ug-status:Load', player.source, data)
end