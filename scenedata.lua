local M={}
scenedata=M

local jsonreader=require "util.jsonreader"
local table=table
local system=system

setfenv(1,M)

files={
	{niceName="Memory, Stool, Wall",file="memorystoolwall.json"},
	{niceName="Memory, Wall, Stool",file="memorywallstool.json"},
	{niceName="Stool, Memory, Wall",file="stoolmemorywall.json"},
	{niceName="Stool, Wall, Memory",file="stoolwallmemory.json"},
	{niceName="Wall, Memory, Stool",file="wallmemorystool.json"},
	{niceName="Wall Stool, Memory",file="wallstoolmemory.json"},
}

for i=1, #files do
	files[i].file=system.pathForFile("data/"..files[i].file,system.ResourceDirectory)
end

local data
function load(file)
	data=jsonreader.load(file)
end

function getNextSceneLayout()
  return table.remove(data,1)
end

return M