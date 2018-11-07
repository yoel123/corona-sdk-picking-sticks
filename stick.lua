entity = require("yengine.entity")
local ystick=  {}
ystick.__index = ystick
setmetatable(ystick,{__index = entity})

function ystick:new(x2,y2)  
  img="res/stick.png"
	o =  entity:new(x2,y2,img)
	setmetatable(o,self)
	o.type = "ystick"
  o.debug = true
  return o

end--new

function ystick:yinit()  
end--init

function ystick:yupdate()  
end--update

function ystick:rand_pos()  
  self.x=math.random(25,180)
  self.y=math.random(40,180)
end--rand_pos

return ystick