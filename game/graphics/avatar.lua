
local Avatar = new 'graphics.composite' {
    charactername = 'slime',
    side          = 'right',
    counter       = 0
}

local COLORS = {
    right = { .6, .6, .9 },
    left  = { .9, .6, .6 }
}

local BARS = {
    right = 'graphics.leftbar',
    left  = 'graphics.rightbar'
}

function Avatar:init()
    self.character = require('database.characters.' .. self.charactername)
    self.sprite = new 'graphics.sprite' {
        filename = self.character.sprite,
        color    = COLORS[self.side],
        position = new(Vec) {}
    }
    self.lifebar = new(BARS[self.side]) {
        color = { .2, .8, .2 }, value = 1
    }
    if self.side == 'left' then
        self.energybar = new(BARS['right']) {
            color = { .2, .2, .8 }, value = 1
        }
    else
        self.energybar = new(BARS['left']) {
            color = { .2, .2, .8 }, value = 1
        }
    end
    self.cursor = new 'graphics.polygon' {
        position = new(Vec) { 0, -64 },
        vertices = { -16, 0, 16, 0, 0, 20 },
        visible  = false
    }
    --[[self.cooldown = new 'graphics.polygon' {
        position = new(Vec) { 0, 32 },
        vertices = { -8, -8, -8, 8, 8, 8, 8, -8 },
        color = { .8, .2, .2 }
    }
    self.add(self.cooldown)]]
    self:add(new 'graphics.shadow' { position = new(Vec) { 0, 48 } })
    self:add(self.sprite)
    self:add(self.energybar)
    self:add(self.lifebar)
    self:add(self.cursor)
    self.counter = love.math.random() * 2 * math.pi
end

function Avatar:showCursor()
    self.cursor.visible = true
end

function Avatar:hideCursor()
    self.cursor.visible = false
end

function Avatar:update(dt)
     self.counter = self.counter + 5 * dt
     self.sprite.position.y = 4 * math.sin(self.counter)
end

return Avatar
