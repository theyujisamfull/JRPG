
local Defeat = new 'state.base' {}

function Defeat:onEnter(graphics)
    self.graphics = graphics
    -- limpa a tela
    for _,layer_id in ipairs(self.graphics.layers) do
        if layer_id ~= 'bg' then
            for drawable in pairs(self.graphics.layers[layer_id].drawables) do
                self.graphics.layers[layer_id].drawables[drawable]:destroy()
            end
        end
    end

    self.graphics:add('bg')
end

function Defeat:onLeave()
    -- abstract method
end

function Defeat:onSuspend()
    -- abstract method
end

function Defeat:onResume()
    -- abstract method
end

function Defeat:onUpdate(dt)
    -- abstract method
end

return Defeat
