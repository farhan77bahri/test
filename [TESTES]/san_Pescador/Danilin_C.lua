
local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local Font_1 = dxCreateFont("font/font.ttf", y*11)
local Font_2 = dxCreateFont("font/font1.ttf", y*11)
local Font_3 = dxCreateFont("font/fontNick.ttf", y*10)
local Font_4 = dxCreateFont("font/OpenSans-Bold.ttf", y*11)

local clientVara = {}
local clientIsca = {}
local Anim_ = {}
local move = {}
local Secure = 0
	                               --===================================--
                                   ------------ Sincronia_Vara------------
                                   --===================================--
function Iniciar_Pesca (button, state, x, y, wordx, wordy, wordz, clickedElement)
        if button == "left" and state == "down" then
		if (clientIsca[localPlayer] and not Anim_[localPlayer]) then
			if getElementData(localPlayer, "Anim_") == false then
				if getElementData(localPlayer, "DNL:Vara_Pescar") == true then
					if (isTimer(receiveTimer)) then killTimer(receiveTimer) end
					if (isTimer(flatTimer)) then killTimer(flatTimer) end
					clientIsca[localPlayer] = false
					triggerServerEvent("DNL:Criar_Isca", localPlayer, localPlayer, _, _)	
				end
			end
		elseif not (clientIsca[localPlayer]) and (getTickCount()-Secure>=2500) then 
			if getElementData(localPlayer, "Anim_") == false then
				if getElementData(localPlayer, "DNL:Vara_Pescar") == true then
					if testLineAgainstWater(wordx, wordy, wordz, wordx, wordy, wordz+500) then
						wordx, wordy, wordz = getWorldFromScreenPosition ( x, y, 20)
						if isLineOfSightClear(wordx, wordy, wordz, wordx, wordy, wordz+500) then
							Secure = getTickCount()
							triggerServerEvent("DNL:Criar_Isca", localPlayer, localPlayer, wordx, wordy)
							local randomReceive = math.random(1,10)
							if (randomReceive>4) then
								randomTime = math.random(15, 20)
							else
								randomTime = math.random(30, 90)
							end
							receiveTimer = setTimer(Tempo_Pesca_Iniciar, randomTime*1000, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onClientClick", root, Iniciar_Pesca)

function Tempo_Pesca_Iniciar ()
	if clientIsca[localPlayer] then 
		local x, y, z = getElementPosition(localPlayer)
		local tx, ty, tz = getElementPosition(clientIsca[localPlayer])
		local rotation = findRotation (x,y,tx,ty)
		if not isElement(sound) then 
			sound = playSound("Som/line_sound.mp3", true)
		else
			stopSound(sound)
			sound = playSound("Som/line_sound.mp3", true)
		end
		setElementData(localPlayer, "Anim_", true)
		setElementRotation(localPlayer, 0, 0, rotation)
		setBalanceQTEState(true, 1) -- Altere o nivel de dificuldade no "1" (1 - 5)
		triggerServerEvent("setPlayerAbimation", localPlayer, localPlayer, true ,"SWORD", "sword_IDLE")
	end
end

function givePeixe(type)
	if not type then return end
	setElementData(localPlayer, "Anim_", false)
	if isElement(sound) then stopSound(sound) end
	if type == 1 then
		clientIsca[localPlayer] = nil
		triggerServerEvent("setPlayerAbimation", localPlayer, localPlayer, false, nil, nil)
		triggerServerEvent("DNL:Criar_Isca", localPlayer, localPlayer, _, _)
		triggerEvent("addNotification", root, "#106FE7#ffffffINFO#106FE7➺ #ffffffVocê deixou o peixe escapar")
	else 
		clientIsca[localPlayer] = nil
		triggerServerEvent("setPlayerAbimation", localPlayer, localPlayer, false, nil, nil)
		triggerServerEvent("DNL:Criar_Isca", localPlayer, localPlayer, _, _)
		triggerServerEvent("DNL:Fim_Emprego", localPlayer, localPlayer)
	end
end

	                               --===============================--
                                   ------------ Line_Vara ------------
                                   --===============================--
function Line_Vara()
	for k,v in ipairs(getElementsByType("player")) do
		if (clientVara[v]) then
			local kx, ky, kz = getPositionFromElementOffset(clientVara[v], 0.015, 0.00, 0.13)
			local px, py, pz = getPositionFromElementOffset(clientVara[v], 0.015, 0.000, 2.18)
			dxDrawLine3D(kx, ky, kz, px, py, pz, tocolor(255, 255, 255, 150), 1, false)
			if (clientIsca[v]) then
				local floatX, floatY, floatZ = getElementPosition(clientIsca[v])
				if (v==getLocalPlayer()) then
					local playerX, playerY, playerZ = getElementPosition(v)
					local distance = getDistanceBetweenPoints3D(playerX, playerY, playerZ, floatX, floatY, floatZ)
					if (distance<8) then
						triggerServerEvent("DNL:Criar_Isca", localPlayer, localPlayer, _, _)
						if (isTimer(receiveTimer)) then
							killTimer(receiveTimer)
						end
						if (isTimer(flatTimer)) then
							killTimer(flatTimer)
						end
						clientIsca[v] = false
					elseif (distance>22) then
						if (isTimer(receiveTimer)) then
							killTimer(receiveTimer)
						end
						if (isTimer(flatTimer)) then
							killTimer(flatTimer)
						end
						clientIsca[v] = false
						triggerServerEvent("DNL:Criar_Isca", localPlayer, localPlayer, _, _)
					end
				end
				dxDrawLine3D(px, py, pz, floatX, floatY, floatZ, tocolor(255, 255, 255, 150), 1, false)
			end
		end
	end
end
addEventHandler("onClientRender", getRootElement(), Line_Vara)

	                               --===================================--
                                   ------------ Sincronia_Vara------------
                                   --===================================--
function Sincronia(Isca, Vara, Anim_)
	if Vara then 
		clientVara = Vara
	end
	if Isca then 
		clientIsca = Isca
	end	
	if Anim_ then 
		Anim_ = Anim_
	end
end
addEvent("DNL:Sincronia", true)
addEventHandler("DNL:Sincronia", root, Sincronia)

	                               --===============================--
                                   ------------ Move_Vara ------------
                                   --===============================--
function flatMove()
	for k,v in ipairs(getElementsByType("player")) do
		if (clientIsca[v]) then
			if not (move[v]) then
				move[v] = "-"
			end
			if (Anim_[v]) then
				count = 0.03
			else
				count = 0.007
			end
			local x, y, z = getElementPosition(clientIsca[v])
			if (move[v]=="-") then
				z = z-count
			elseif (move[v]=="+") then
				z = z+count
			end
			if (z>=0) then
				move[v] = "-"
			elseif (Anim_[v] and z<=-0.20) or (not Anim_[v] and z<=-0.05) then
				move[v] = "+"
			end
			setElementPosition(clientIsca[v], x, y, z)
		end
	end
end
setTimer(flatMove, 110, 0)

function findRotation( x1, y1, x2, y2 ) 
    local t = -math.deg( math.atan2( x2 - x1, y2 - y1 ) )
    return t < 0 and t + 360 or t
end

function getPositionFromElementOffset(element,offX,offY,offZ)
	if element then 
		local m = getElementMatrix(element)
		local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]
		local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2]
		local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3]
		return x, y, z
	end
end

	                               --=========================--
                                   ------------ TXD ------------
                                   --=========================--
addEventHandler('onClientResourceStart', resourceRoot,
function()
	txd = engineLoadTXD( "Txd/Vara.txd" )
	dff = engineLoadDFF( "Txd/Vara.dff" )
	col = engineLoadCOL( "Txd/Vara.col" )

	engineImportTXD( txd, 338 )
	engineReplaceModel( dff, 338 )
	engineReplaceCOL( col, 338 )
	setElementData(localPlayer, "DNL:Vara_Pescar", false)
end)