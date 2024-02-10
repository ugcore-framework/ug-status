local isDead = false

RegisterNetEvent('ug-core:OnPlayerDeath', function ()
    isDead = true
end)

RegisterNetEvent('ug-core:OnPlayerSpawn', function ()
    if isDead then
        exports['ug-status']:HealPlayer('hunger')
    end
    isDead = false
end)

RegisterNetEvent('ug-status:Hunger:HealPlayer', function ()
    local playerPed = PlayerPedId()
    exports['ug-status']:Set('hunger', 500000)
    SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

RegisterNetEvent('ug-status:Loaded', function (status)
    exports['ug-status']:CreateStatus('hunger', 1000000, '#CFAD0F', function (status)
        return true
    end, function (status)
        status.Functions.Remove(75)
    end)
end)

RegisterNetEvent('ug-status:OnTick', function (data)
    local playerPed = PlayerPedId()
    local health = GetEntityHealth(playerPed)
    
    for _, v in pairs(data) do
        if v.name == 'hunger' and v.percent == 0 then
            if health <= 150 then
                health = health - 5
            else
				health = health - 1
			end
        end
    end

    if health ~= GetEntityHealth(playerPed) then 
        SetEntityHealth(playerPed, health)
    end
end)