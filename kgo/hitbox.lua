Hitbox = Object:extend()

function Hitbox:new(owner, x, y, w, h, ox, oy)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.__ox = ox or 0
    self.__oy = oy or 0
    self.__owner = owner
end

function Hitbox:update()
    if self.__owner then
        self.x = self.__owner.x + self.__ox
        self.y = self.__owner.y + self.__oy
    end
end

function Hitbox:draw()
    rect(self.x, self.y, self.x + self.w, self.y + self.h, 8)
end