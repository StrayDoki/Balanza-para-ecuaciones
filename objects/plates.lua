require 'classes/ball'

plateSeparation = 240
plateOffset = 5
plateBot=90
plates = {}

function createPlate(_x, _y, _img)
  plates[#plates + 1] = {
    x = _x,
    y = _y+plateBot,
    baseX= _x,
    baseY= _y+plateBot,
    balls = {},
    img = _img
  }

end

function deletePlates()
  plates = {}
end

function plateWeight(_plate)
  local _weight = 0
  for i=1, #plates[_plate].balls do
    _ball = plates[_plate].balls[i]
    _weight = _weight + balls[_ball].weight
  end
  return _weight
end

function findBall(_plate, _ball)
  for i=1, #plates[_plate].balls do
    if(plates[_plate].balls[i] == _ball) then
      return i
    end
  end
  return 0
end

function findBallOBJ(_plate, _ball)
  for i=1, #plates[_plate].balls do
    if(balls[plates[_plate].balls[i]] == _ball) then
      return i
    end
  end
  return 0
end

function addBall(_plate, _ball)
  if(findBall(_plate,_ball)~=0) then
    return
  else
    plates[_plate].balls[#plates[_plate].balls + 1] = _ball
  end
end

function removeBall(_plate,_ball)
  local _findball = findBall(_plate, _ball)
  if(_findball == 0) then
    return
  else
    for i = _findball, #plates[_plate].balls - 1 do
      plates[_plate].balls[i] = plates[_plate].balls[i+1]
    end
    plates[_plate].balls[#plates[_plate].balls] = nil
  end
end

function updatePlates()
  plates[1].x = plates[1].baseX + plateSeparation * (1- math.cos(scale.rotation) )
  plates[1].y = plates[1].baseY - plateSeparation * ( math.sin(scale.rotation) )
  plates[2].x = plates[2].baseX - plateSeparation * (1- math.cos(scale.rotation) )
  plates[2].y = plates[2].baseY + plateSeparation * ( math.sin(scale.rotation) )
end

function drawPlates()
  love.graphics.draw(plates[1].img, plates[1].x, plates[1].y,0,1,1,plates[1].img:getWidth()/2,plates[1].img:getHeight()/2)
  love.graphics.draw(plates[2].img, plates[2].x, plates[2].y,0,1,1,plates[1].img:getWidth()/2,plates[1].img:getHeight()/2)
end