clock = {}
clock.__index = clock

function clock.new()
    local _c = setmetatable({}, clock)
    _c.seconds = 0
    _c.t = 0
    _c.is_running = false
    return _c
end

function clock:tick()
 	self.seconds += 1
   self.t = 0
end

function clock:update()
	if self.is_running then
   	self.t += 1
      if self.t >= 60 then
      	self:tick()
      end
   end
end

function clock:stop()
	self.is_running = false
end

function clock:start()
	self.is_running = true
end

function clock:restart()
	self.is_running = false
   self.t = 0
   self.seconds = 0
end