require 'states/balanza1'
require 'states/balanza2'
require 'states/level2'
require 'states/level3'
require 'states/level4'
require 'states/level5'
require 'states/level6'
require 'states/level7'

require 'objects/title'
require 'classes/button'

menu = {}

local level = {
  balanza1,
  balanza2,
  level2,
  level3,
  level4,
  level5,
  level6,
  level7
}

local window = {
  width = love.graphics.getWidth(),
  height = love.graphics.getHeight()
}

local columns = 2
local rows = 4
local spaceX = 100
local spaceY = 50

local buttons = {}
local options = {
  'La balanza I',
  'La balanza II',
  'Desafío 2',
  'Desafio 3',
  'Desafio 4',
  'Desafio 5',
  'Desafio 6',
  'Desafio 7'
}
local redColor = {1,0.1,0}

function menu.load()
  local sx = spaceX
  local sy = spaceY
  local x = 0
  local y = window.height*titleHeight
  local nc = columns
  local nr = rows
  local w = (window.width - sx*(nc +1))/nc
  local h = (window.height*(1-titleHeight) - sy*(nr +1))/nr

  for i=1,nr do
    buttons[i] = {}
    for j=1, nc do
      buttons[i][j] = button.new(options[j+(i-1)*nc],x + j*sx + (j-1)*w, y + i*sy + (i-1)*h,w,h,redColor)
    end
  end
end

function menu.draw()
  title.draw('La balanza de los números')
  for i=1,rows do
    for j=1, columns do
      button.draw(buttons[i][j])
    end
  end
  love.graphics.setColor(1,1,1,1)
end

function menu.update(dt)
end

function menu.mousepressed(x,y)
  for i=1,rows do
    for j=1, columns do
      if button.selected(x,y,buttons[i][j]) then
        buttons[i][j].alpha = 0.3
      end
    end
  end
end

function menu.mousereleased(x,y)
  for i=1,rows do
    for j=1, columns do
      buttons[i][j].alpha = 0.7
      if button.selected(x,y,buttons[i][j]) then
        change_state(level[j+(i-1)*columns])
      end
    end
  end
end