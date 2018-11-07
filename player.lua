entity = require("yengine.entity")
local yplayer=  {}
yplayer.__index = yplayer
setmetatable(yplayer,{__index = entity})

function yplayer:new(x2,y2)  
  img = "res/stick_picker.png"
	o =  entity:new(x2,y2,img)
	setmetatable(o,self)
	o.type = "yplayer"
  o.img_type = "sprite"
  o.width = 43
  o.height = 36
  o.sw = 180--width anh height of spritesheet
  o.sh = 180
  o.s_frames=20
  --o.debug = true
   o.speed=2
	return o

end--new

function yplayer:yinit()  
end--init

function yplayer:yupdate()  
  self:move_controls() 
  self:hit_test()
end--update

function yplayer:move_controls()  
  
  if(self.up.ytouch)then
    self:move_by(0,-self.speed)
    self:schange_frame(1)
  end--if up
  
  if(self.down.ytouch)then
    self:move_by(0,self.speed)
    self:schange_frame(3)
  end--if up
  
  if(self.right.ytouch)then
    self:move_by(self.speed,0) 
    self:schange_frame(2)
  end--if up
  if(self.left.ytouch)then
    self:move_by(-self.speed,0)
    self:schange_frame(4)
  end--if up
  
  --limits
  if(self.x<0)then
    self.x=0
  end--if
  if(self.x>300)then
    self.x=300
  end--if
  
  if(self.y<30)then
    self.y=30
  end--if
  if(self.y>200)then
    self.y=200
  end--if
end--move_controls

function yplayer:hit_test()  
  
  tst_col = self:collide(0,0,"ystick")
  
  if(#tst_col>1)then
    tst_col[1]:rand_pos()
    self.world.points = self.world.points+1 
  end--if
  tst_col[1]=nil
  tst_col = nil
end--hit_test

return yplayer