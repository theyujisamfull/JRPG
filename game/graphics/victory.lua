
local font_loader = require 'graphics.font_loader'

local Victory = new 'graphics.drawable' {
    text = 'Victory!',
    font01 = nil,
    subtext = 'Press any key to continue',
    font02 = nil,
    stack = nil,
}

function Victory:init()
    assert(self.stack)
    self.font01 = font_loader:get('regular', 50)
    self.font02 = font_loader:get('regular', 32)
    local W,H = love.graphics.getDimensions()
    self.position = new(Vec) { W/2, H/3 }
end

function Victory:onKeyPressed(key)
    --print('keypress\n' , self.stack)
    self.stack:pop()
end

function Victory:onDraw()
    local g = love.graphics
    local tx1 = -self.font01:getWidth(self.text)/2
    local ty1 = -self.font01:getHeight(self.text)/2
    local tx2 = -self.font02:getWidth(self.subtext)/2
    local ty2 = -self.font02:getHeight(self.subtext)/2
    font_loader:use(self.font01)
    g.setColor( .15, .8, .15)
    g.print(self.text, tx1, ty1)
    font_loader:use(self.font02)
    g.push()
    g.translate(0, 40)
    g.setColor( .9, .9, .2 )
    g.print(self.subtext, tx2, ty2)
    g.pop()
end

return Victory
