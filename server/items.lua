local UgCore = exports['ug-core']:GetCore()

for _, food in pairs(Config.Items.Foods) do
    UgCore.Functions.CreateItem(food.Item, function (source)
        local player = UgCore.Functions.GetPlayer(source)
        local itemData = {
            type = 'food',
            name = food.Name,
            prop = food.Prop,
            timer = food.Timer * 1000,
            statusRefill = food.StatusRefill,
            anim = food.Anim
        }
        player.Functions.RemoveItem(food.Item, 1)
        player.Functions.TriggerEvent('ug-status:UseItem', itemData)
    end)
end

for _, drink in pairs(Config.Items.Drinks) do
    UgCore.Functions.CreateItem(drink.Item, function (source)
        local player = UgCore.Functions.GetPlayer(source)
        local itemData = {
            type = 'drink',
            name = drink.Name,
            timer = drink.Timer * 1000,
            statusRefill = drink.StatusRefill,
            prop = drink.Prop,
            anim = drink.Anim
        }
        player.Functions.RemoveItem(drink.Item, 1)
        player.Functions.TriggerEvent('ug-status:UseItem', itemData)
    end)
end