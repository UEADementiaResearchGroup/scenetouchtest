local M={}
emailcsv=M

local io=io
local native=native
local system=system
local assert=assert
local os=os
local tostring=tostring

setfenv(1,M)

local filename
function setDataFile(file)
  filename=file
end

function send()
  local options =
  {
    subject = "Scene Test - Results " .. os.date(),
    isBodyHtml = true,
    body = "<html><body>Scene test - results.</body></html>",
    attachment =
    {
      {baseDir=system.DocumentsDirectory,filename=filename ,type="text/csv" },
    },
  }
  assert(native.canShowPopup("mail"))
  assert(native.showPopup("mail", options))
end

return M