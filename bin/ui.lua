local window = {
  width = love.graphics.getWidth(),
  height = love.graphics.getHeight()
}

local options = {
  top = 0.1,
  right = 0.1
}

function drawLayers ()
  love.graphics.setColor(0,0,1,0.5)
  love.graphics.rectangle("fill", 0,0,window.width,window.height * options.top)
  
  love.graphics.setColor(0,1,0.5,1)
  love.graphics.rectangle("fill", 0, window.height * options.top, window.width * options.right, window.height*(1-options.top))

  love.graphics.setColor(1,1,1,1)
end

function positionBalls()
  local n = #balls
  local r = balls[1].radius
  local w = window.width * options.right
  local h = window.height*(1-options.top)
  local s = (h-2*r*n)/(n+1)
  for i=1, #balls do
    balls[i].x = w/2
    balls[i].y = s*i + (2*i+1)*r
    balls[i].baseX = balls[i].x
    balls[i].baseY = balls[i].y
  end
end

function positionScale()
  scale.x = window.width * (1+options.right) / 2
  scale.y = window.height * (1+ options.top)/2 - baseOffset
end

function drawText(text)
  local _font = love.graphics.newFont(24)
  love.graphics.setFont(_font)
  local x = window.width / 2 - _font:getWidth(text)/2
  local y = window.height * options.top / 2 - _font:getHeight(text) /2  
  love.graphics.print(text,x,y,0,1,1)
end