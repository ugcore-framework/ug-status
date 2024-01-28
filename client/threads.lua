local UgCore = exports['ug-core']:GetCore()

CreateThread(function()
	while true do
		Wait(Config.UpdateInterval)
		if UgCore.PlayerLoaded then 
            TriggerServerEvent('esx_status:update', UgDev.Functions.GetStatusData(true)) 
        end
	end
end)