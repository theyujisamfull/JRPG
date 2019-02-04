local Character = new(Object) {
    vida_max   = 100,
    vida_atual = nil,
    sprite     = nil,
    charname   = nil,
    avatar     = nil,
    power      = 100,
    speed      = 50,
    cooldown   = 100,
    energia_max = 100,
    energia_atual = nil,
}

function Character:init()
    assert(self.charname)
    --self.vida_max   = self.vida_max
    self.vida_atual = self.vida_max
    --self.sprite     = self.sprite
    --self.avatar     = self.avatar
    --self.power      = self.power
    --self.speed      = self.speed
    --self.cooldown   = self.cooldown
    self.energia_atual = self.energia_max
end

function Character:updateLife(dL)
    self.vida_atual = self.vida_atual + dL
    self.avatar.lifebar.value = self.vida_atual / self.vida_max
    if self.vida_atual <= 0 then
        self.avatar:destroy()
    end
end

function Character:updateEnergy()
    
end

return Character
