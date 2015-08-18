local composer=require "composer"
local scene=composer.newScene()

local display=display
local log=log
local os=os
local table=table
local transition=transition
local ipairs=ipairs
local graphics=graphics
local timer=timer
local os=os

local scenedata=require "scenedata"
local emailcsv=require "util.emailcsv"

setfenv(1,scene)

function scene:show(event)
  if event.phase~="will" then
    return
  end
  local layout=scenedata.getNextSceneLayout()
  if not layout then
    emailcsv.send()
    return 
  end

  local tap
  tap=function(event)
    log({
      ["time"]=os.date(),
      ["x"]=event.x,
      ["y"]=event.y,
      ["touched"]=event.target.info,
      ["time"]=event.time,
      ["date"]=os.date()
    })
    event.target:setFillColor(0,0,1)
    for i=scene.view.numChildren,1, -1 do 
      scene.view[i]:removeEventListener("tap", tap)
    end
     
    timer.performWithDelay(200, function ()
      for i=scene.view.numChildren,1, -1 do 
        scene.view[i]:removeSelf()
      end
      
      composer.removeScene("scenes.scene")
      composer.gotoScene("scenes.reload",{params={scene="scenes.scene"}})
    end)
    return true
  end

  local bg=display.newImage(scene.view,"img/"..layout.background)
  bg:translate(display.contentCenterX, display.contentCenterY)
  if not layout.objects then
    bg:addEventListener("tap", function() 
      for i=scene.view.numChildren,1, -1 do 
        scene.view[i]:removeSelf()
      end
      
      composer.removeScene("scenes.scene")
      composer.gotoScene("scenes.reload",{params={scene="scenes.scene"}})  
    end)
  end

  for k,v in ipairs(layout.objects or {}) do
    local obj=display.newImageRect(scene.view, "img/" .. v.img,bg.contentWidth,bg.contentHeight)
    obj:translate(display.contentCenterX+(v.x or 0), display.contentCenterY+(v.y or 0))
    obj:scale((v.scale or 1) * (v.mirror and -1 or 1),v.scale or 1)
    obj.info=v.name
    if not v.no_tap then
      obj:addEventListener("tap", tap)
    end
    if v.mask then
      local mask=graphics.newMask("img/"..v.mask)
      obj:setMask(mask)
      obj.isHitTestMasked=true
    end
  end
  self.alpha=0
  transition.to(self.view,{alpha=1})
end

scene:addEventListener("show")

return scene