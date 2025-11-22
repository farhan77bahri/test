---------------------------------------->>
-- Grand Theft International (GTI)
-- Author: Mitch
-- Date: 11 Feb 2015
-- Resource: storeRob_c.lua
-- Version: 1.0
----------------------------------------->>

addEvent("onClientInteriorExit",true)

colShapeDerFix = createColCuboid ( 251.714, -81.700, 0.578, 12, 19, 10 )

local theRobbery = false
local robCashRegister = false
local robberyStarted = false
local hasBag = false
local cancelRobb = false
local intLeave = false

local peds = {
{createPed ( 303,  1310.6231689453, -896.85455322266, 39.62656402587, 268), 0, 0},
{createPed ( 303, 1357.3768310547, -1761.5120849609, 13.626562118, 90 ), 0, 0 },
{createPed ( 303, 2344.9230957031, -1371.6539306641, 24.026561737061, 268 ), 0, 0 },
{createPed ( 179, 0, 0, 0, 180 ), 0, 0 },

}

local cashRegister = {
--[[
{createObject ( 1514, -2235.574, 129.407, 1035.700, 0, 0, 180 ), 0, 6, 180 },
{createObject ( 1514, 497.646, -76.722, 999.005, 0, 0, 180 ), 1, 11, 180},
{createObject ( 1514, -23.386, -56.597, 1003.706, 0, 0, 180 ), 1, 6, 0 },
{createObject ( 1514, -28.338, -90.706, 1003.706, 0, 0, 180 ), 1, 18, 0 },
{createObject ( 1514, -28.338, -90.706, 1003.706, 0, 0, 180 ), 0, 18, 0 },
{createObject ( 1514, -23.395, -56.484, 1003.706, 0, 0, 180 ), 4, 6, 0 },
{createObject ( 1514, -28.338, -90.706, 1003.706, 0, 0, 180 ), 2, 18, 0 },
{createObject ( 1514, -23.395, -56.484, 1003.706, 0, 0, 180 ), 3, 6, 0 },
]]--
--{createObject (  1514,  1376.6236572266, -1745.3779296875, 13.60000038147, 0, 0, 0 ), 0, 0, 0 },
--{createObject ( 1514, -1559.773, -2730.774, 48.895, 0, 0, 140 ), 0, 0, 0 },
--{createObject ( 1514, 1836.306, -1837.925, 13.741, 0, 0, 90 ), 0, 0, 0 },
--{createObject ( 1514, 1316.697, -895.876, 39.624, 0, 0, 180 ), 0, 0, 0 },
--{createObject ( 1514, 251.762, -55.555, 1.679, 0, 0, 0 ), 0, 0, 0 },
}

local markers = {
{ 1310.6231689453, -896.85455322266, 39.62656402587},
{1312.2194824219, -896.91204833984, 39.626564025879},
{1357.3768310547, -1761.5120849609, 13.626562118},
{1355.78125, -1761.5341796875, 13.62656211853},
{2344.9230957031, -1371.6539306641, 24.026561737061},
{2346.8095703125, -1372.1140136719, 24.026561737061},
{2437.921, 2065.402, 9.820},
{2420.3723144531, -1509.0484619141, 24},
}

function respawnCashRegisters ( )
    for k,v in ipairs ( cashRegister ) do
		setTimer (respawnObject, 7500, 1, ( v[1] ) )
	end
end
addEventHandler ("onClientObjectBreak", root, respawnCashRegisters )

function secsToMin(seconds)
        local hours = 0
        local minutes = 0
        local secs = 0
        local theseconds = seconds
        if theseconds >= 60*60 then
            hours = math.floor(theseconds / (60*60))
            theseconds = theseconds - ((60*60)*hours)
        end
        if theseconds >= 60 then
            minutes = math.floor(theseconds / (60))
            theseconds = theseconds - ((60)*minutes)
        end
        if theseconds >= 1 then
            secs = theseconds
        end 
        if minutes < 10 then
            minutes = "0"..minutes
        end
        if secs < 10 then
            secs = "0"..secs
        end
    return minutes,secs
end

local Loja1 = createBlip( 1312.2194824219, -896.91204833984, 39.626564025879, 58)
setElementData(Loja1 ,"blip >> name", "Rob-Shop 01")

local Loja2 = createBlip(1355.78125, -1761.5341796875, 13.62656211853, 58)
setElementData(Loja2 ,"blip >> name", "Rob-Shop 02")

local Loja3 = createBlip(2346.8095703125, -1372.1140136719, 24.026561737061, 58)
setElementData(Loja3 ,"blip >> name", "Rob-Shop 03")


-- Marker and ped functions
function createMarkers ( )

for k,v in ipairs(peds) do 
    local x, y, z = getElementPosition(v[1])
  --  createBlip ( x, y, z, 53, 1, 0, 0, 0, 0, 0, 1000 )
end
end
addEventHandler ("onClientResourceStart", resourceRoot, createMarkers )


function breakCashRegister ( player )
    if ( player == localPlayer and robCashRegister == false and robberyStarted == true ) then
        triggerServerEvent ("GTIstoreRob_payOutForCashRegister", localPlayer )
        robCashRegister = true
        timer = setTimer ( timeForCashRegister, 360000, 1 )
    else
        cancelEvent()
    end
end

function cancelTheKill ( player )
    cancelEvent ()
end

for k,v in ipairs(peds) do 
    addEventHandler ( "onClientPedDamage", v[1], cancelTheKill )
    setElementFrozen ( v[1], true )
    setElementInterior ( v[1], v[3] )
    setElementDimension ( v[1], v[2] )
end

for k,v in ipairs(cashRegister) do 
    addEventHandler ("onClientObjectBreak", v[1], breakCashRegister )
    setElementInterior ( v[1], v[3] )
    setElementDimension ( v[1], v[2] )
    setElementDoubleSided ( v[1], true )
end

function isItAPedToRob( ped )
for k,v in ipairs(peds) do 
if v[1] == ped then return true end
end
end



local teste1 = createColSphere(1310.6231689453, -896.85455322266, 39.62656402587, 3)
local teste2 = createColSphere(1355.78125, -1761.5341796875, 13.62656211853, 3)
local teste3 = createColSphere(2346.8095703125, -1372.1140136719, 24.0265617370614, 3)
local teste4 = createColSphere(1, 1, 1, 3)





function detectAim( target )
    --local job = exports.san_employment:getPlayerJob(true)
    --if getPlayerTeam(localPlayer) == getTeamFromName("Policia") then return end
    
    if isElementWithinColShape(localPlayer, teste1) or isElementWithinColShape(localPlayer, teste2) or isElementWithinColShape(localPlayer, teste3) or isElementWithinColShape(localPlayer, teste4) then

        local pedSlot = getPedWeaponSlot ( localPlayer )
        if (pedSlot == 0)	then return end
        
        local arma = getPedWeapon ( localPlayer )
        if (arma == 22)	then return end





    if ( target ) and ( getElementType( target ) == "ped" ) and (source == localPlayer) and getPedControlState("aim_weapon") and isItAPedToRob(target) then
        if ( robberyStarted == true ) then
            if not isDX then
                exports.san_hud:dm("Khahesh Mikonm Dige Pol Nadaram Mano Tanha Bezar!.", 200, 0, 0 )
                isDX = true
                setTimer(function() isDX = false end, 10000, 1)
                return
            end
        end
        if (not robberyStarted) then



            local policiaTeam = getTeamFromName ( "Policia" )
            local groveCount = countPlayersInTeam ( policiaTeam )
            if groveCount >= 0 then


            setPedAnimation( target, "SHOP", "SHP_Rob_GiveCash", 3000, false, false, false, false)
            triggerServerEvent ("GTIstoreRob_WantedLevel", localPlayer )
			theRobbery = true
			exports.san_hud:dm("(5 Daghighe Montazer Bashid!)", 200, 255, 0)
            exports.san_hud:dm("Dastato Bebar Bala In Ye Serghate", 200, 0, 0)
		
            isDX = true
            setTimer(function() isDX = false end, 10000, 1)
            robberyStarted = true
            setElementData(localPlayer, "isPlayerRobbing", true)
            cancelRobb = true
            intLeave = true
            seconds = 300
            countDown = setTimer ( cDown, 1000, 300 )
        else
			outputChatBox("#dc143c[AVISO]:#ffffff Baraye Dozdi Bayad 3 Police Dar Shahr Bashe!", 255, 255, 255, true)
            end
			end
        end

    end
end
addEventHandler ( "onClientPlayerTarget", localPlayer, detectAim )
addEventHandler ( "onClientColShapeHit", root, detectAim )


function timeForCashRegister ( )
    robCashRegister = false
end

function cDown ( )
    seconds = seconds - 1
    local mins,secds = secsToMin(seconds)
    if mins == "00" and secds == "00" then --time is up
        killTimer( countDown )
        createMoneyBag()
        setElementData(localPlayer, "isPlayerRobbing", false)
        exports.san_hud:drawStat("storeRobTimer", "", "", 200, 0, 0)
    else
        exports.san_hud:drawStat("storeRobTimer", "Zaman Baghi Mande: ", mins..":"..secds, 200, 0, 0)
    end
end

function createMoneyBag ( )
    triggerServerEvent ("GTIstoreRob_moneyBag", localPlayer )
	x, y, z = getElementPosition ( localPlayer )
    colshape = createColCuboid ( x-200, y-200, z-50, 400, 400, 100 )
    exports.san_hud:dm("Dozdi Moafagiyat Amiz Bod,Hala Boro Pol Shoei!", 200, 0, 0)
    leaveAreaRadar = createRadarArea ( x-200, y-200, 400, 450, 0, 200, 0, 150 )
    addEventHandler ("onClientColShapeLeave", colshape, payoutForSafe )
	hasBag = true
end

function payoutForSafe ( player )
	if ( player == localPlayer ) and not isTimer(payTimer) then
	payTimer = setTimer(function()
	if (getElementInterior(localPlayer) ~= 0) or (getElementDimension(localPlayer) ~= 0) then return end
        if ( robberyStarted == false ) then return end
		if ( hasBag == false ) then return end
        triggerServerEvent ("GTIstoreRob_payoutForSafe", localPlayer )
        c = setTimer ( isRobberyFalseAgain, 180000, 1 )
	    destroyElement ( colshape )
	    destroyElement ( leaveAreaRadar )
		end, 500, 1 )
	end
end

-- Cancel the robbery functions

--[[function createMarkers ( )
    for i, a in ipairs ( cancelMarkers ) do
        local x = a[1]
        local y = a[2]
        local z = a[3]
        cancelMarker = createMarker ( x, y, z, "cylinder", 4, 0, 0, 0, 0 )
        addEventHandler ("onClientMarkerHit", cancelMarker, robberyCancelOnMarkerHit )
    end
end
addEventHandler ("onClientResourceStart", resourceRoot, createMarkers )--]]

local recieved = {}

function cancelRobbery ( jobName )
    if ( source == localPlayer ) then
    if ( intLeave == false ) then return end
    if ( robberyStarted == false) then return end
	if ( theRobbery == false ) then return end
	    triggerServerEvent ("GTIstoreRob_stopMission", localPlayer )
        unbindKey ( "N", "down", startCrack )
        exports.san_hud:drawStat("storeRobTimer", "", "", 200, 0, 0)
        exports.san_hud:drawNote ("StoreRobCrackSafeNote", "", 255, 0, 0, 0 )
        if (not recieved[localPlayer]) then
            exports.san_hud:dm("Você falhou no assalto!", 200, 0, 0)
            recieved[localPlayer] = true
        end   
        robCashRegister = true
        theRobbery = false
		hasBag = false
		if isElement ( colshape ) then destroyElement ( colshape ) end
	    if isElement ( leaveAreaRadar ) then destroyElement ( leaveAreaRadar ) end
        setElementData(localPlayer, "isPlayerRobbing", false)
        if isTimer ( countDown ) then killTimer ( countDown ) end
        if isTimer ( timer ) then killTimer ( timer ) end
		if isTimer ( c ) then killTimer ( c ) end
        c = setTimer ( isRobberyFalseAgain, 180000, 1 )
    end
end

addEventHandler ("onClientPlayerQuitJob", root, 
function ( jobName )
    if not jobName then 
        return true
    else
        return cancelRobbery ( )
    end
end
)

addEventHandler ("onClientPlayerGetJob", root, 
function ( jobName ) 
    if jobName == "Criminal" then
        return true
    else
        return cancelRobbery ( )
    end
end

)

addEventHandler ("onClientPlayerWasted", localPlayer,
    function ( )
        cancelRobbery(localPlayer)
    end

)


addEvent ("GTIstoreRob_CancelOnArrest", true )
addEventHandler ("GTIstoreRob_CancelOnArrest", root,
    function ()
        cancelRobbery()
	end
)



local zone = createColCuboid( 1310.1286621094, -898.5185546875, 38.126567840576, 11.472412109375, 11.046752929688, 10.299978637695)
local zone2 = createColCuboid(1347.34375, -1759.9936523438, 8.815579414368, 11, -10, 10.3999980926514)
local zone3 = createColCuboid(2344.2316894531, -1373.2081298828, 19.9128036499029, 10, -10, 15)
local zone4 = createColCuboid(0, 0, 0, 0, 0, 0)

function robberyCancelOnMarkerHit ( player )
    if ( player == localPlayer ) then
    if ( intLeave == false ) then return end
	if ( hasBag == true ) then return end
        unbindKey ( "N", "down", startCrack )
        exports.san_hud:drawNote ("StoreRobCrackSafeNote", "", 255, 0, 0, 0 )
    if ( cancelRobb == false ) then return end
    if ( robberyStarted == false) then return end
        exports.san_hud:drawStat("storeRobTimer", "", "", 200, 0, 0)
        if (not recieved[localPlayer]) then
            exports.san_hud:dm("Você falhou no assalto!", 200, 0, 0)
            recieved[localPlayer] = true
        end
        setElementData(localPlayer, "isPlayerRobbing", false)
        theRobbery = false
        cancelRobb = false
		hasBag = false
		robCashRegister = true
		triggerServerEvent ("GTIstoreRob_stopMission", localPlayer )
		if isElement ( colshape ) then destroyElement ( colshape ) end
	    if isElement ( leaveAreaRadar ) then destroyElement ( leaveAreaRadar ) end
        if isTimer ( countDown ) then killTimer ( countDown ) end
        if isTimer ( timer ) then killTimer ( timer ) end
		if isTimer ( c ) then killTimer ( c ) end
        c = setTimer ( isRobberyFalseAgain, 180000, 1 )
    end
end
addEventHandler ("onClientColShapeLeave", zone, robberyCancelOnMarkerHit )
addEventHandler ("onClientColShapeLeave", zone2, robberyCancelOnMarkerHit )
addEventHandler ("onClientColShapeLeave", zone3, robberyCancelOnMarkerHit )
--addEventHandler ("onClientColShapeLeave", zone2, robberyCancelOnMarkerHit )
--addEventHandler ("onClientColShapeLeave", zone3, robberyCancelOnMarkerHit )
addEventHandler ("onClientColShapeLeave", zone4, robberyCancelOnMarkerHit )


--addEventHandler ("onClientColShapeHit", colShapeDerFix, robberyCancelOnMarkerHit )
--addEventHandler ("onClientColShapeLeave", colShapeDerFix, robberyCancelOnMarkerHit )
--addEventHandler ("onClientInteriorExit", root, robberyCancelOnMarkerHit )

function isRobberyFalseAgain ( )
    robberyStarted = false
    robCashRegister = false
    theRobbery = false
    cancelRobb = false
    intLeave = false
	hasBag = false
    if isTimer ( timer ) then killTimer ( timer ) end
	if isTimer ( c ) then killTimer ( c ) end
end