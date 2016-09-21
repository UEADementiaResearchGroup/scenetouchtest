display.setStatusBar(display.HiddenStatusBar)

require "util.csv"
local path=system.pathForFile("data.csv",system.DocumentsDirectory)
log=csv.create(path,{"time","x","y","touched","date","extra"})
local composer=require "composer"
composer.gotoScene("scenes.setup")

-- local lfs = require "lfs"

-- local imgPath = system.pathForFile("img", system.ResourceDirectory)

-- local imgUsed={}
-- for file in lfs.dir(imgPath) do
--     -- File is the current file or directory name
--     if file:find(".png") then
--     	imgUsed[file]=false
--     end
-- end

-- local scenedata=require "scenedata"
-- for i=1, #scenedata.files do
-- 	scenedata.load(scenedata.files[i].file)

-- 	while true do
-- 		local scene=scenedata.getNextSceneLayout()
-- 		if not scene then
-- 			break
-- 		end
-- 		if imgUsed[scene.background]==nil then
-- 			print ("Missing file "..scene.background)
-- 		else
-- 			imgUsed[scene.background]=true
-- 		end
-- 		for k,v in ipairs(scene.objects or {}) do
-- 			if imgUsed[v.img]==nil then
-- 				print ("Missing file "..v.img)
-- 			else
-- 				imgUsed[v.img]=true
-- 			end
-- 			if v.mask then
-- 				if imgUsed[v.mask]==nil then
-- 					print ("Missing file "..v.mask)
-- 				else
-- 					imgUsed[v.mask]=true
-- 				end
-- 			end
-- 		end
-- 	end
-- end

-- for k,v in pairs(imgUsed) do
-- 	if v==false then
-- 		print (k .. " is an unused image")
-- 	end
-- end


-- local group=display.newGroup()
-- Runtime:addEventListener("tap", function() 
-- 	local layout=scenedata.getNextSceneLayout()
-- 	repeat 
-- 		layout=scenedata.getNextSceneLayout()
-- 	until not layout or layout.objects
-- 	if not layout then
-- 		return
-- 	end

-- 	group:removeSelf()
-- 	group=display.newGroup()
-- 	local bg=display.newImage(group,"img/"..layout.background)
-- 	bg:translate(display.contentCenterX, display.contentCenterY)
-- 	-- if not bg then
-- 	-- 	print (layout.background .. " is missing")
-- 	-- else
-- 	-- 	bg:removeSelf()
-- 	-- end

-- 	for k,v in ipairs(layout.objects or {}) do
-- 		local obj=display.newImage(group,"img/" .. v.img)
-- 		obj.scaleX=bg.contentWidth/obj.width
-- 		obj.scaleY=bg.contentHeight/obj.height
-- 		if not obj then
-- 			print (v.img .. " is missing")
-- 		else
-- 		  obj:translate(display.contentCenterX+(v.x or 0), display.contentCenterY+(v.y or 0))
--  		  obj:scale((v.scale or 1) * (v.mirror and -1 or 1),v.scale or 1)
     
-- 			-- obj:removeSelf()
-- 		end
-- 		if v.mask then
-- 			local mask=graphics.newMask("img/"..v.mask)
-- 			if not mask then
-- 				print (v.mask .. " is missing")
-- 			end
-- 			obj:setMask(mask)
-- 		end
-- 	end
-- end)

