
local EndGame = new 'state.base' {}

function EndGame:onEnter(battle)
    self.battle = battle
    if #self.battle.left.characters == 0 then
        local victory = new 'graphics.victory' { stack = self.battle.stack }
        self.battle.graphics:add('gui', victory )
        self.battle.graphics:focus(victory)
    elseif #self.battle.right.characters == 0 then
        -- limpa a tela
        for _,layer_id in ipairs(self.battle.graphics.layers) do
            if layer_id ~= 'bg' then
                self.battle.graphics.layers[layer_id] = new 'graphics.layer' {}
                --[[for drawable in pairs(self.battle.graphics.layers[layer_id].drawables) do
                    --self.battle.graphics.layers[layer_id].drawables[drawable]:destroy()
                    drawable:destroy()
                end]]
            end
        end
        local defeat = new 'graphics.defeat' { stack = self.battle.stack }
        self.battle.graphics:add('gui', defeat )
        self.battle.graphics:focus(defeat)
    end

    --self.battle.graphics:add('bg')
end

function EndGame:onLeave()
    self.battle.graphics.layers.gui = new 'graphics.layer' {}
end

function EndGame:onSuspend()
    -- abstract method
end

function EndGame:onResume()
    -- abstract method
end

function EndGame:onUpdate(dt)
    -- abstract method
end

return EndGame
