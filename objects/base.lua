baseOffset =80
base = {}

function createBase (_img)
  base = {
    x = scale.x,
    y = scale.y + baseOffset,
    img = _img
  }
end

function drawBase()
  love.graphics.draw(base.img,base.x,base.y,0,1,1,base.img:getWidth()/2,base.img:getHeight()/2)
end