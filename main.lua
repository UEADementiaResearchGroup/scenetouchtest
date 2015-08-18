display.setStatusBar(display.HiddenStatusBar)

require "util.csv"
local path=system.pathForFile("data.csv",system.DocumentsDirectory)
log=csv.create(path,{"time","x","y","touched","date"})
local composer=require "composer"
composer.gotoScene("scenes.scene")