


Missile=Object:extend()

local pos={4,6,10,12,14,28,30,32,34,36,54,56,58,60,78,80,82,84,106,108,112,116}

function Missile:new()
    self.anmi_t=0
    self.y=-10
    self.x=rnd(pos)
    --_m.x=10+rnd(120)
    --self.tip={x=0,y=0,w=2,h=1}
    --self.body={x=0,y=0,w=3,h=8}
    self.hitbox = Hitbox(self,self.x,self.y+8,3,4, 2, 11)
    self.launched=false
    add(all_missiles, self)
end

function Missile:draw()
    --todo: add flame animation
    spr(5+self.anmi_t%15\7.5,self.x,self.y)
    spr(4,self.x,self.y+8)
    --pset(self.tip.x,self.tip.y,8)
    --rect(self.body.x,self.body.y,self.body.x+self.body.w,self.body.y+self.body.h,8)
    --self.hitbox:draw()
end

function Missile:update()
    
    self.y+=0.2
    self.anmi_t+=1
    --self.y+=1
    --self.body.x=self.x+2
    --self.body.y=self.y+7
    --self.tip.y=self.y+15
    --self.tip.x=self.x+3
    self.hitbox:update()
end

function spawn_missile()
    Missile()
end
