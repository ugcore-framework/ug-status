local UgCore = exports['ug-core']:GetCore()

CreateThread(function ()
    while true do
		Wait(10 * 60 * 1000)
		local parameters = { }
		for _, player in pairs(UgCore.Functions.GetUgPlayers()) do
			local status = UgCore.Players[player.source]
			if status and next(status) then
				parameters[#parameters + 1] = {
                    json.encode(status), 
                    player.identifier
                }
			end
		end
		if #parameters > 0 then
			MySQL.prepare('UPDATE users SET status = ? WHERE identifier = ?', parameters)
		end
	end
end)