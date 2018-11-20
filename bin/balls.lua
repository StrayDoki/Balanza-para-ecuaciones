returnSpeed = 500
balls = {}

function createBall (_hidden, _weight, _img)
  balls[#balls+1] = {
    baseX = 0,
    baseY = 0,
    x = 0,
    y = 0,
    radius= 32,
    state = "still",
    hidden = _hidden,
    weight = _weight,
    img = _img
  }

  positionBalls()
end

function isBallSelected (curX, curY, _ball)
  local bx=balls[_ball].x
  local by=balls[_ball].y
  local br=balls[_ball].radius
  return (curX - bx)^2 + (curY - by)^2 < br^2 
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

function ballPressed(_x,_y)
  for i=#balls, 1, -1 do
    if isBallSelected(_x,_y,i) then
      focus = i
      balls[focus].state= "follow"

      for j=1, #plates do
        removeBall(j, i)
      end
      return
    end
  end
end

function ballReleased (_x,_y)
  for j=1, #plates do
    if isBallSelected(_x,_y,focus) then
      if isBallInsidePlate(focus,j) then
        balls[focus].state = "inPlate"
        addBall(j,focus)
        return
      else
        balls[focus].state = "free"
      end
    end
  end
end

function updateBalls(dt)
  for i=1, #balls do
    if balls[i].state == "free" then
      local dx = balls[i].baseX - balls[i].x
      local dy = balls[i].baseY - balls[i].y
      
      if dx==0 and dy==0 then
        balls[i].state = "still"
      else
        local d = math.sqrt( dx^2 + dy^2)
        local mx =  dx * dt /d * returnSpeed
        local my = dy * dt /d * returnSpeed

        --check if ball arrived in x cord
        if (math.abs(mx) >= math.abs(dx) or dx==0) then
          balls[i].x = balls[i].baseX
        else
          balls[i].x = balls[i].x + mx
        end

        --check if ball arrived in y cord
        if (math.abs(my) >= math.abs(dy) or dy==0) then
          balls[i].y = balls[i].baseY
        else
          balls[i].y = balls[i].y + my
        end
      end
    elseif balls[i].state == "follow" then
      balls[i].x = love.mouse.getX()
      balls[i].y = love.mouse.getY()
    elseif balls[i].state == "inPlate" then
      for j=1, #plates do
        _findball = findBall(j,i)
        if _findball ~= 0 then
          balls[i].x = plates[j].x
          balls[i].y = plates[j].y-balls[i].radius*1.8*_findball
        end
      end
    end
  end
end

function drawBalls()
  for i=1,#balls do
    love.graphics.draw(balls[i].img, balls[i].x, balls[i].y, 0, 1, 1, balls[i].radius, balls[i].radius)
    love.graphics.setColor(0,0,0,1)
    if (balls[i].hidden ~= "") then
      love.graphics.print(balls[i].hidden,balls[i].x, balls[i].y, 0, 1, 1, 7, 10)
    else
      love.graphics.print(balls[i].weight,balls[i].x, balls[i].y, 0, 1, 1, 7, 10)
    end
    love.graphics.setColor(1,1,1,1)
  end
end