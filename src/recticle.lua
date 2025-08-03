recticle = {
    x = 20,
    y = 20,
    update = function(self)
        if btn(2) then self.y = mid(80, self.y - 1, 0) end
        if btn(3) then self.y = mid(80, self.y + 1, 0) end
        if btn(0) then
            self.x -= 1
            sfx(4)
        end
        if btn(1) then
            self.x += 1
            sfx(4)
        end
    end,
    draw = function(self)
        spr(1, self.x, self.y)
        spr(1, self.x + 8, self.y, true)
        spr(1, self.x, self.y + 8, false, true)
        spr(1, self.x + 8, self.y + 8, true, true)
    end
}
