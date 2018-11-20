require 'bin/index'
require 'bin/ui'
require 'bin/button'
require 'bin/base'
require 'bin/scale'
require 'bin/balls'
require 'bin/plates'
require 'bin/cords'

mode = "index"
focus = 1

function love.load(arg)
  love.graphics.setNewFont(20)
  love.graphics.setBackgroundColor(1,1,1,1)

  local scaleImg = love.graphics.newImage('res/wood.png')
  local baseImg = love.graphics.newImage('res/base.png')
  local ballImg = love.graphics.newImage('res/ball.png')
  local plateImg = love.graphics.newImage('res/plate.png')
  local cordImg = love.graphics.newImage('res/cords.png')

  createScale(scaleImg)
  createBase(baseImg)
  createBall("",1,ballImg)
  createBall("",3,ballImg)
  createBall("",5,ballImg)
  createBall("",9,ballImg)
  createBall("x",4.5,ballImg)
  createPlate(scale.x-plateSeparation, scale.y, plateImg)
  createPlate(scale.x+plateSeparation, scale.y, plateImg)
  for i=1, #plates do
    createCord(cordImg)
  end
  createOptions()
end

function love.mousepressed(x,y,button)
  if button == 1 then
    if mode == "index" then
      buttonPressed(x,y)
    else
      ballPressed(x,y)
    end
  end
end

function love.mousereleased(x,y,button)
  if button == 1 then
    if mode == "index" then
      buttonReleased(x,y)
    else
      ballReleased(x,y)
    end
  end
end

function love.update(dt)
  updateBalls(dt)
  updateScale(dt)
  updatePlates(dt)
  updateCords(dt)
end

function love.draw(dt)
  if mode == "index" then
    drawIndex()
    drawText("Bienvenido, escoge una opción para empezar")
  elseif mode == "Desafío 1" then
    drawLayers()
    drawText("Tu primer desafio: forma tres inecuaciones")
    drawBase()
    drawScale() 
    drawCords()
    drawBalls()
    drawPlates()
  end
  
end