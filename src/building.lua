Building = Object:extend()

function Building:new(x)
    self.health = 4
    self.x = x
    self.y = 71
    self.top = 70
    self.has_fallen = false
    self.hitbox = Hitbox(self,self.x-8,self.y,15,4)
end

function Building:update()
    for m in all(all_missiles) do
        if is_colliding(self.hitbox, m.hitbox) then
            del(all_missiles, m)
            self:take_damage()
            sfx(3)
        end
    end
end

function Building:draw()
    --todo: add smoke animation with low health
    --todo: lower building based on health
    --sspr(56,0,16,8,self.x-8,self.top)
    --line(self.x-8,self.y,self.x-8,self.y+40,4)
    --line(self.x+7,self.y,self.x+7,self.y+40,4)

    for i=0,4 do
       spr(48,self.x,self.y+(8*i))
       spr(48,self.x-8,self.y+(8*i))
    end

    --rect(self.x-8,self.y,self.x+7,self.y+2,5)
    print(self.health,self.x-2,self.y+4,0)
    self.hitbox:draw()
end

function Building:take_damage()
end

