local returnSpeed = 500

ball = {}

ballImg = {}

function ball.new(_hidden, _weight, _img)
  newball = {
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
  return newball
end

function ball.selected(curX, curY, ball)
  local bx=ball.x
  local by=ball.y
  local br=ball.radius
  return (curX - bx)^2 + (curY - by)^2 < br^2 
end

function ball.inside (ball,_plate)
  local w = plates[1].img:getWidth()/2
  local bx = ball.x
  local by = ball.y
  local px = plates.x
  local py = plates.y
  local additional = 30+#plates.ball*ball[1].radius*2
  return bx>px-w and bx<px+w and by>py-w and by<py+w+additional
end

function ball.still (dt,ball)
end

function ball.free(dt,b)
  local dx = b.baseX - b.x
  local dy = b.baseY - b.y
  
  if dx==0 and dy==0 then
    b.state = "still"
  else
    local d = math.sqrt( dx^2 + dy^2)
    local mx =  dx * dt /d * returnSpeed
    local my = dy * dt /d * returnSpeed

    --check if ball arrived in x cord
    if (math.abs(mx) >= math.abs(dx) or dx==0) then
      b.x = b.baseX
    else
      b.x = b.x + mx
    end

    --check if ball arrived in y cord
    if (math.abs(my) >= math.abs(dy) or dy==0) then
      b.y = b.baseY
    else
      b.y = b.y + my
    end
  end
end

function ball.follow(dt, b)
  b.x = love.mouse.getX()
  b.y = love.mouse.getY()
end

function ball.inplate(dt,b)
  for j=1, #plates do
    _findball = findBallOBJ(j,b)
    if _findball ~= 0 then
      b.x = plates[j].x
      b.y = plates[j].y-b.radius*1.8*_findball
    end
  end
end
  
function ball.update (dt,b)
  if b.state == 'still' then
    ball.still(dt,b)
  elseif b.state=='free' then
    ball.free(dt,b)
  elseif b.state=='follow' then
    ball.follow(dt,b)
  elseif b.state=='inPlate' then
    ball.inplate(dt,b)
  end
end

function ball.draw (ball)
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(ball.img, ball.x, ball.y, 0, 1, 1, ball.radius, ball.radius)
  love.graphics.setColor(0,0,0,1)
  if (ball.hidden ~= "") then
    local centerW=font:getWidth(ball.hidden)
    love.graphics.print(ball.hidden,ball.x, ball.y, 0, 1, 1, centerW/2, 10)
  else
    local centerW=font:getWidth(ball.weight)
    love.graphics.print(ball.weight,ball.x, ball.y, 0, 1, 1, centerW/2, 10)
  end
  love.graphics.setColor(1,1,1,1)
end