UgDev.Status.Functions = { }

function UgDev.Status.Functions.CreateStatus(name, default, color, visible, tickCallback)
    local self          = { }
    self.Functions      = { }

    self.value          = default
    self.name           = name
	self.default        = default
	self.color          = color
	self.visible        = visible
	self.tickCallback   = tickCallback

    function self.Functions._Set(key, value)
        self[key] = value
    end

    function self.Functions._Get(key)
        return self[key]
    end

    function self.Functions.OnTick()
		self.tickCallback(self)
	end

	function self.Functions.Set(value)
		self.value = value
	end

	function self.Functions.Add(value)
		if self.value + value > Config.StatusMax then
			self.value = Config.StatusMax
		else
			self.value = self.value + value
		end
	end

	function self.Functions.Remove(value)
		if self.value - value < 0 then
			self.value = 0
		else
			self.value = self.value - value
		end
	end

	function self.Functions.GetPercent()
		return (self.value / Config.StatusMax) * 100
	end
	return self
end