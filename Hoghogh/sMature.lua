--[[setTimer(function()
	players = getElementsByType ( "player" )
	for k,v in ipairs(players) do

	if getElementData(v, "loggedin") then 	
		
		if getElementData(v, "acc:aseged") == 0 then
		local pay = math.random(10,300)
		triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Imposto da cidade: #FF0000-R$"..pay.."", 255, 255, 255, pos, 20 )
		setElementData(v, "char:money", (getElementData(v,"char:money") or 0) - pay)
		end

		--setTimer ( pagamento, 600000 * 3, 0)

		if getElementData(v, "char:dutyfaction") == 1 
		or getElementData(v, "char:dutyfaction") == 2 
		or getElementData(v, "char:dutyfaction") == 3 
		or getElementData(v, "char:dutyfaction") == 4 
		or getElementData(v, "char:dutyfaction") == 5 
		or getElementData(v, "char:dutyfaction") == 6 
		or getElementData(v, "char:dutyfaction") == 7
		or getElementData(v, "char:dutyfaction") == 8
		or getElementData(v, "char:dutyfaction") == 9 
		or getElementData(v, "char:dutyfaction") == 10 
		or getElementData(v, "char:dutyfaction") == 11 
		or getElementData(v, "char:dutyfaction") == 12 
		or getElementData(v, "char:dutyfaction") == 13 
		or getElementData(v, "char:dutyfaction") == 14
		or getElementData(v, "char:dutyfaction") == 15
		then

		triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como POLICIAL: #00FF00+R$4000", 255, 255, 255, pos, 20 )
		setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 400)
		
		end
	
		if getElementData(v, "char:dutyfaction") == 17 and getElementData(v, "rank_1")  then
			triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como MECÂNICO: #00FF00+R$1000", 255, 255, 255, pos, 20 )
			setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 1000)	
		end
	
	
		 if getElementData(v, "char:dutyfaction") == 16 or getElementData(v, "char:dutyfaction") == 31 then
			triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como RESGATE: #00FF00+R$5000", 255, 255, 255, pos, 20 )
			setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 5000)
		 end
	
		 if getElementData(v, "char:dutyfaction") == 18 then
			triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como DETRAN: #00FF00+R$2500", 255, 255, 255, pos, 20 )
			setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 2500)
		 end
	
		 if getElementData(v, "char:adminduty") == 1 then
			triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como STAFF: #00FF00+R$5500", 255, 255, 255, pos, 20 )
			setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 5500)
		end
		end
	end
end, 6000*3,0)]]--
--end, 20000,0)
	

--addEventHandler ( "onResourceStart", getRootElement(), pagamento )
--setTimer ( pagamento, 1000, 1)



--[[
players = getElementsByType ( "player" )
for k,v in ipairs(players) do

if getElementData(v, "loggedin") then 	
	
	if getElementData(v, "acc:aseged") == 0 then
	local pay = math.random(10,300)
	triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Imposto da cidade: #FF0000-R$"..pay.."", 255, 255, 255, pos, 20 )
	setElementData(v, "char:money", (getElementData(v,"char:money") or 0) - pay)
	end

	--setTimer ( pagamento, 600000 * 3, 0)

	if getElementData(v, "char:dutyfaction") == 1 
	or getElementData(v, "char:dutyfaction") == 2 
	or getElementData(v, "char:dutyfaction") == 3 
	or getElementData(v, "char:dutyfaction") == 4 
	or getElementData(v, "char:dutyfaction") == 5 
	or getElementData(v, "char:dutyfaction") == 6 
	or getElementData(v, "char:dutyfaction") == 7
	or getElementData(v, "char:dutyfaction") == 8 
	or getElementData(v, "char:dutyfaction") == 9 
	or getElementData(v, "char:dutyfaction") == 10 
	or getElementData(v, "char:dutyfaction") == 11 
	or getElementData(v, "char:dutyfaction") == 12 
	or getElementData(v, "char:dutyfaction") == 13 
	or getElementData(v, "char:dutyfaction") == 14
	or getElementData(v, "char:dutyfaction") == 15
	then

	triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como POLICIAL: #00FF00+R$4000", 255, 255, 255, pos, 20 )
	setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 400
	end

	
		triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como MECÂNICO: #00FF00+R$1000", 255, 255, 255, pos, 20 )
		setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 1000)	
	end

	 if getElementData(v, "char:dutyfaction") == 16 or getElementData(v, "char:dutyfaction") == 31 then
		triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como RESGATE: #00FF00+R5000", 255, 255, 255, pos, 20 )
		setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 5000)
	 end

	 if getElementData(v, "char:dutyfaction") == 18  then
		triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como DETRAN: #00FF00+R$2500", 255, 255, 255, pos, 20 )
		setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 2500)
	 end

	 if getElementData(v, "char:adminduty") == 1 then
		triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como STAFF: #00FF00+R$5500", 255, 255, 255, pos, 20 )
		setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 5500)
	end
	end
end
]]



setTimer(function()
	players = getElementsByType ( "player" )
	for k,v in ipairs(players) do

	if getElementData(v, "loggedin") then 	
		
		if getElementData(v, "acc:aseged") == 0 then
		local pay = math.random(10,300)
		triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Imposto da cidade: #FF0000-R$"..pay.."", 255, 255, 255, pos, 20 )
		setElementData(v, "char:money", (getElementData(v,"char:money") or 0) - pay)
		end

		--setTimer ( pagamento, 600000 * 3, 0)

		if getElementData(v, "char:dutyfaction") == 1 and getElementData(v,"char:rank") == 3
		
		then

		triggerClientEvent(v,"JoinQuitGtaV:sendClientMessage", v,"Seu salário como POLICIAL: #00FF00+R$400000", 255, 255, 255, pos, 20 )
		setElementData(v, "char:money", (getElementData(v,"char:money") or 0) + 400000)
		
		end
	
	
	
		 
	
		 
	
		 
		end
	end
end, 6000,0)