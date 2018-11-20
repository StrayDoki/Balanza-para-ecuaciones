require 'objects/title'
require 'objects/aside'
require 'objects/plates'
require 'objects/base'
require 'objects/scale'
require 'objects/plates'
require 'objects/cords'
require 'classes/ball'
require 'classes/button'

level3 = {}

local back = {}
local orangeColor = {0.9,0.5,0.1}

function level3.load()
  local balls = {}
  balls[1] = ball.new('',2,img.ball[1])
  balls[2] = ball.new('',4,img.ball[1])
  balls[3] = ball.new('',6,img.ball[1])
  balls[4] = ball.new('c',1.9,img.ball[1])
  balls[5] = ball.new('2c',3.8,img.ball[1])
  aside.asignBalls(balls)

  createScale(img.scale)
  createBase(img.base)
  createPlate(scale.x-plateSeparation, scale.y, img.plate)
  createPlate(scale.x+plateSeparation, scale.y, img.plate)
  createCord(img.cord)
  createCord(img.cord)

  back = button.new('Atras',700,520,70,50,orangeColor)
end

function level3.draw()
  title.draw('Hallemos el Conjunto Solución')
  drawBase()
  drawScale() 
  drawCords()
  drawPlates()
  aside.draw()
  button.draw(back)
end

function level3.update(dt)
  aside.update(dt)
  updateScale(dt)
  updatePlates(dt)
  updateCords(dt)
end

function level3.exit()
  deleteScale()
  deleteCords()
  deletePlates()
end

function level3.mousepressed(x,y)
  aside.mousepressed(x,y)

  if button.selected(x,y,back) then
    back.alpha=0.3
  end
end

function level3.mousereleased(x,y)
  aside.mousereleased(x,y)
  back.alpha=0.8
  if button.selected(x,y,back) then
    level1.exit()
    change_state(menu)
  end
end