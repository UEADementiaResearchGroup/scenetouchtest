local M={}
scenedata=M

local jsonreader=require "util.jsonreader"
local table=table
local system=system

setfenv(1,M)

local data=jsonreader.load(system.pathForFile("data/scenes.json",system.ResourceDirectory))
function getNextSceneLayout()
  return table.remove(data,1)
end

return M