local Character = new(Object) {
    vida_max   = nil,
    vida_atual = nil,
    sprite     = nil,
    charname   = nil,
    avatar     = nil,
    power      = nil,
    speed      = nil,
    energy_max = nil,
    energy_now = nil
}

function Character:init()
    vida_max   = self.vida_max   or 100
    vida_atual = self.vida_atual or self.vida_max
    sprite     = self.sprite
    avatar     = self.avatar
    power      = self.power or 20
    speed      = self.speed or 20
    energy
end

function Character:updateLife(dano)
    self.vida_atual = self.vida_atual - dano
    self.avatar.lifebar.value = self.vida_atual / self.vida_max
    print('tirou '.. dano)
end

return Character
