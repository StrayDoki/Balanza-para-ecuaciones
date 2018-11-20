cords = {}

function createCord (_img)
  cords[#cords+1] = {
    x=0 ,
    y=0 ,
    img = _img
  }
end

function deleteCords()
  cords={}
end

function updateCords()
  for i=1 , #cords do
    cords[i].x = plates[i].x
    cords[i].y = plates[i].y- plates[#cords].img:getHeight() + plateOffset
  end
end

function drawCords ()
  for i=1, #cords do
    love.graphics.draw(cords[i].img,cords[i].x,cords[i].y,0,1,1,cords[i].img:getWidth()/2,cords[i].img:getHeight()/2)
  end
end

