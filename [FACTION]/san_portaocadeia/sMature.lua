Port1 = createObject ( 2930, 1580.9165039063,-1695.0102539063,15.100037210083, -0, 0, 90.43748474121 )
--Port2 = createObject ( 2930, 1576.4260302734,-1694.9661865234,15.100037210083, -0, 0, 90.43748474121 )
setElementAlpha(Port1, 0)
--setElementAlpha(Port2, 0)


--setElementCollisionsEnabled(Port21, false)
--setElementCollisionsEnabled(Port22, false)

colPort1 = createColSphere(1581.662, -1696.106, 13.59,1)

open1 = false
--open2 = false

function gatePort1 (thePlayer)
     if isElementWithinColShape(thePlayer, colPort1) then
     local gx,gy,gz = getElementPosition(Port1)
		 if (open1 == false) then
		     moveObject (Port1, 100, 1580.9165039063,-1695.0102539063,10.100037210083)
			 triggerClientEvent(root, "gateStatus", root, "fechar", 1)
			 setElementCollisionsEnabled(Port21, true)
			 open1 = true
			 else
			 moveObject (Port1, 100, 1580.9165039063,-1695.0102539063,15.100037210083)
			 if isElement(Port21) then
			     destroyElement(Port21)
			 end
end
function enterZone (thePlayer)
	 if getElementData(thePlayer, "char:dutyfaction") == 1 or  getElementData(thePlayer, "char:dutyfaction") == 2 or  getElementData(thePlayer, "char:dutyfaction") == 3 or  getElementData(thePlayer, "char:dutyfaction") == 4 or  getElementData(thePlayer, "char:dutyfaction") == 5 or  getElementData(thePlayer, "char:dutyfaction") == 6 or  getElementData(thePlayer, "char:dutyfaction") == 8 or  getElementData(thePlayer, "char:dutyfaction") == 9 or  getElementData(thePlayer, "char:dutyfaction") == 10 or  getElementData(thePlayer, "char:dutyfaction") == 11 or  getElementData(thePlayer, "char:dutyfaction") == 12 or  getElementData(thePlayer, "char:dutyfaction") == 13 or  getElementData(thePlayer, "char:dutyfaction") == 14 or  getElementData(thePlayer, "char:dutyfaction") == 15 then
	     setElementData(thePlayer, "zoneInfo2", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort2, enterZone)

function exitZone (thePlayer)
	 if getElementData(thePlayer, "char:dutyfaction") == 1 or  getElementData(thePlayer, "char:dutyfaction") == 2 or  getElementData(thePlayer, "char:dutyfaction") == 3 or  getElementData(thePlayer, "char:dutyfaction") == 4 or  getElementData(thePlayer, "char:dutyfaction") == 5 or  getElementData(thePlayer, "char:dutyfaction") == 6 or  getElementData(thePlayer, "char:dutyfaction") == 8 or  getElementData(thePlayer, "char:dutyfaction") == 9 or  getElementData(thePlayer, "char:dutyfaction") == 10 or  getElementData(thePlayer, "char:dutyfaction") == 11 then
	     setElementData(thePlayer, "zoneInfo2", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort2, exitZone)
--[[

function enterZone2 (thePlayer)
	 if getElementData(thePlayer, "char:dutyfaction") == 11 or  getElementData(thePlayer, "char:dutyfaction") == 5 then
	     setElementData(thePlayer, "zoneInfo", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort1, enterZone2)

function exitZone2 (thePlayer)
	 if getElementData(thePlayer, "char:dutyfaction") ==  11 or  getElementData(thePlayer, "char:dutyfaction") == 5 then
	     setElementData(thePlayer, "zoneInfo", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort1, exitZone2)
]]--

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



local con = exports.san_mysql:getConnection()
	end
end