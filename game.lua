ye = require("yengine.ye")
yworld = require("yengine.world")
ytimer = require("yengine.timer")

ybtn = require("btn")
yplayer = require("player")
ystick = require("stick")

game_world = yworld:new()
game_world.points = 0
game_world.rank = "none"

function game_world:create( event )

--ui
  game_world.points = 0--reset just incase
  game_world.ptext = ye:txt("points: "..game_world.points,50,10,14)
  game_world.rtext = ye:txt("rank: "..game_world.rank,150,25,14)

  up = ybtn:new(100,300)
  down= ybtn:new(100,350)
  right = ybtn:new(130,320)
  left = ybtn:new(70,325)
  
  player = yplayer:new(100,10)
  player.up = up
  player.down = down
  player.right = right
  player.left = left
  
  stick = ystick:new(20,20)
  --stick:rand_pos()
  
  self:add(up)
  self:add(down)
  self:add(right)
  self:add(left)
  self:add(player)
  self:add(stick)
  
  --change frame (after add becuse init method runs after add)
  down:my_schange_frame(2)
  right:my_schange_frame(4)
  left:my_schange_frame(3)
  
end--create

game_world:yinit()

function gameLoop( event )

game_world:update()


  game_world.ptext.text = "points: "..game_world.points--update points text
  game_world.rtext.text = "rank: "..game_world.rank--update rank text

  if(game_world.points>10)then
    game_world.rank = "stick picker"
  end

  if(game_world.points>20)then
    game_world.rank = "pro stick picker"
  end
  if(game_world.points>25)then
    game_world.rank = "master stick picker"
  end
  if(game_world.points>30)then
    game_world.rank = "no life"
  end
  if(game_world.points>35)then
    game_world.rank = "you shod stop you know"
  end
  if(game_world.points>40)then
    game_world.rank = "this game never ends"
  end
  if(game_world.points>45)then
    game_world.rank = "just sying its youre life..."
  end
  if(game_world.points>50)then
    game_world.rank = "good job you win"
  end
  if(game_world.points>60)then
    game_world.rank = "you can stop now"
  end




end--create

gameLoopTimer = timer.performWithDelay( 16,gameLoop , 0 )

return game_world.yscene