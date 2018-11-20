region = {}

function region.new (_x, _y, _width, _height, _color)
  newregion = {
    x = _x,
    y= _y,
    width = _width,
    height = _height,
    color=_color
  }
  return newregion
end

function region.draw (reg)
  love.graphics.setColor(reg.color[1],reg.color[2],reg.color[3],1)
  love.graphics.rectangle("fill",reg.x,reg.y,reg.width,reg.height)
  love.graphics.setColor(1,1,1,1)
end