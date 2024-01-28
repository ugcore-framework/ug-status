local UgCore = exports['ug-core']:GetCore()

RegisterNetEvent('ug-core:OnPlayerLogout', function ()
    UgCore.PlayerLoaded = false
    UgDev.Status = { }
end)

AddEventHandler('ug-status:CreateStatus', function (name, default, color, visible, tickCallback)
    local status = UgDev.Status.Functions.CreateStatus(name, default, color, visible, tickCallback)
    UgDev.Status[#UgDev.Status + 1] = status
end)

AddEventHandler('ug-status:DeleteStatus', function (name)
    for k, v in pairs(UgDev.Status) do
        if v.name == name then
            UgDev.Status[k] = nil
        end
    end
end)


RegisterNetEvent('ug-status:Load', function (status)
    UgCore.PlayerLoaded = true
    TriggerEvent('ug-status:Loaded')
    for i = 1, #UgDev.Status, 1 do
        for j = 1, #status, 1 do
			if UgDev.Status[i].name == status[j].name then
				UgDev.Status[i].Functions.Set(status[j].value)
			end
		end
    end

    CreateThread(function()
		local data = { }
		while UgCore.PlayerLoaded do
			for i=1, #UgDev.Status do
				UgDev.Status[i].Functions.OnTick()
				data[#data + 1] = {
					name = UgDev.Status[i].name,
					value = UgDev.Status[i].value,
					percent = (UgDev.Status[i].value / 1000000) * 100
				}
			end
			TriggerEvent('ug-status:OnTick', data)
			table.wipe(data)
			Wait(Config.TickTime)
		end
	end)
end)

RegisterNetEvent('ug-status:Set', function (name, value)
    for i=1, #UgDev.Status, 1 do
		if UgDev.Status[i].name == name then
			UgDev.Status[i].Functions.Set(value)
			break
		end
	end
end)

RegisterNetEvent('ug-status:Add', function (name, value)
    for i=1, #UgDev.Status, 1 do
		if UgDev.Status[i].name == name then
			UgDev.Status[i].Functions.Add(value)
			break
		end
	end
end)

RegisterNetEvent('ug-status:Remove', function (name, value)
    for i=1, #UgDev.Status, 1 do
		if UgDev.Status[i].name == name then
			UgDev.Status[i].Functions.Remove(value)
			break
		end
	end
end)

AddEventHandler('ug-status:GetStatus', function(name, cb)
	for i=1, #UgDev.Status, 1 do
		if UgDev.Status[i].name == name then
			cb(UgDev.Status[i])
			return
		end
	end
end)