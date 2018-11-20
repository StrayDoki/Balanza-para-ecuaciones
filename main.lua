require 'states/menu'

local state = nil

function change_state(s)
  state = s
  state.load()
end

font = love.graphics.newFont(24)

img = {}

focus = 1

function love.load()
  love.graphics.setBackgroundColor(1,1,1,1)
  love.graphics.setFont(font)
  img.scale = love.graphics.newImage('res/wood.png')
  img.base = love.graphics.newImage('res/base.png')
  img.ball={}
  img.ball[1] = love.graphics.newImage('res/ball.png')
  img.plate = love.graphics.newImage('res/plate.png')
  img.cord = love.graphics.newImage('res/cords.png')
  img.element={}
  img.element[1] = love.graphics.newImage('res/element.png')
  change_state(menu)
end

function love.draw()
  state.draw()
end

function love.update(dt)
  state.update(dt)
end

function love.mousepressed(x,y,button)
  if button == 1 then
    state.mousepressed(x,y)
  end
end

function love.mousereleased(x,y,button)
  if button == 1 then
    state.mousereleased(x,y)
  end
end