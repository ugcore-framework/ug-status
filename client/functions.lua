UgDev.Functions = { }

function UgDev.Functions.GetStatusData(minimal)
    local status = { }

    for i = 1, #UgDev.Status, 1 do
        if minimal then
            status[#status + 1] = {
                name    = UgDev.Status[i].name,
				val     = UgDev.Status[i].value,
				percent = (UgDev.Status[i].value / Config.MaxStatus) * 100
            } 
        else
            status[#status + 1] = {
				name    = UgDev.Status[i].name,
				val     = UgDev.Status[i].value,
				color   = UgDev.Status[i].color,
				visible = UgDev.Status[i].visible(UgDev.Status[i]),
				percent = (UgDev.Status[i].value / Config.MaxStatus) * 100
			}
        end
    end
    return status
end