local M={}
user=M

local system=system
local display=display
local native=native
local print=print
local math=math
local os=os
local table=table

setfenv(1,M)

local data={}

function setup(whenDone,force)
  local instruction=display.newText({
    text="Enter the User ID",
    fontSize=48,
  })
  instruction:translate(display.contentCenterX, display.contentCenterY-100)

  local textField
  local function textListener(event)
    if event.phase == "submitted" then
      local text=textField.text
      local function onComplete( event )
        if event.action == "clicked" then
          local i = event.index
          if i == 1 then
            return setup(whenDone,force)
          elseif i == 2 then
            data={id=text}
            whenDone(true)
          end
        end
      end

      -- Show alert with two buttons
      local alert = native.showAlert("Confirm", "Set User ID to " .. text .. ". All data will logged against this id", { "Cancel", "Okay" }, onComplete )

      instruction:removeSelf()
      textField:removeSelf()
    end
  end

 
  textField = native.newTextField(display.contentCenterX, display.contentCenterY-40, display.contentWidth-20, 50)

  textField:addEventListener("userInput", textListener)
end

function getID()
  return data.id or "test"
end

return M