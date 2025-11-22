--local Marker1 = createMarker(1348.7099609375, -1762.9429931641, 13.549824714661 -1, "cylinder", 2, 200, 150, 0, 0)


amount = 3
local element = {}
allambiMarkers = {}
ambiMarkers1 = { 
	[1] = { 1312.1279296875, -896.80108642578, 39.526564025879 },
   
    [2] = {1355.8145751953, -1761.474609375, 13.62656211853}
}






for i = 1, #ambiMarkers1, 1 do
element["MARKERPRO"..i] = createMarker(ambiMarkers1[i][1], ambiMarkers1[i][2],ambiMarkers1[i][3]-0.8, "cylinder",1, 255, 197, 118, 200)
local m = element["MARKERPRO"..i]


local myBlip = createBlipAttachedTo ( m, 56 )
setElementData(myBlip ,"blip >> name", "Shop")

addEventHandler("onMarkerHit",m,
function(hitElement)
if (getElementType(hitElement) == "player") then
		if not isPedInVehicle(hitElement) then
            triggerClientEvent(hitElement,"LOJAMIDAON1",hitElement)
            
            triggerClientEvent(hitElement,"JoinQuitGtaV:notifications", hitElement,"comida", "Dokme (M) Ra Feshar Dahid Va Roye Item Morede Nazar Click Konid!", 10 )


	end
end
end)

addEventHandler("onMarkerLeave",m,
function(hitElement)
if (getElementType(hitElement) == "player") then
		if not isPedInVehicle(hitElement) then
			triggerClientEvent(hitElement,"LOJAMIDAOFF1",hitElement)
	end
end
end)
end





addEvent("Suco1",true)
addEventHandler("Suco1",root,
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


addEvent("Coca1",true)
addEventHandler("Coca1",root,
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


addEvent("Hamburguer1",true)
addEventHandler("Hamburguer1",root,
function()
    --outputChatBox("Suco de laranja x1", source)  


    money = getElementData(source,"char:money") or 0
    if money >= 12 then
               if exports.san_items:giveItem(source, 1, 1, 1, 0, true) then 
                local linha = math.random(1, 255 )
                exports.san_hud:drawNote("Suco"..linha.."", "Hamburguer x1", source, 255, 255, 255, 7000)
            
            
                   setElementData(source, "char:money", money - 12)
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
addEvent("Celular",true)
addEventHandler("Celular",root,
function(quant)
    money = getElementData(source,"char:money") or 0
    if money >= quant * 1500 then
              --if exports.san_items:giveItem(source, 16, math.random(11111111,99999999), 1, 0, true) then 
                local linha = math.random(1, 255 )
                exports.mta_phone:addPhone(source)
               -- executeCommandHandler("celular123123123", source)
                exports.san_hud:drawNote("Phone"..linha.."", "Mobile Kharidi", source, 255, 255, 255, 7000)
                   setElementData(source, "char:money", money - 1500)
               --else
               --    outputChatBox("", source)  
            -- end
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