local UgCore = exports['ug-core']:GetCore()

UgDev.Functions = { }

function UgDev.Functions.GetStatusData(minimal)
    local status = { }

    for _, v in pairs(UgDev.Status) do
        if minimal then
            status[#status + 1] = {
                name    = v.name,
				value   = v.value,
				percent = (v.value / Config.MaxStatus) * 100
            } 
        else
            status[#status + 1] = {
				name    = v.name,
				value   = v.value,
				color   = v.color,
				visible = v.visible(v),
				percent = (v.value / Config.MaxStatus) * 100
			}
        end
    end
    return status
end

function UgDev.Functions.UseItem(itemData)
    if itemData.type == 'food' then
        local progressBarSettings = {
            Movement = {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            },
            Animation = {
                animDict = itemData.anim.Dict,
                anim = itemData.anim.Name,
                flags = itemData.anim.Flags
            },
            Prop = {
                model = itemData.prop.Model,
                bone = itemData.prop.Bone,
                coords = itemData.prop.Coords,
                rotation = itemData.prop.Rotation
            }
        }
        
        UgCore.Functions.CreateProgressBar('itemEating', 'Eating...', itemData.timer, false, true, progressBarSettings.Movement, progressBarSettings.Animation, progressBarSettings.Prop, { }, function ()
            UgCore.Functions.Notify('Eating', 'The food was very tasty!', 'success', 5000)
            exports['ug-status']:Add('hunger', itemData.statusRefill)
        end, function ()
            UgCore.Functions.Notify('Eating', 'You started feeling sick and stopped eating...', 'error', 5000)
        end)
    elseif itemData.type == 'drink' then
        local progressBarSettings = {
            Movement = {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            },
            Animation = {
                animDict = itemData.anim.Dict,
                anim = itemData.anim.Name,
                flags = itemData.anim.Flags
            },
            Prop = {
                model = itemData.prop.Model,
                bone = itemData.prop.Bone,
                coords = itemData.prop.Coords,
                rotation = itemData.prop.Rotation
            }
        }
        
        UgCore.Functions.CreateProgressBar('itemDrinking', 'Drinking...', itemData.timer, false, true, progressBarSettings.Movement, progressBarSettings.Animation, progressBarSettings.Prop, { }, function ()
            UgCore.Functions.Notify('Drinking', 'Your throat is no longer dry!', 'success', 5000)
            exports['ug-status']:Add('thirst', itemData.statusRefill)
        end, function ()
            UgCore.Functions.Notify('Drinking', 'You don\'t want to drink more...', 'error', 5000)
        end)
    end
end