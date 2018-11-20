require 'objects/title'
require 'objects/aside'
require 'objects/plates'
require 'objects/base'
require 'objects/scale'
require 'objects/plates'
require 'objects/cords'
require 'classes/ball'
require 'classes/button'

balanza2 = {}

local back = {}
local orangeColor = {0.9,0.5,0.1}

function balanza2.load()
  local balls = {}
  balls[1] = ball.new('',5,img.ball[1])
  balls[2] = ball.new('',2,img.ball[1])
  balls[3] = ball.new('',3,img.ball[1])
  balls[4] = ball.new('x',6,img.ball[1])
  aside.asignBalls(balls)

  createScale(img.scale)
  createBase(img.base)
  createPlate(scale.x-plateSeparation, scale.y, img.plate)
  createPlate(scale.x+plateSeparation, scale.y, img.plate)
  createCord(img.cord)
  createCord(img.cord)

  back = button.new('Atras',700,520,70,50,orangeColor)
end

function balanza2.draw()
  title.draw('La balanza II: equilibra la balanza usando todas las bolitas')
  drawBase()
  drawScale() 
  drawCords()
  drawPlates()
  aside.draw()
  button.draw(back)
end

function balanza2.update(dt)
  aside.update(dt)
  updateScale(dt)
  updatePlates(dt)
  updateCords(dt)
end

function balanza2.exit()
  deleteScale()
  deleteCords()
  deletePlates()
end

function balanza2.mousepressed(x,y)
  aside.mousepressed(x,y)

  if button.selected(x,y,back) then
    back.alpha=0.3
  end
end

function balanza2.mousereleased(x,y)
  aside.mousereleased(x,y)
  back.alpha=0.8
  if button.selected(x,y,back) then
    balanza2.exit()
    change_state(menu)
  end
end