--local Marker1 = createMarker(1348.7099609375, -1762.9429931641, 13.549824714661 -1, "cylinder", 2, 200, 150, 0, 0)


amount = 3
local element = {}
allAmbiMarkers = {}
ambiMarkers = { 
	[1] = { 382.5166015625, -1811.1889648438, 7.8808903694153 },
    [2] = { 935.00024414063, -1356.1656494141, 13.343712806702},
    --[3] = { 1178.2137451172, -1688.3547363281, 14.020483970642},
    [3] = {1864.2302246094, -1644.9256591797, 16.03799819946},
    [4] = { 2394.5078125, -1905.37109375, 13.556812286377},

    [5] = {1925.1721191406, -1773.3576660156, 13.555365562439},


    [6] = {2855.381, 2430.612, 11.083},
    [7] = {2389.0583496094,2035.2016601563,10.934312820435},
    [8] = {2384.3869628906,2079.3500976563,10.842040061951},


    [9] = {2549.6999511719,1975.6741943359,10.821425437927},
    [10] = {2648.0893554688,1866.6785888672,11.034210205078},
    [11] = {2467.880859375,2069.1872558594,10.822424888611},

    [12] = {2097.6865234375,2239.5634765625,11.030031204224},
    [13] = {1941.6203613281,2302.8957519531,10.844325065613},
    [14] = {2354.2407226563,2548.4799804688,10.837710380554},
    [15] = {2769.2951660156,2486.4709472656,11.097410202026},
    [16] = {2329.3525390625,6.2583117485046,26.521263122559},
    [17] = {2353.892, 68.519, 22.308},
    [18] = {2353.9924316406,69.272331237793,22.308109283447},

    [19] = {1380.749, 239.777, 19.568},
    [20] = {205.192, -186.562, 1.585},
    [21] = {2644.6572265625,1668.4836425781,11.028012275696},

    [22] = {-2156.22265625,-2449.9765625,30.850011825562}, 
    [23] = {2198.7280273438,1986.8363037109,12.297924995422},
    [24] = {251.11239624023,-57.005558013916,1.5703125}, 
	[25] = {1153.41796875, -1356.5959472656, 13.824970245361}, 
    [26] = {663.77453613281,-568.50592041016,16.343263626099}
}






for i = 1, #ambiMarkers, 1 do
element["MARKERPRO"..i] = createMarker(ambiMarkers[i][1], ambiMarkers[i][2],ambiMarkers[i][3]-0.8, "cylinder",1, 124, 197, 118, 100)
local m = element["MARKERPRO"..i]


--local myBlip = createBlipAttachedTo ( m, 56 )
--setElementData(myBlip ,"blip >> name", "Shop")

addEventHandler("onMarkerHit",m,
function(hitElement)
if (getElementType(hitElement) == "player") then
		if not isPedInVehicle(hitElement) then
            triggerClientEvent(hitElement,"LOJAMIDAON",hitElement)
            
            triggerClientEvent(hitElement,"JoinQuitGtaV:notifications", hitElement,"comida", "Dokme (M) Ra Feshar Dahid Va Roye Item Morede Nazar Click Konid!", 10 )


	end
end
end)

addEventHandler("onMarkerLeave",m,
function(hitElement)
if (getElementType(hitElement) == "player") then
		if not isPedInVehicle(hitElement) then
			triggerClientEvent(hitElement,"LOJAMIDAOFF",hitElement)
	end
end
end)
end





addEvent("Suco",true)
addEventHandler("Suco",root,
function()
   --outputChatBox("Suco de laranja x1", source)  


    money = getElementData(source,"char:money") or 0
    if money >= 15 then
               if exports.san_items:giveItem(source, 7, 1, 1, 0, true) then 
                local linha = math.random(1, 255 )
                exports.san_hud:drawNote("Suco"..linha.."", "Suco de laranja x1", source, 255, 255, 255, 7000)
                   setElementData(source, "char:money", money - 15)
               else
                  -- outputChatBox("Fazaye Kafi Nadari!", source)  
               end
       end


end)


addEvent("Coca",true)
addEventHandler("Coca",root,
function()
    money = getElementData(source,"char:money") or 0
    if money >= 25 then
               if exports.san_items:giveItem(source, 12, 1, 1, 0, true) then 
                local linha = math.random(1, 255 )
                exports.san_hud:drawNote("Suco"..linha.."", "Coca x1", source, 255, 255, 255, 7000)
                   setElementData(source, "char:money", money - 25)
               else
                  -- outputChatBox("Fazaye Kafi Nadari!", source)  
               end
       end


end)


addEvent("Hamburguer",true)
addEventHandler("Hamburguer",root,
function()
    --outputChatBox("Suco de laranja x1", source)  


    money = getElementData(source,"char:money") or 0
    if money >= 10 then
               if exports.san_items:giveItem(source, 8, 1, 1, 0, true) then 
                local linha = math.random(1, 255 )
                exports.san_hud:drawNote("Suco"..linha.."", "Hamburguer x1", source, 255, 255, 255, 7000)
            
            
                   setElementData(source, "char:money", money - 10)
               else
                  -- outputChatBox("Fazaye Kafi Nadari!", source)  
               end
       end


end)


--[[addEvent("Suco",true)
addEventHandler("Suco",root,
function(quant)
    money = getElementData(source,"char:money") or 0
    if money >= quant * 15 then
              if exports.san_items:giveItem(source, 7, 1, quant, 0, true) then 
                local linha = math.random(1, 255 )
               -- exports.san_items:addPhone(source)
               -- executeCommandHandler("celular123123123", source)
                exports.san_hud:drawNote("Suco"..linha.."", "Suco de laranja comprada com sucesso", source, 255, 255, 255, 7000)
                   setElementData(source, "char:money", money - quant * 15)
               else
                   outputChatBox("", source)  
             end
       end


end)
]]
addEvent("Celular2",true)
addEventHandler("Celular2",root,
function(quant)
     money = getElementData(source,"char:money") or 0
    if money >= quant * 25 then
              if exports.san_items:giveItem(source, 9,1,1,0, true) then 
                local linha = math.random(1, 255 )
               -- exports.san_items:addPhone(source)
               -- executeCommandHandler("celular123123123", source)
                exports.san_hud:drawNote("Suco"..linha.."", "Suco de laranja comprada com sucesso", source, 255, 255, 255, 7000)
                   setElementData(source, "char:money", money - quant * 25)
               else
                   outputChatBox("", source)  
             end
       end


end)




--[[addEvent("Ccelular",true)
addEventHandler("Ccelular",root,
function()
    money = getElementData(source,"char:money") or 0
    if money >= 1500 then
              if exports.san_items:giveItem(source, 16, 1, 1, 0, true) then 
                local linha = math.random(1, 255 )
                --exports.mta_phone:addPhone(source)
                --executeCommandHandler("celular123123123", source)
                exports.san_hud:drawNote("Suco"..linha.."", "Celular x1", source, 255, 255, 255, 7000)
                   setElementData(source, "char:money", money - 1500)
               else
                   outputChatBox("Fazaye Kafi Nadari!", source)  
             end
       end


end)

]]