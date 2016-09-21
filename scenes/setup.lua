local composer=require "composer"
local scene=composer.newScene()

local scenedata=require "scenedata"
local display=display

setfenv(1, scene)

function scene:create(event)
	local cols=2
	local rows=#scenedata.files/cols
	local buttonWidth,buttonHeight=250,100
	local padding=20
	local x=display.contentCenterX-buttonWidth/2-padding/2
	local y=display.contentCenterY-(buttonHeight+padding)*rows/2+buttonHeight/2
	local topY=y

	display.newText({
		parent=scene.view,
		x=display.contentCenterX,
		y=topY-50-buttonHeight/2,
		text="Select configuration file",
		fontSize=44,
		align="center"
	})
	for i=1, #scenedata.files do
		local bg=display.newRect(scene.view,x,y,buttonWidth,buttonHeight)
		bg:setFillColor(13/255,171/255,245/255)
		display.newText({
			parent=scene.view,
			x=bg.x,
			y=bg.y,
			text=scenedata.files[i].niceName,
			fontSize=34,
			width=bg.width,
			align="center"
		})

		local file=scenedata.files[i].file
		bg:addEventListener("tap", function()
			scenedata.load(file)
			composer.gotoScene("scenes.scene")
		end)
		y=y+buttonHeight+padding
		if i==rows then
			x=x+buttonWidth+padding
			y=topY
		end
	end
end

scene:addEventListener("create")

return scene
