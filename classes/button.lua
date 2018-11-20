button = {}

function button.new (_text,_x,_y,_w,_h,_color)
  newbutton = {
    text = _text,
    x = _x,
    y = _y,
    w = _w,
    h = _h,
    alpha = 0.8,
    color = _color
  }

  return newbutton
end

function button.draw(btn)
  love.graphics.setColor(btn.color[1],btn.color[2],btn.color[3],btn.alpha)
  love.graphics.rectangle("fill", btn.x, btn.y, btn.w, btn.h, btn.alpha)
  local text = btn.text
  local textW = font:getWidth(text)
  local textH = font:getHeight(text)
  love.graphics.setColor(1,1,1,1)
  love.graphics.print(text,btn.x+btn.w/2-textW/2,btn.y+btn.h/2-textH/2)
end

function button.selected(x,y,btn)
  return x>btn.x and x<btn.x+btn.w and y>btn.y and y<btn.y+btn.h
end