local Character = new(Object) {
    vida_max   = 100,
    vida_atual = nil,
    sprite     = nil,
    charname   = nil,
    avatar     = nil,
    power      = 100,
    speed      = 50,
    cooldown   = 100,
}

function Character:init()
    charname   = self.charname
    vida_max   = self.vida_max
    vida_atual = self.vida_atual or self.vida_max
    sprite     = self.sprite
    avatar     = self.avatar
    power      = self.power
    speed      = self.speed
    cooldown   = self.cooldown
end

function Character:updateLife(dL)
    self.vida_atual = self.vida_atual + dL
    self.avatar.lifebar.value = self.vida_atual / self.vida_max
    --self.avatar:destroy()
    --print('tirou '.. dano)
end

return Character
