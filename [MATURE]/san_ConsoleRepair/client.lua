

local theCol = getElementData(root, "BlockExportCol")
	
function isInColExport ()
	if isElement(theCol) and isElementWithinColShape(localPlayer,theCol) then
		return true else return false
	end
end

function ClientExplosionCFunction()
 if isInColExport ()  then
  cancelEvent ()
 end
end
addEventHandler("onClientExplosion", root, ClientExplosionCFunction)

end , 1000, 1 )