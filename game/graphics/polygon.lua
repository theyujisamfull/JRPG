
local Polygon = new 'graphics.drawable' {
    mode     = 'fill',
    vertices = nil,
    color    = nil,
}

function Polygon:init()
    self.vertices = self.vertices or {}
    self.color = self.color       or { 1, 1, 1 }
end

function Polygon:onDraw()
    love.graphics.setColor(self.color)
    love.graphics.polygon(self.mode, self.vertices)
end

return Polygon
