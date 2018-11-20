require 'objects/title'
require 'objects/aside'
require 'classes/region'
require 'classes/element'
require 'classes/button'


level2 = {}

local back = {}
local orangeColor = {0.9,0.5,0.1}

local regions = {}
local regionColors = {
  {0.5,1,0.5},
  {1,0.3,0.3}
}

elements = {}

function level2.load()

  regions[1] =  region.new(
    0,
    titleHeight*love.graphics.getHeight(),
    love.graphics.getWidth()/2,
    (1-titleHeight)*love.graphics.getHeight(),
    regionColors[1]
  )

  regions[2] =  region.new(
    love.graphics.getWidth()/2,
    titleHeight*love.graphics.getHeight(),
    love.graphics.getWidth()/2,
    (1-titleHeight)*love.graphics.getHeight(),
    regionColors[2]
  )

  elements[1] = element.new(
    200,200,"+",5,img.element[1]
  )

  back = button.new('Atras',700,520,70,50,orangeColor)
end

function level2.draw()
  title.draw('Establescamos desigualdades')
  region.draw(regions[1])
  region.draw(regions[2])
  element.draw(elements[1])
  button.draw(back)
end

function level2.update(dt)
  
end

function level2.exit()
  
end

function level2.mousepressed(x,y)
  
  if button.selected(x,y,back) then
    back.alpha=0.3
  end
end

function level2.mousereleased(x,y)
 
  if button.selected(x,y,back) then
    level2.exit()
    change_state(menu)
  end
end