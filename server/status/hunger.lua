AddEventHandler('txAdmin:events:healedPlayer', function (eventData)
	if GetInvokingResource() ~= 'monitor' or type(eventData) ~= 'table' or type(eventData.id) ~= 'number' then
		return
	end
	TriggerClientEvent('ug-status:HealPlayer', eventData.id, 'hunger')
end)