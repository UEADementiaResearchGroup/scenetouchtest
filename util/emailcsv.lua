local M={}
emailcsv=M

local io=io
local native=native
local system=system
local assert=assert
local os=os
local tostring=tostring

setfenv(1,M)

function send()
  local options =
  {
    to = { "h.spiers@ucl.ac.uk" ,"thomas.reed.13@ucl.ac.uk","alice.iball.13@ucl.ac.uk"},
    cc = { "tap32@medschl.cam.ac.uk"},
    subject = "Scene Test - Results " .. os.date(),
    isBodyHtml = true,
    body = "<html><body>Scene test - results.</body></html>",
    attachment =
    {
      {baseDir=system.DocumentsDirectory,filename="data.csv",type="text/csv" },
    },
  }
  assert(native.canShowPopup("mail"))
  assert(native.showPopup("mail", options))
end

return M