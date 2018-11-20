scale = nil

function createScale(_img)
  scale = {
    x = 0,
    y = 0,
    rotation = 0,
    img = _img
  }
  scale.x = love.graphics.getWidth() * (1+asideWidth) / 2
  scale.y = love.graphics.getHeight() * (1+ titleHeight)/2 - baseOffset
end

function deleteScale()
  scale = nil
end

function updateScale(dt)
  if plateWeight(1) > plateWeight(2) then
    if scale.rotation > -1 * math.pi/8 then
      local _rotation = scale.rotation - dt
      if(_rotation < -1*math.pi/5) then
        scale.rotation = -1* math.pi/8
      else
        scale.rotation = _rotation
      end
    end

  elseif plateWeight(1)<plateWeight(2) then
    if scale.rotation < math.pi/8 then
      local _rotation = scale.rotation + dt
      if(_rotation > math.pi/8) then
        scale.rotation = math.pi/8
      else
        scale.rotation = _rotation
      end
    end

  else
    if scale.rotation ~= 0 then
      local rot = scale.rotation/math.abs(scale.rotation) * dt

      if math.abs(rot)>math.abs(scale.rotation) then
        scale.rotation = 0
      else 
        scale.rotation = scale.rotation - rot
      end
    end
  end
end

function drawScale()
  love.graphics.draw(scale.img, scale.x, scale.y,scale.rotation,1,1,scale.img:getWidth()/2, scale.img:getHeight() /2 )
end