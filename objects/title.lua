local window = {
  width = love.graphics.getWidth(),
  height = love.graphics.getHeight()
}

titleHeight = 0.1

title = {}

function title.draw(text)
  love.graphics.setColor(0,0,0.9,0.6)
  love.graphics.rectangle('fill',0,0,window.width,window.height*titleHeight)
  local textW = font:getWidth(text)
  local textH = font:getHeight(text)
  love.graphics.setColor(1,1,1,1)
  love.graphics.print(text,(window.width-textW)/2,(window.height*titleHeight-textH)/2)
end
