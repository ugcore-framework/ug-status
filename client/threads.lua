local UgCore = exports['ug-core']:GetCore()

CreateThread(function()
	while true do
		Wait((1000 * 60) * Config.UpdateInterval)
		if UgCore.PlayerLoaded then 
            TriggerServerEvent('esx_status:update', UgDev.Functions.GetStatusData(true)) 
        end
	end
end)