Player = Object:extend()

function Player:new()
    self.x = 30
    self.y = 102
end

function Player:draw()
    spr(7,self.x-5,106)
    spr(3, self.x, self.y)
end

function Player:shoot_bullet()
    local b = Bullet(self.x)
    add(all_bullets, b)
end