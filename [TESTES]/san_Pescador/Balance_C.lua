local sx,sy = guiGetScreenSize()
local qte = {}
qte.balance = {}
qte.balance.state = false
qte.balance.difficulty = 1
qte.balance.rot = 0
qte.balance.keyType = nil
qte.balance.dir = nil
qte.balance.a = 0
qte.balance.accMult = 1
qte.balance.progressGui={}
qte.balance.progressTime = 100
qte.balance.beginTick = 0
qte.balance.tick = 0
qte.balance.timer = nil

function setBalanceQTEState(state,difficulty)
	if state and difficulty then
		qte.balance.beginTick = getTickCount()
		setElementFrozen(getLocalPlayer(),true)
		qte.balance.state = true
		qte.balance.difficulty = difficulty
		qte.balance.a = 0
		qte.balance.accMult = 1
		qte.balance.dir = nil
		qte.balance.keyType = nil
		local rand = math.random(0,1)
		local startAcc = (qte.balance.difficulty==1 and 0.1 or 0.2)
		qte.balance.rot = (rand==0 and -10 or 10)
		qte.balance.a = (rand==0 and -startAcc or startAcc)
		toggleControl("left",false)
		toggleControl("right",false)
		bindKey("a","both",balanceQTEMoveHandler)
		bindKey("arrow_l","both",balanceQTEMoveHandler)
		bindKey("d","both",balanceQTEMoveHandler)
		bindKey("arrow_r","both",balanceQTEMoveHandler)
		createProgressBar(qte.balance.difficulty==1 and 5 or 6)
	else
		toggleControl("left",true)
		toggleControl("right",true)
		unbindKey("a","both",balanceQTEMoveHandler)
		unbindKey("arrow_l","both",balanceQTEMoveHandler)
		unbindKey("d","both",balanceQTEMoveHandler)
		unbindKey("arrow_r","both",balanceQTEMoveHandler)
		qte.balance.state = false
		setElementFrozen(getLocalPlayer(),false)
	end
end

function balanceQTEMoveHandler(key,state)
	if state=="down" then
		if not qte.balance.dir then
			if key=="a" or key=="arrow_l" then
				qte.balance.keyType = key
				qte.balance.dir = -0.3*(qte.balance.accMult)
			elseif key=="d" or key=="arrow_r" then
				qte.balance.keyType = key
				qte.balance.dir = 0.3*(qte.balance.accMult)
			end
			qte.balance.accMult = qte.balance.accMult + 0.1
		end
	elseif state=="up" then
		if qte.balance.dir and qte.balance.keyType==key then
			qte.balance.dir = nil
			qte.balance.keyType = nil
		end
	end
end

function balanceQTEFail()
	setBalanceQTEState(false)
	givePeixe(1)
	if qte.balance.timer then
		if isTimer(qte.balance.timer) then
			killTimer(qte.balance.timer)
		end
		removeEventHandler("onClientRender",getRootElement(),renderProgressGui)
		qte.balance.timer = nil
	end	
end

local imgData = {}
imgData.w = 512
imgData.h = 512
imgData.x = sx/2-imgData.w/2
imgData.y = sy/2-imgData.h/2
addEventHandler("onClientRender",getRootElement(),function()
	if qte.balance.state then
		dxDrawImage(imgData.x,imgData.y,imgData.w,imgData.h,"Img/arch.png")
		dxDrawImage(imgData.x,imgData.y,imgData.w,imgData.h,"Img/pointer.png",qte.balance.rot)
		if getTickCount()-qte.balance.beginTick>1000 then
			if math.abs(qte.balance.rot)<58 then
				if qte.balance.dir then
					qte.balance.a = qte.balance.a + qte.balance.dir*(qte.balance.difficulty==1 and 0.6 or 1)
				end
				qte.balance.a = qte.balance.a + qte.balance.rot/(800-200*qte.balance.accMult)
				qte.balance.rot = qte.balance.rot + qte.balance.a
				
				if qte.balance.rot==0 then
					local rand = math.random(0,1)
					qte.balance.rot = (rand==0 and -1 or 1)
				end
			else
				balanceQTEFail()
			end
		end
	end
end)

function createProgressBar(progressTime)
	qte.balance.progressTime = progressTime*1000
	qte.balance.tick = getTickCount()
	qte.balance.progressGui.width = 512
	qte.balance.progressGui.height = 64
	qte.balance.progressGui.barStartX = 120
	qte.balance.progressGui.barWidth = 268
	qte.balance.progressGui.barRealY = 47
	qte.balance.progressGui.barRealHeight = 22
	qte.balance.progressGui.nameX,qte.balance.progressGui.nameY = 60,19
	qte.balance.progressGui.priceX = 459
	qte.balance.progressGui.infoY = 78
	qte.balance.progressGui.chooseY = 95
	
	addEventHandler("onClientRender",getRootElement(),renderProgressGui)
	qte.balance.timer = setTimer(function()
	removeEventHandler("onClientRender",getRootElement(),renderProgressGui)
	setBalanceQTEState(false)
	givePeixe(2)
	end,progressTime*1000,1)
end

function renderProgressGui()
	local alpha = 255
	local currentX = sx/2-qte.balance.progressGui.width/2
	local currentY = 400
	local progress = (getTickCount()-qte.balance.tick)/qte.balance.progressTime
	local fuelFullWidth = interpolateBetween(qte.balance.progressGui.barStartX,0,0,qte.balance.progressGui.barStartX+qte.balance.progressGui.barWidth,0,0,progress,"Linear")
	local fuelEmptyWidth = qte.balance.progressGui.width - fuelFullWidth
	local fuelEmptyX = qte.balance.progressGui.width - fuelEmptyWidth
	
	dxDrawImageSection(currentX,currentY,fuelFullWidth,qte.balance.progressGui.height,0,0,fuelFullWidth,qte.balance.progressGui.height,"Img/pasekon.png",0,0,0,tocolor(255,255,255,alpha))
	dxDrawImageSection (currentX+fuelEmptyX,currentY,fuelEmptyWidth,qte.balance.progressGui.height,fuelEmptyX,0,fuelEmptyWidth,qte.balance.progressGui.height,"Img/pasekoff.png",0,0,0,tocolor(255,255,255,alpha))
end
