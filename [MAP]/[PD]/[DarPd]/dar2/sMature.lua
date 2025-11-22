Port1 = createObject ( 2930, 1877.6337890625 - 0.9 , -1644.8110351562 + 0.1, 16.06524,-0, 0, 90 )
Port2 = createObject (2930, 1880.8758544922 , -1654.7614746094 + 0.6, 16.05614471,-0, 0, 0  )
Port3 = createObject (2930, 1880.8758544922 , -1649.997802734 + 0.8, 17.05614471,-0, 0, 0  )
Port4 = createObject (2930, 1880.8758544922 ,  -1648.6124267578 + 1.1, 17.05614471,-0, 0, 0  )
Port5 = createObject (2930,1876.2116699219 - 1.05, -1658.7001953125 - 0.1, 17.069646835327,-0, 0, 90  )
Port6 = createObject (2930, 1876.2116699219 + 0.75, -1658.7001953125 - 0.1, 17.069646835327,-0, 0, 90  )
Port7 = createObject (2930, 1873.1237792969, -1663.7081298828 +1, 16.977077484131,-0, 0, 0  )
Port8 = createObject (2930, 1873.1237792969, -1663.7081298828 -0.8, 16.977077484131,-0, 0, 0  )
Port9 = createObject (2930, 1895.2786865234+0.1, -1649.6213378906+1, 9.9130172729492+1.5 ,-0, 0, 0  )
Port10 = createObject (2930, 1895.2786865234+0.15,  -1654.592651367+0.92, 9.9130172729492+1.5 ,-0, 0, 0  )
Port11 = createObject (2930, 1895.2786865234+0.15,   -1659.669311+0.99, 9.9130172729492+1.5 ,-0, 0, 0  )



setElementAlpha(Port1, 0)
setElementAlpha(Port2, 0)
setElementAlpha(Port3, 0)
setElementAlpha(Port4, 0)
setElementAlpha(Port5, 0)
setElementAlpha(Port6, 0)
setElementAlpha(Port7, 0)
setElementAlpha(Port8, 0)


--------------------Justice
P1 = createObject (2930, 1656.0335693359-0.8, -1352.6430664062, 17.590625762939+1.5 ,-0, 0, 90  )
setElementAlpha(P1, 0)

--Port21 = createObject ( 1502, 1571.1127929688, -1676.6706298828, 15.395323944, -0, 0, 89.700416564941 )
Port21 = createObject ( 1499, 1877.6337890625 - 0.9, -1644.8110351562 + 0.1, 15.06524,  -0, 0, 0 )
Port22 = createObject ( 1499, 1880.8758544922, -1654.7614746094 -0.7, 15.05614471,  -0, 0, 90.6627502441 )
Port33 = createObject ( 1499, 1880.8758544922,  -1649.9978027344 -0.8, 15.05614471,  -0, 0, 90.6627502441 )
Port44 = createObject ( 1499, 1880.8758544922,  -1648.6124267578 + 0.85, 15.05614471,  -0, 0, -90.6627502441 )
Port55 = createObject ( 1499, 1876.2116699219 - 0.8, -1658.7001953125 - 0.1, 15.069646835327,  -0, 0, 0 )
Port66 = createObject ( 1499, 1876.2116699219 + 2.2, -1658.7001953125 - 0.1, 15.069646835327,  -0, 0, 180 )
Port77 = createObject ( 1499, 1873.1237792969, -1663.7081298828 + 0.79, 14.977077484131,  -0, 0, -90 )
Port88 = createObject ( 1499, 1873.1237792969, -1663.7081298828 - 2.23, 14.977077484131,  -0, 0, 90 )
P11 = createObject ( 1499, 1656.0335693359-0.67, -1352.6430664062-0.1, 17.590625762939-1,  -0, 0, 0 )
--Port99 = createObject ( 1499, 1895.2786865234+0.1, -1649.6213378906- 0.64, 9.9130172729492-1,  -0, 0, 90 )
setElementCollisionsEnabled(Port21, false)
setElementCollisionsEnabled(Port22, false)
setElementCollisionsEnabled(Port33, false)
setElementCollisionsEnabled(Port44, false)
setElementCollisionsEnabled(Port55, false)
setElementCollisionsEnabled(Port66, false)
setElementCollisionsEnabled(Port77, false)
setElementCollisionsEnabled(Port88, false)
setElementCollisionsEnabled(P11, false)

colPort1 =  createColSphere(1877.6337890625, -1644.8110351562, 16.06524,1)
colPort2 = createColSphere(1880.3992919922, -1654.767578125, 16.057514190674,1)
colPort3 = createColSphere( 1880.5057373047, -1650.23046875, 16.057106018066 ,1)
colPort4 = createColSphere(1880.1165771484 + 0.3, -1648.5596923828, 16.05818939209 , 1)
colPort5 = createColSphere(1876.1378173828, -1658.4467773438, 16.069854736328,1.2)
colPort6 = createColSphere(1877.4865722656, -1658.4467773438, 16.058368682861,1.2)
colPort7 = createColSphere(1873.1501464844, -1663.6467285156, 15.97700214386,1.2)
colPort8 = createColSphere(1873.4571533203, -1665.1419677734, 15.976150512695,1.2)
colPort9 = createColSphere(1894.5936279297, -1649.6899414062, 9.9149885177612,1.2)
colPort10 = createColSphere(1894.7181396484, -1654.5927734375, 9.9147396087646,1.2)
colPort11 = createColSphere(1894.8646240234, -1659.5842285156, 9.914430618286,1.2)
colPort111 = createColSphere(1656.2687988281, -1353.06640625, 17.596460342407,1.2)

open1 = false
open2 = false
---------------dar1
function gatePort1 (thePlayer)
     if isElementWithinColShape(thePlayer, colPort1) then
     local gx,gy,gz = getElementPosition(Port1)
		 if (open1 == false) then
		     moveObject (Port1, 100, 1877.6337890625 - 0.9 , -1644.8110351562 + 0.1, 16.06524 - 10)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 1)
			 setElementCollisionsEnabled(Port21, true)
			 open1 = true
			 else
			 moveObject (Port1, 100, 1877.6337890625 - 0.9 , -1644.8110351562 + 0.1, 16.06524)
			 if isElement(Port21) then
			     destroyElement(Port21)
			 end
			 Port21 = createObject ( 1499, 1877.6337890625 - 0.9, -1644.8110351562 + 0.1, 15.06524,  -0, 0, 0)
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 1)
			 setElementCollisionsEnabled(Port21, false)
			 open1 = false
		 end
	 end
	 ------------dar2
     if isElementWithinColShape(thePlayer, colPort2) then
     local gx,gy,gz = getElementPosition(Port2)
		 if (open2 == false) then
		    moveObject (Port2, 100, 1880.8758544922 , -1654.7614746094 + 0.6, 16.05614471 - 10)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 2)
			 setElementCollisionsEnabled(Port22, true)
			 open2 = true
			 else
			 moveObject (Port2, 100, 1880.8758544922 , -1654.7614746094 + 0.6, 16.05614471)
			 if isElement(Port22) then
			     destroyElement(Port22)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 2)
			 Port22 = createObject (  1499, 1880.8758544922, -1654.7614746094 -0.7, 15.05614471,  -0, 0, 90.6627502441 )
			 setElementCollisionsEnabled(Port22, false)
			 open2 = false
		 end
	 end
	 ----------------dar3
	 if isElementWithinColShape(thePlayer, colPort3) then
     local gx,gy,gz = getElementPosition(Port3)
		 if (open2 == false) then
		    moveObject (Port3, 100, 1880.8758544922 , -1649.997802734 + 0.6, 16.05614471 - 10)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 3)
			 setElementCollisionsEnabled(Port33, true)
			 open2 = true
			 else
			 moveObject (Port3, 100, 1880.8758544922 , -1649.997802734 + 0.6, 17.05614471)
			 if isElement(Port33) then
			     destroyElement(Port33)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 3)
			 Port33 = createObject (  1499, 1880.8758544922,  -1649.9978027344 -0.8, 15.05614471,  -0, 0, 90.6627502441 )
			 setElementCollisionsEnabled(Port33, false)
			 open2 = false
		 end
	 end
	 
	 
	  ----------------dar4
	 if isElementWithinColShape(thePlayer, colPort4) then
     local gx,gy,gz = getElementPosition(Port4)
		 if (open2 == false) then
		    moveObject (Port4, 100, 1880.8758544922 ,  -1648.6124267578 + 1.1, 17.05614471 - 10)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 4)
			 setElementCollisionsEnabled(Port44, true)
			 open2 = true
			 else
			 moveObject (Port4, 100, 1880.8758544922 ,  -1648.6124267578 + 1.1, 17.05614471)
			 if isElement(Port44) then
			     destroyElement(Port44)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 4)
			 Port44 = createObject (  1499, 1880.8758544922,  -1648.6124267578 + 0.85, 15.05614471,  -0, 0, -90.6627502441 )
			 setElementCollisionsEnabled(Port44, false)
			 open2 = false
		 end
	 end
	 
	   ----------------dar5
	 if isElementWithinColShape(thePlayer, colPort5) then
     local gx,gy,gz = getElementPosition(Port5)
		 if (open2 == false) then
		    moveObject (Port5, 100, 1876.2116699219 - 1.05, -1658.7001953125 - 0.1, 17.069646835327 - 10)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 5)
			 setElementCollisionsEnabled(Port55, true)
			 open2 = true
			 else
			 moveObject (Port5, 100, 1876.2116699219 - 1.05, -1658.7001953125 - 0.1, 17.069646835327)
			 if isElement(Port55) then
			     destroyElement(Port55)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 5)
			 Port55 = createObject (  1499, 1876.2116699219 - 0.8, -1658.7001953125 - 0.1, 15.069646835327,  -0, 0, 0 )
			 setElementCollisionsEnabled(Port55, false)
			 open2 = false
		 end
	 end
	 
	 
	   ----------------dar6
	 if isElementWithinColShape(thePlayer, colPort6) then
     local gx,gy,gz = getElementPosition(Port6)
		 if (open2 == false) then
		    moveObject (Port6, 100, 1876.2116699219 + 0.75, -1658.7001953125 - 0.1, 17.069646835327 - 10)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 6)
			 setElementCollisionsEnabled(Port66, true)
			 open2 = true
			 else
			 moveObject (Port6, 100, 1876.2116699219 + 0.75, -1658.7001953125 - 0.1, 17.069646835327)
			 if isElement(Port66) then
			     destroyElement(Port66)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 6)
			 Port66 = createObject (  1499, 1876.2116699219 + 2.2, -1658.7001953125 - 0.1, 15.069646835327,  -0, 0, 180 )
			 setElementCollisionsEnabled(Port66, false)
			 open2 = false
		 end
	 end
	 
	    ----------------dar7
	 if isElementWithinColShape(thePlayer, colPort7) then
     local gx,gy,gz = getElementPosition(Port7)
		 if (open2 == false) then
		    moveObject (Port7, 100,  1873.1237792969, -1663.7081298828 +1, 16.977077484131 - 10)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 7)
			 setElementCollisionsEnabled(Port77, true)
			 open2 = true
			 else
			 moveObject (Port7, 100,  1873.1237792969, -1663.7081298828 +1, 16.977077484131)
			 if isElement(Port77) then
			     destroyElement(Port77)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 7)
			 Port77 = createObject (  1499, 1873.1237792969, -1663.7081298828 + 0.79, 14.977077484131,  -0, 0, -90  )
			 setElementCollisionsEnabled(Port77, false)
			 open2 = false
		 end
	 end
	 
	 
	    ----------------dar8
	 if isElementWithinColShape(thePlayer, colPort8) then
     local gx,gy,gz = getElementPosition(Port8)
		 if (open2 == false) then
		    moveObject (Port8, 100, 1873.1237792969, -1663.7081298828 -0.8, 16.977077484131 - 10)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 8)
			 setElementCollisionsEnabled(Port88, true)
			 open2 = true
			 else
			 moveObject (Port8, 100, 1873.1237792969, -1663.7081298828 -0.8, 16.977077484131)
			 if isElement(Port88) then
			     destroyElement(Port88)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 8)
			 Port88 = createObject (  1499, 1873.1237792969, -1663.7081298828 - 2.23, 14.977077484131,  -0, 0, 90)
			 setElementCollisionsEnabled(Port88, false)
			 open2 = false
		 end
	 end
	 
	     ----------------dar9
	 if isElementWithinColShape(thePlayer, colPort9) then
     local gx,gy,gz = getElementPosition(Port9)
		 if (open2 == false) then
		    moveObject (Port9, 200, 1895.2786865234+0.1, -1649.6213378906+1, 9.9130172729492 -1)
			 triggerClientEvent(root, "gateStatus", root, "(Open)", 9)
			 --setElementCollisionsEnabled(Port88, true)
			 open2 = true
			 else
			 moveObject (Port9, 200, 1895.2786865234+0.1, -1649.6213378906+1, 9.9130172729492+1.5)
			 --if isElement(Port88) then
			--     destroyElement(Port88)
			-- end
			 triggerClientEvent(root, "gateStatus", root, "(Close)", 9)
			-- Port88 = createObject (  1499, 1873.1237792969, -1663.7081298828 - 2.23, 14.977077484131,  -0, 0, 90)
			-- setElementCollisionsEnabled(Port88, false)
			 open2 = false
		 end
	 end
	    ----------------dar10
	 if isElementWithinColShape(thePlayer, colPort10) then
     local gx,gy,gz = getElementPosition(Port10)
		 if (open2 == false) then
		    moveObject (Port10, 200, 1895.2786865234+0.15,  -1654.592651367+0.92, 9.9130172729492 -1)
			 triggerClientEvent(root, "gateStatus", root, "(Open)", 10)
			 --setElementCollisionsEnabled(Port88, true)
			 open2 = true
			 else
			 moveObject (Port10, 200, 1895.2786865234+0.15,  -1654.592651367+0.92, 9.9130172729492+1.5)
			 --if isElement(Port88) then
			--     destroyElement(Port88)
			-- end
			 triggerClientEvent(root, "gateStatus", root, "(Close)", 10)
			-- Port88 = createObject (  1499, 1873.1237792969, -1663.7081298828 - 2.23, 14.977077484131,  -0, 0, 90)
			-- setElementCollisionsEnabled(Port88, false)
			 open2 = false
		 end
	 end
	    ----------------dar11
	 if isElementWithinColShape(thePlayer, colPort11) then
     local gx,gy,gz = getElementPosition(Port11)
		 if (open2 == false) then
		    moveObject (Port11, 200, 1895.2786865234+0.15,   -1659.669311+0.99, 9.9130172729492 -1)
			 triggerClientEvent(root, "gateStatus", root, "(Open)", 11)
			 --setElementCollisionsEnabled(Port88, true)
			 open2 = true
			 else
			 moveObject (Port11,200, 1895.2786865234+0.15,-1659.669311 +0.99, 9.913 +1.5)
			 --if isElement(Port88) then
			--     destroyElement(Port88)
			-- end
			 triggerClientEvent(root, "gateStatus", root, "(Close)", 11)
			-- Port88 = createObject (  1499, 1873.1237792969, -1663.7081298828 - 2.23, 14.977077484131,  -0, 0, 90)
			-- setElementCollisionsEnabled(Port88, false)
			 open2 = false
		 end
	 end

-------Justice

   ----------------dar12
	 if isElementWithinColShape(thePlayer, colPort111) then
     local gx,gy,gz = getElementPosition(P1)
		 if (open2 == false) then
		    moveObject (P1, 100, 1656.0335693359-0.8, -1352.6430664062, 17.590625762939- 2)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 12)
			 setElementCollisionsEnabled(P11, true)
			 open2 = true
			 else
			 moveObject (P1, 100, 1656.0335693359-0.8, -1352.6430664062, 17.590625762939+1.5)
			 if isElement(P11) then
			     destroyElement(P11)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 12)
			 P11 = createObject (  1499, 1656.0335693359-0.67, -1352.6430664062-0.1, 17.590625762939-1,  -0, 0, 0)
			 setElementCollisionsEnabled(P11, false)
			 open2 = false
		 end
	 end
	 end
function enterZone (thePlayer)
	 --if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then
		if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then

		setElementData(thePlayer, "zoneInfo2", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort2, enterZone)

function exitZone (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then
if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo2", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort2, exitZone)


function enterZone2 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort1, enterZone2)

function exitZone2 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort1, exitZone2)



--------dar3

function enterZone3 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo3", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort3, enterZone3)

function exitZone3 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo3", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort3, exitZone3)


--------dar4

function enterZone4 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo4", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort4, enterZone4)

function exitZone4 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo4", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort4, exitZone4)



--------dar5

function enterZone5 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo5", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort5, enterZone5)

function exitZone5 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo5", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort5, exitZone5)



--------dar6

function enterZone6 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo6", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort6, enterZone6)

function exitZone6 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo6", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort6, exitZone6)



--------dar7

function enterZone7 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo7", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort7, enterZone7)

function exitZone7 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo7", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort7, exitZone7)



--------dar8

function enterZone8 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo8", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort8, enterZone8)

function exitZone8 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo8", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort8, exitZone8)


--------dar9

function enterZone9 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo9", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort9, enterZone9)

function exitZone9 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo9", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort9, exitZone9)




--------dar10

function enterZone10 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo10", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort10, enterZone10)

function exitZone10 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo10", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort10, exitZone10)



--------dar11

function enterZone11 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo11", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort11, enterZone11)

function exitZone11 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo11", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort11, exitZone11)




--------dar12

function enterZone12 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 3) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo12", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort111, enterZone12)

function exitZone12 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 3) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo12", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort111, exitZone12)


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



local con = exports.san_mysql:getConnection()




function prendendo(thePlayer, targetPlayer, timerP, reason)
	local reason = table.concat({reason}, " ")
    if getElementData(targetPlayer, "VIP") then
	     ido = tonumber(timerP) / 2
		 ido = math.floor(ido)
	else
	     ido = tonumber(timerP)
	end
	setElementData(targetPlayer, "player:preso", true)
	if getElementData(targetPlayer, "VIP") then
	outputChatBox("#dc143c[Departamento de policia]:#7cc576 " .. getPlayerName(thePlayer) .. "#ffffff Prendeu #7cc576" .. getPlayerName(targetPlayer) .. " #ffffffpor #1a75ff" .. ido .. "#ffffff anos.", root ,255, 255, 255, true)
	outputChatBox("#dc143c[Decreto]:#7cc576 Pelo fato do preso ser VIP a sentença foi alterada: #dc143c(#ffffff"..tonumber(timerP).." anos #ffffffpara " .. ido .. " anos#dc143c)", root ,255, 255, 255, true)
	outputChatBox("#dc143c[Departamento de policia]:#7cc576 Motivo:#ffffff Os artigos do preso se encontram em sigilo.", root ,255, 255, 255, true)
	else
	outputChatBox("#dc143c[Departamento de policia]:#7cc576 " .. getPlayerName(thePlayer) .. "#ffffff Prendeu #7cc576" .. getPlayerName(targetPlayer) .. " #ffffffpor #1a75ff" .. ido .. "#ffffff anos.", root ,255, 255, 255, true)
	outputChatBox("#dc143c[Departamento de policia]:#7cc576 Motivo:#ffffff " .. reason, root ,255, 255, 255, true)
	end

	takeAllWeapons(targetPlayer)
	if exports['btc_items']:hasItemS(targetPlayer, 38) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 38, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 32) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 32, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 64) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 64, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 84) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 84, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 52) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 52, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 50) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 50, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 49) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 49, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 44) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 44, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 51) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 51, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 53) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 53, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 44) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 44, 0)
	end		
	if exports['btc_items']:hasItemS(targetPlayer, 125) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 125, 0)
	end		
	local theTimerCheck = getElementData(targetPlayer, "adminjail:theTimer")
	local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")
	if isTimer(theTimerCheck) then
		killTimer(theTimerCheck)
	end
	if isTimer(theTimerCheck2) then
		killTimer(theTimerCheck2)
	end
	if isPedInVehicle(targetPlayer) then
		removePedFromVehicle(targetPlayer)
	end
	setElementData(targetPlayer, "player:preso", true)
	fadeCamera(targetPlayer, false, 1.0)
	setElementFrozen(targetPlayer, true)
	if isPedInVehicle(targetPlayer) then
		toggleAllControls(targetPlayer, false, false, false)
	end
	if (getElementData(targetPlayer, "algemado")) then
	     setElementData(targetPlayer, "algemado", false)
	end
	setTimer(function()
		triggerClientEvent(targetPlayer, "triggerAdminjail", targetPlayer, thePlayer, reason, ido, 1, false)
	end, 500, 1)
	setTimer( function()
		local idoTelik = setTimer(idoTelikLe, 60000, ido, targetPlayer)
		local theTimer = setElementData(targetPlayer, "adminjail:theTimer", idoTelik)
		local idoTelikMentes = setElementData(targetPlayer, "idoTelik", ido)
		local idoLetelt = setElementData(targetPlayer, "idoLetelt", 0)
		setElementPosition(targetPlayer, 1571.6392822266, -1692.9930419922, 13.589937210083)
		setElementInterior(targetPlayer, 0)
		setElementDimension(targetPlayer, 0)
		local adminjailed = setElementData(targetPlayer, "adminjail", 1)
		local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", reason)
		local alapido = setElementData(targetPlayer, "adminjail:ido", ido)
		local admin = setElementData(targetPlayer, "adminjail:admin", getPlayerName(thePlayer))
		local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", getPlayerSerial(thePlayer))
	end, 1500, 1)
	local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 1, reason, ido, ido, getPlayerName(thePlayer), getPlayerSerial(thePlayer))

					
	setTimer(function()
		fadeCamera(targetPlayer, true, 2.5)
		setElementFrozen(targetPlayer, false)
		toggleAllControls(targetPlayer, true, true, true)
	end, 7500, 1)
end
addEvent ("prendendo",true)
addEventHandler ("prendendo", root,  prendendo)



function idoTelikLe(targetPlayer)
	if isElement(targetPlayer) and (getElementType(targetPlayer) == "player") then
		local idoTelik = tonumber(getElementData(targetPlayer, "idoTelik")) or false
		local idoLetelt = tonumber(getElementData(targetPlayer, "idoLetelt")) or false
		if (idoTelik) and (idoLetelt) then
			setElementData(targetPlayer, "idoTelik", idoTelik-1)
			setElementData(targetPlayer, "idoLetelt", idoLetelt+1)
			if (idoTelik) <= 1 then
				outputChatBox("Sua sentença expirou e Você foi solto!.", targetPlayer, 255, 255, 255, true)
				setElementData(targetPlayer, "player:preso", false)
				local theTimer = getElementData(targetPlayer, "adminjail:theTimer")
				if not (theTimer) then
					return false
				end
				--killTimer(theTimer)
							if (theTimerCheck) then
								killTimer(theTimerCheck)
								setElementData(targetPlayer, "adminjail:timer", false)
							end
							if (theTimerCheck2) then
								killTimer(theTimerCheck2)
								setElementData(targetPlayer, "adminjail:theTimerAccounts", false)
							end	
				setElementData(targetPlayer, "adminjail:theTimer", false)
				local adminjailed = setElementData(targetPlayer, "adminjail", false)
				local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", false)
				local alapido = setElementData(targetPlayer, "adminjail:ido", false)
				local admin = setElementData(targetPlayer, "adminjail:admin", false)
				local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", false)
				local idoTelikVege = setElementData(targetPlayer, "idoTelik", false)
				local idoLeteltVege = setElementData(targetPlayer, "idoLetelt", false)
				local setPosition = setTimer(setElementPosition, 2000, 1,targetPlayer, 1580.5162353516, -1683.5106201172, 14.996187210083)
				local setInterior = setElementInterior(targetPlayer, 0)
				local setDimension = setElementDimension(targetPlayer, 0)

								--sql
								local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 0, false, false, false, false, false)

								
			end
		end
	end
end

local prision = createColCuboid(1569.07898, -1695.11023, 12.58994, 13.476196289063, 4.4530029296875, 4.0000003814697)

function exitZ (thePlayer)
     if (getElementData(thePlayer, "player:preso")) then
         outputChatBox("#FFA000*BTC ERROR #FFFFFFVocê ainda está preso!, Aguarde.", thePlayer, 255,255,255, true)
		 setElementPosition(thePlayer, 1571.615, -1692.737, 13.59)
	 end
end
addEventHandler("onColShapeLeave", prision, exitZ)