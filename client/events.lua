local UgCore = exports['ug-core']:GetCore()

RegisterNetEvent('ug-core:OnPlayerLogout', function ()
	UgCore.PlayerLoaded = false
	UgDev.Status = { }
end)

RegisterNetEvent('ug-status:UseItem', function (itemData)
	UgDev.Functions.UseItem(itemData)
end)

local function HealPlayer(status)
    for _, v in pairs(UgDev.Status) do
        if v.name == status then
			exports['ug-status']:Set(status, 1000000)
        end
    end
end
exports('HealPlayer', HealPlayer)

local function Add(name, value)
    for _, v in pairs(UgDev.Status) do
		if v.name == name then
			v.Functions.Add(value)
			break
		end
	end
end
exports('Add', Add)

local function Remove(name, value)
    for _, v in pairs(UgDev.Status) do
		if v.name == name then
			v.Functions.Remove(value)
			break
		end
	end
end
exports('Remove', Remove)

local function Set(name, value)
    for _, v in pairs(UgDev.Status) do
		if v.name == name then
			v.Functions.Set(value)
			break
		end
	end
end
exports('Set', Set)

local function GetStatus(name, cb)
	for _, v in pairs(UgDev.Status) do
		if v.name == name then
			cb(v)
			return
		end
	end
end
exports('GetStatus', GetStatus)

local function CreateStatus(name, default, color, visible, tickCallback)
    local status = UgDev.Status.Functions.CreateStatus(name, default, color, visible, tickCallback)
    UgDev.Status[#UgDev.Status + 1] = status
end
exports('CreateStatus', CreateStatus)

local function DeleteStatus(name)
    for k, v in pairs(UgDev.Status) do
        if v.name == name then
            UgDev.Status[k] = nil
        end
    end
end
exports('DeleteStatus', DeleteStatus)

local function Load(status)
    UgCore.PlayerLoaded = true
    TriggerEvent('ug-status:Loaded')
    for _, v in pairs(UgDev.Status) do
        for _, v2 in pairs(status) do
			if v.name == v2.name then
				v.Functions.Set(v2.value)
			end
		end
    end

    CreateThread(function()
		local data = { }
		while UgCore.PlayerLoaded do
			for _, v in pairs(UgDev.Status) do
				v.Functions.OnTick()
				data[#data + 1] = {
					name = v.name,
					value = v.value,
					percent = (v.value / 1000000) * 100
				}
			end
			TriggerEvent('ug-status:OnTick', data)
			table.wipe(data)
			Wait(Config.TickTime * 1000)
		end
	end)
end
exports('Load', Load)

RegisterNetEvent('ug-status:HealPlayer', HealPlayer)
RegisterNetEvent('ug-status:CreateStatus', CreateStatus)
RegisterNetEvent('ug-status:DeleteStatus', DeleteStatus)
RegisterNetEvent('ug-status:Load', Load)
RegisterNetEvent('ug-status:Set', Set)
RegisterNetEvent('ug-status:Add', Add)
RegisterNetEvent('ug-status:Remove', Remove)
RegisterNetEvent('ug-status:GetStatus', GetStatus)