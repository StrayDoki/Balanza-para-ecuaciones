require('objects/plates')

local window = {
  width = love.graphics.getWidth(),
  height = love.graphics.getHeight()
}

asideWidth = 0.1

aside = {}

balls = {}

function aside.asignBalls(_balls)
  aside.clearBalls()
  balls=_balls
  local n = #balls
  local r = balls[1].radius
  local w = window.width * asideWidth
  local h = window.height*(1-titleHeight)
  local s = (h-2*r*n)/(n+1)
  for i=1, #balls do
    balls[i].x = w/2
    balls[i].y = s*i + (2*i+1)*r
    balls[i].baseX = balls[i].x
    balls[i].baseY = balls[i].y
  end
end

function aside.clearBalls()
  balls={}
end

function aside.update(dt)
  for i=1, #balls do
    ball.update(dt,balls[i])
  end
end

function aside.draw()
  love.graphics.setColor(0,1,0.5,1)
  love.graphics.rectangle("fill", 0, window.height * titleHeight, window.width * asideWidth, window.height*(1-titleHeight))
  
  for i=1,#balls do
    ball.draw(balls[i])
  end
  love.graphics.setColor(1,1,1,1)
end

function aside.mousepressed(x,y)
  for i=#balls, 1, -1 do
    if ball.selected(x,y,balls[i]) then
      focus = i
      balls[focus].state= "follow"
      for j=1, #plates do
        removeBall(j, focus)
      end
      return
    end
  end
end

function aside.mousereleased(x,y)
  for i=1, #plates do
    if ball.selected(x,y,balls[focus]) then
      if isBallInsidePlate(focus,i) then
        balls[focus].state = "inPlate"
        addBall(i,focus)
        return
      else
        balls[focus].state = "free"
      end
    end
  end
end

function isBallInsidePlate (_ball,_plate)
  local w = plates[1].img:getWidth()/2
  local bx = balls[_ball].x
  local by = balls[_ball].y
  local px = plates[_plate].x
  local py = plates[_plate].y
  local additional = 30+#plates[_plate].balls*balls[1].radius*2
  return bx>px-w and bx<px+w and by>py-w and by<py+w+additional
end