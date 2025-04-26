Player = Object:extend()

function Player:new()
    self.x = 30
    self.y = 100
end

function Player:draw()
    spr(3, self.x, self.y)
end