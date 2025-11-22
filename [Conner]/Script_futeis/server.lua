	-->> Converter cor 
function RGBToHex(rgb)
	local hexadecimal = '#'

	for key, value in pairs(rgb) do
	local hex = ''

	while(tonumber(value) > 0)do
	local index = math.fmod(tonumber(value), 16) + 1
	value = math.floor(tonumber(value) / 16)
	hex = string.sub('0123456789ABCDEF', index, index) .. hex			
	end

	if(string.len(hex) == 0)then
	hex = '00'

	elseif(string.len(hex) == 1)then
	hex = '0' .. hex
	end

	hexadecimal = hexadecimal .. hex
	end

	return hexadecimal
end


-- Bolean Check
------------------------>>
function isBoolean(date)
	if date == true or date == false or date == nil then
		return true
	else
		return false
	end
end

-- verifica se o campo foi preenchido de forma valida
------------------------>>
function isTruecamp(str)
	text = string.gsub(str, " ", "")
	if text == "" then
		return false
	else
		return true
	end
end

-- Number Check
------------------------>>
function isNumber(date)
	if not isBoolean(date) then
		local date = tonumber(date)
		if date >= 0 or date <= 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

-- Float Number Check
------------------------>>
function isFloatNumber(date)
	local date = tonumber(date)
	if date == math.floor(date) then
		return false	
	else
		return true
	end
end

-- converter Segundos em H M S Root 
------------------------------------->
function convertS(s)
	if isNumber(tonumber(s)) then
		milisegundo = s
		local horas_seg=3600
		local hora = math.floor(milisegundo/horas_seg)
		local minuto = math.floor((milisegundo-(horas_seg*hora))/60)
		local segundo = math.floor((milisegundo-(horas_seg*hora)-(minuto*60)))	
		local tudo = string.format("%02d:%02d:%02d",hora,minuto,segundo)	
		local dia = math.floor(s/86400)

		return hora,minuto,segundo,tudo,dia
	else
		return 0,0,0,0,0		
	end
end



-- converte numero intenro para numero com virgula
------------------------>>

function convertNtoF(amount)
	if isNumber(amount) then
		local formatted = amount
		while true do  
			formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
			
			if (k==0) then
				break
			end
		end
		return formatted
	end
end

-- converte numero com virgula para numero inteiro
------------------------>>
function convertFtoN(amount)
	local numbers = split(tostring(amount),',')
	if #numbers > 0 then
		local numbertoreturn = ""
		for i = 1, #numbers do
			numbertoreturn = numbertoreturn..numbers[i]
		end
		return tonumber(numbertoreturn)
	else
		return tonumber(0)	
	end
end

diassemana = {"Domingo","Segunda-feira","Terca-feira","Quarta-feira","Quinta-feira","Sexta-feira","Sabado"}
function getTempoReal(n)
	local time = getRealTime()
	local vars = {time.hour,time.minute,time.second,time.monthday,time.year,diassemana[tonumber(time.weekday)+1]}
	return vars[n]
end

------------------------>>



-- Set GPS
------------------------>>

function setGPS( source, type , x, y, z ) 	
	triggerClientEvent(source,"Futeis>GPS>Server",source,type,x,y,z)
end






function clearChatCC(thePlayer)
    if isPlayerInACL(thePlayer, "Console") or isPlayerInACL(thePlayer, "Admin") then
    triggerClientEvent(getRootElement(),"trigger_clearChat",getRootElement())
	else
	outputChatBox ("Acesso negado.", thePlayer, 255, 0, 0)
    end
end
addCommandHandler("cc", clearChatCC)

-->> Arredonda  numeros ex 5,513156 para 5, numdpsdavirgula
function arredondar(numero, numdpsdavirgula)
  local mult = 10^(numdpsdavirgula or 0)
  return math.floor(numero * mult + 0.5) / mult
end


-->> Mudança de nick
function removeColorsFromNick(oldNick,newNick) 
    local name = getPlayerName(source) 
    if newNick then 
    name = newNick 
    end 
    if (string.find(name,"#%x%x%x%x%x%x")) then 
    local name = string.gsub(name,"#%x%x%x%x%x%x","") 
    setPlayerName(source,name) 
    if (newNick) then 
    cancelEvent() 
    end 
    end  
end 
addEventHandler("onPlayerJoin", root, removeColorsFromNick) 
addEventHandler("onPlayerChangeNick", root, removeColorsFromNick)

