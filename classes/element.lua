local returnSpeed = 500

element = {}

elementImg = {}

function element.new(_x,_y, _oper,_val, _img)
  newelement = {
    x = _x,
    y = _y,
    width = _img:getWidth(),
    height = _img:getHeight(),
    state = "still",
    operation = _oper,
    value = _val,
    img = _img
  }
  return newelement
end

function element.isselected(curX, curY, elem)
  return
    elem.x - elem.width/2 < curX and
    elem.x + elem.width/2 > curX and
    elem.y - elem.height/2 < curY and
    elem.y + elem.height/2 > curY
end

function element.insideRegion (elem,reg)
  local w = plates[1].img:getWidth()/2
  local bx = elem.x
  local by = elem.y
  local px = plates.x
  local py = plates.y
  local additional = 30+#plates.element*element[1].radius*2
  return bx>px-w and bx<px+w and by>py-w and by<py+w+additional
end

function element.still (dt,element)
end

function element.follow(dt, b)
  b.x = love.mouse.getX()
  b.y = love.mouse.getY()
end

function element.inplate(dt,b)
  for j=1, #plates do
    _findball = findBallOBJ(j,b)
    if _findball ~= 0 then
      b.x = plates[j].x
      b.y = plates[j].y-b.radius*1.8*_findball
    end
  end
end
  
function element.update (dt,b)
  if b.state == 'still' then
    element.still(dt,b)
  elseif b.state=='follow' then
    element.follow(dt,b)
  elseif b.state=='inPlate' then
    element.inplate(dt,b)
  end
end

function element.draw (elem)
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(elem.img, elem.x, elem.y, 0, 1, 1, elem.width/2, elem.height/2)
  love.graphics.setColor(0,0,0,1)

  local miniFont = love.graphics.newFont(16)
  love.graphics.setFont(miniFont)
  local operW = miniFont:getWidth(elem.operation)
  local operH = miniFont:getHeight(elem.operation)
  love.graphics.print(elem.operation,elem.x-15,elem.y,0,1,1,operW/2, operH/2)

  local megaFont = love.graphics.newFont(28)
  love.graphics.setFont(megaFont)
  local valW = megaFont:getWidth(elem.value)
  local valH = megaFont:getHeight(elem.value)
  love.graphics.print(elem.value,elem.x+10,elem.y,0,1,1,valW/2, valH/2)

  love.graphics.setFont(font)

  love.graphics.setColor(1,1,1,1)
end