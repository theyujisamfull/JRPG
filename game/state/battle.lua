
--local PARTIES = { 'right', 'left' }

local Battle = new 'state.base' {
    PARTIES = { 'right', 'left' },
    graphics = nil,
    current_party = 1,
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
                cooldown = char.cooldown,
                speed = char.speed,
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
        for i, side in ipairs(self.PARTIES) do
            --[[local side
            if i==1 then
                side = 'left'
            else
                side = 'right'
            end]]
            local destroy = {}
            for i, char in ipairs(self[side].characters) do
                if char.vida_atual <= 0 then
                    destroy[i] = true
                else
                    destroy[i] = false
                end   
            end
            for i = #destroy, 1, -1 do
                if destroy[i] then
                    self[side].characters[i].avatar:destroy()
                    table.remove(self[side].characters, i)
                end
            end
        end
        if #self.right.characters == 0 then
            self.stack:pop()
            while()
        else
            self:currentCharacter().avatar:hideCursor()
            --direita ou esquerda
            self.current_char = self.current_char % #self[self.PARTIES[self.current_party]].characters + 1
            if self.current_char == 1 then
                self.current_party = self.current_party % 2 + 1
            end
            while self:currentCharacter().cooldown < 100 do
                --current.avatar:hideCursor()
                self:currentCharacter().cooldown = self:currentCharacter().cooldown + self:currentCharacter().speed
                self.current_char = self.current_char % #self[self.PARTIES[self.current_party]].characters + 1
                if self.current_char == 1 then
                    self.current_party = self.current_party % 2 + 1
                end
                --current = self:currentCharacter()
                --current.avatar:showCursor()
            end
        end
        --self:currentCharacter().cooldown = 0
    end
    
end

function Battle:onUpdate(dt)
    current = self:currentCharacter()
    current.avatar:showCursor()
    current.cooldown = 0
    if self.current_party == 2 then
        --current.cooldown = 0
        self.stack:push('monster_turn', self)
    else
        --current.cooldown = 0
        self.stack:push('choose_action', self)
    end
end

function Battle:onLeave()
    self.graphics.layers.entities = new 'graphics.layer' {}
    self.current_party = 1
    self.current_char = 1
end

function Battle:currentCharacter()
    return self[self.PARTIES[self.current_party]].characters[self.current_char]
end

function Battle:setNextAction(name, params)
    self.next_action = {
        name = name,
        params = params
    }
end

return Battle
