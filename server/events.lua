local UgCore = exports['ug-core']:GetCore()

AddEventHandler('ug-core:PlayerLoaded', function (playerId, player)
	MySQL.scalar('SELECT status FROM users WHERE identifier = ?', { player.identifier }, function (result)
		UgDev.Functions.SetPlayerStatus(player, result)
	end)
end)

AddEventHandler('ug-core:PlayerDropped', function (playerId, reason)
	local player = UgCore.Functions.GetPlayer(playerId)
	local status = UgCore.Players[player.source]

	MySQL.update('UPDATE users SET status = ? WHERE identifier = ?', { json.encode(status), player.identifier })
	UgCore.Players[player.source] = nil
end)

AddEventHandler('ug-status:GetStatus', function (playerId, statusName, cb)
	local status = UgCore.Players[playerId]
	for i = 1, #status do
		if status[i].name == statusName then
			return cb(status[i])
		end
	end
end)

RegisterServerEvent('ug-status:Update', function (status)
	local player = UgCore.Functions.GetPlayer(source)
	if player then
		player.Functions.SetData('status', status)
		UgCore.Players[player.source] = status
	end
end)

AddEventHandler('onResourceStart', function (resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  	return
	end

	for _, player in pairs(UgCore.Players) do
		MySQL.scalar('SELECT status FROM users WHERE identifier = ?', { player.identifier }, function (result)
			UgDev.Functions.SetPlayerStatus(player, result)
		end)
	end
end)