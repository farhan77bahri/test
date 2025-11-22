local sx, sy = guiGetScreenSize()
local infoBox = {}

infoBox.show = false
infoBox.state = nil -- starting, showing, hiding
infoBox.startTick = nil
infoBox.timer = nil
infoBox.currentY = nil
infoBox.time = 1500
infoBox.startY = sy + 180
infoBox.stopY = sy - 97 - 30
infoBox.firstString = nil
infoBox.secondString =  nil

local templates = {
	{"bankrob", "Pagamento bem sucedido", ""}, -- 1
	{"bankrob", "Não há dinheiro suficiente para você", ""}, -- 1
	{"bankrob", "Você recebeu com sucesso o dinheiro da conta", ""}, -- 1
	{"bankrob", "Não há dinheiro suficiente na sua conta", ""}, -- 1

}

function showBox(template)
	if tonumber(template) then
		template = tonumber(template)
		local sound = playSound ("files/sound.wav")
		setSoundVolume (sound,0.5)

		infoBox.path = "files/" .. templates[template][1] .. ".png"
		infoBox.firstString = templates[template][2]
		infoBox.secondString = templates[template][3]
		infoBox.show = true
		infoBox.state = "starting"
		infoBox.startTick = getTickCount()
	end
end
addEvent("showBox", true)
addEventHandler("showBox", getRootElement(), showBox)

function testBox12(commandName, template)
	showBox(template)
end

--addCommandHandler("testbox", testBox12)

addEventHandler("onClientRender", getRootElement(),
	function ()
		if infoBox.show == true then
			if infoBox.state == "starting" then
				local progress = (getTickCount() - infoBox.startTick) / infoBox.time
				local intY = interpolateBetween (
					infoBox.startY,0,0,
					infoBox.stopY,0,0,
					progress,"OutElastic"
				)
				if intY then
					infoBox.currentY = intY
				else
					infoBox.currentY = 100
				end
				if progress > 1 then
					infoBox.state = "showing"
					infoBox.timer = setTimer (
						function ()
							infoBox.startTick = getTickCount()
							infoBox.state = "hiding"
						end
					,6000,1)
				end
			elseif infoBox.state == "showing" then
				infoBox.currentY = infoBox.stopY
			elseif infoBox.state == "hiding" then
				local progress = (getTickCount() - infoBox.startTick) / (infoBox.time)
				local intY = interpolateBetween (
					infoBox.stopY,0,0,
					infoBox.startY,0,0,
					progress,"Linear"
				)
				if intY then
					infoBox.currentY = intY
				else
					infoBox.currentY = 100
				end
				if progress > 1 then
					infoBox.show = false
					infoBox.state = nil
					infoBox.string = nil
					return
				end
			else
				return
			end
			local width = 360
			local x,y = sx/2 - width/2, infoBox.currentY
			local textX,textY = x+95,infoBox.currentY-10
			local textWidth,textHeight = 240,106
			dxDrawImage (x,y,width,97,infoBox.path,0,0,0,tocolor(255,255,255),true)
			if infoBox.firstString ~= false then
				dxDrawText (infoBox.firstString,textX,textY,textX+textWidth,textY+textHeight,tocolor(222,222,222),1,"default-bold","center","center",true,true,true,false,false)
			end
			--if infoBox.secondString ~= false then
			--	dxDrawText (infoBox.secondString,textX,textY+40,textX+textWidth,textY+40+textHeight,tocolor(222,222,222),1,"default-bold","center","center",true,true,true)
			--end
		end
	end
)