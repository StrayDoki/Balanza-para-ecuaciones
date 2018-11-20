local window = {
  width = love.graphics.getWidth(),
  height = love.graphics.getHeight()
}

local options = {
  top = 0.1,
  spaceY = 50,
  spaceX = 200,
  rowSize = 4, -- 2 filas
  columnSize = 1 -- 2 columnas
}

function createOptions()
  local sx = options.spaceX
  local sy = options.spaceY
  local x = 0
  local y = window.height*options.top
  local xc = options.columnSize
  local yc = options.rowSize
  local w = (window.width - sx*(xc +1))/xc
  local h = (window.height*(1-options.top) - sy*(yc +1))/yc

  for i=1,yc do
    for j=1, xc do
      CreateButton (x + j*sx + (j-1)*w, y + i*sy + (i-1)*h,w,h)
    end
  end
end

function drawIndex()
  love.graphics.setColor(0,0,1,0.5)
  love.graphics.rectangle("fill", 0,0,window.width,window.height * options.top)

  drawButtons()

  love.graphics.setColor(1,1,1,1)
end