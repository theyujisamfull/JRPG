
local Sprite = new 'graphics.drawable' {
  filename = "none",
  color = nil,
  hotspot = nil
}

function Sprite:loadImage()
  self.image = love.graphics.newImage("assets/" .. self.filename .. ".png")
  self.color = self.color or { 1, 1, 1 }
end

function Sprite:init()
  self.hotspot = self.hotspot or new(Vec) { 0.5, 0.5 }
  self:loadImage()
end

function Sprite:getHotspot()
  local size = new(Vec) { self.image:getDimensions() }
  return self.hotspot * size
end

function Sprite:onDraw()
  local g = love.graphics
  g.setColor(self.color)
  g.draw(self.image, 0, 0, 0, 1, 1, self:getHotspot():get())
end

return Sprite

