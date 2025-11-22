--local connection = exports["ph_dbConnect"]:getConnection()
local ObjectPos = {}

function onTrafiHit(thePlayer, Penz)
	setElementData(thePlayer,"char:money",getElementData(thePlayer, "char:money") - math.floor(tonumber(Penz)))
--	exports.ph_dashboard:giveGroupBalance(29, math.floor(tonumber(Penz)))
end
addEvent("onTrafiHit", true)
addEventHandler("onTrafiHit", getRootElement(), onTrafiHit)

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

function syncSpeedCameras(x, y, z, rot,limit)
	
	local object = createObject(1337, x, y, z-1.65)
	
	setElementRotation(object, 0, 0, rot)
	object:setData("speedCamera", true)
	--object:setData("Object:Name", tostring("#87D37C"..limit.." #ffffffkm/h"))
end
addEvent("syncSpeedCameras", true)
addEventHandler("syncSpeedCameras", resourceRoot, syncSpeedCameras)


function createAmount (Player, element,amount, limit)
	outputChatBox("#22A7F0[4i20] #ffffffVocê andou mais rápido que a velocidade permitida: #22A7F0( " .. limit .." )#ffffff \nValor: #7cc576R$ ".. tonumber(amount), element,255, 255, 255, true)
end
addEvent("createAmount",true)
addEventHandler("createAmount",root,createAmount)

addCommandHandler("delradar",function(p,c)
	if getElementData(p, "acc:admin") >= 6 then
		for k,v in ipairs(getElementsByType("object")) do
			if getElementData(v,"speedCamera") then
				x,y,z = getElementPosition(p)
				x1,y2,z2 = getElementPosition(v)
				if getDistanceBetweenPoints3D(x,y,z,x1,y2,z2) <= 1.5 then
					destroyElement(v)
				end
			end
		end
	end
end)