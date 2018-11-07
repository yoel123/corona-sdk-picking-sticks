entity = require("yengine.entity")
local ybtn=  {}
ybtn.__index = ybtn
setmetatable(ybtn,{__index = entity})

function ybtn:new(x2,y2)  

  img = "res/arrow.png"
	o =  entity:new(x2,y2,img)
	setmetatable(o,self)
	o.type = "ybtn"
  o.img_type = "sprite"
  o.width = 200
  o.height = 170
  o.sw = 600--width anh height of spritesheet
  o.sh = 374
  o.s_frames=4
  o.clicked = false
	return o

end--new

function ybtn:yinit() 
  
   self:my_schange_frame(1)

end--init

function yentity:my_schange_frame(n)
  self:schange_frame(n)--origenal, parent "super" change frame method
  self.img:scale( 0.2, 0.2 )--scale sprite
end--schange_frame (sprite change frame)

function ybtn:yupdate()
  self:click()
  
end--update

function ybtn:click()
  
  if(self.ytouch )then
    --print("touch "..self.yid)  
  end--if
end--update


return ybtn