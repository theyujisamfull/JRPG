
local Drawable = new(Object) {
  visible = true,
  destroyed = false,
}

function Drawable:init()
  self.position = self.position or new(Vec) {}
  self.box = self.box or new(Box) {}
end

function Drawable:isDestroyed()
  return self.destroyed
end

function Drawable:destroy()
  self.destroyed = true
end

function Drawable:isInside(pos)
  return self.box:isInside(pos - self.position)
end

function Drawable:update(dt)
  -- Abstract method
end

function Drawable:onDraw()
  -- Abstract method
end

function Drawable:onKeyPressed(key)
  -- Abstract method
end

function Drawable:draw()
  if self.visible then
    local g = love.graphics
    g.push()
    g.translate(self.position:get())
    self:onDraw()
    if DEBUG then
      g.setColor(0, 1, 0, 0.5)
      g.rectangle('fill', self.box:getRectangle())
    end
    g.pop()
  end
end

return Drawable

