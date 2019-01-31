
local Battle = new 'state.base' {
    graphics = nil,
    current_party = 'right',
    current_char = 1,
    next_action = nil,
    delay = 0
}

function Battle:onEnter(graphics)
    self.graphics = graphics
    graphics:add('bg', new 'graphics.arena' {})
    self:loadParty('right', 'heroes')
    self:loadParty('left', 'slimes01')
end

function Battle:loadParty(side, name)
    local W, H = love.graphics.getDimensions()
    local charnames = require('database.parties.' .. name)
    local party = {
        characters = {}
    }
    for i, charname in ipairs(charnames) do
        local x
        if side == 'right' then x = W - 480 + 80 * i
        elseif side == 'left' then x = 480 - 80 * i end
        local char = require('database.characters.' .. charname)
        --char.side = side
        --[[char.avatar = new 'graphics.avatar' {
            charactername = char.charname,
            side = side,
            position = new(Vec) { x, i * 120 },
            drawables = {},
        }]]
        party.characters[i] = new 'database.character' {
                vida_max = char.vida_max,
                vida_atual = char.vida_max,
                sprite = char.sprite,
                charname = char.charname,
                power = char.power,
                avatar = new 'graphics.avatar' {
                        charactername = char.charname,
                        side = side,
                        position = new(Vec) { x, i * 120 },
                        drawables = {},
                }
        }

        party.characters[i].avatar.side = side
        self.graphics:add('entities', party.characters[i].avatar)
    end
    self[side] = party
end

function Battle:onResume()
    if self.next_action then
        self.stack:push('execute_action', self, self.next_action)
        self.next_action = nil
    else
        self:currentCharacter().avatar:hideCursor()
        self.current_char = self.current_char % #self.right.characters + 1
    end
end

function Battle:onUpdate(dt)
    current = self:currentCharacter()
    current.avatar:showCursor()
    self.stack:push('choose_action', self)

end

function Battle:currentCharacter()
    return self[self.current_party].characters[self.current_char]
end

function Battle:setNextAction(name, params)
    self.next_action = {
        name = name,
        params = params
    }
end

return Battle
