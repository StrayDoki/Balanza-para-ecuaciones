require 'objects/title'
require 'objects/aside'
require 'objects/plates'
require 'objects/base'
require 'objects/scale'
require 'objects/plates'
require 'objects/cords'
require 'classes/ball'
require 'classes/button'

level4 = {}

local back = {}
local orangeColor = {0.9,0.5,0.1}

function level4.load()
  local balls = {}
  balls[1] = ball.new('',3,img.ball[1])
  balls[2] = ball.new('',7,img.ball[1])
  balls[3] = ball.new('',1,img.ball[1])
  balls[4] = ball.new('z',8.8,img.ball[1])
  balls[5] = ball.new('2z',17.6,img.ball[1])
  aside.asignBalls(balls)

  createScale(img.scale)
  createBase(img.base)
  createPlate(scale.x-plateSeparation, scale.y, img.plate)
  createPlate(scale.x+plateSeparation, scale.y, img.plate)
  createCord(img.cord)
  createCord(img.cord)

  back = button.new('Atras',700,520,70,50,orangeColor)
end

function level4.draw()
  title.draw('Hallemos el Conjunto Solución')
  drawBase()
  drawScale() 
  drawCords()
  drawPlates()
  aside.draw()
  button.draw(back)
end

function level4.update(dt)
  aside.update(dt)
  updateScale(dt)
  updatePlates(dt)
  updateCords(dt)
end

function level4.exit()
  deleteScale()
  deleteCords()
  deletePlates()
end

function level4.mousepressed(x,y)
  aside.mousepressed(x,y)

  if button.selected(x,y,back) then
    back.alpha=0.3
  end
end

function level4.mousereleased(x,y)
  aside.mousereleased(x,y)
  back.alpha=0.8
  if button.selected(x,y,back) then
    level1.exit()
    change_state(menu)
  end
end