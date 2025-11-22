
function Loadind_Itens ( conta )
	if not isGuestAccount ( conta ) then
		if conta then	
			local source = getAccountPlayer ( conta )
			local Pex_Tubarao = tonumber(getAccountData ( conta, "peixe.Tubarão" ))
			local Pex_Estrela = tonumber(getAccountData ( conta, "peixe.Estrela do mar" ))
			local Pex_Tilapia = tonumber(getAccountData ( conta, "peixe.Tilápia" ))
			local Pex_Tucunare = tonumber(getAccountData ( conta, "peixe.Tucunaré" ))
			local Pex_Carpa = tonumber(getAccountData ( conta, "peixe.Carpa" ))
			local Pex_Esponja = tonumber(getAccountData ( conta, "peixe.Esponja" ))
			local Pex_Enguia = tonumber(getAccountData ( conta, "peixe.Enguia" ))
			setElementData ( source, "peixe.Tubarão", Pex_Tubarao )
			setElementData ( source, "peixe.Estrela do mar", Pex_Estrela )
			setElementData ( source, "peixe.Tilápia", Pex_Tilapia )
			setElementData ( source, "peixe.Tucunaré", Pex_Tucunare )
			setElementData ( source, "peixe.Carpa", Pex_Carpa )
			setElementData ( source, "peixe.Esponja", Pex_Esponja )
			setElementData ( source, "peixe.Enguia", Pex_Enguia )
			
		end
	end	
end

function Save_Itens ( conta )
	if conta then
		local source = getAccountPlayer ( conta )	
		local Pex_Tubarao = tonumber(getElementData(source, "peixe.Tubarão")) or 0  
		local Pex_Estrela = tonumber(getElementData(source, "peixe.Estrela do mar")) or 0  
		local Pex_Tilapia = tonumber(getElementData(source, "peixe.Tilápia")) or 0  
		local Pex_Tucunare = tonumber(getElementData(source, "peixe.Tucunaré")) or 0  
		local Pex_Carpa = tonumber(getElementData(source, "peixe.Carpa")) or 0  
		local Pex_Esponja = tonumber(getElementData(source, "peixe.Esponja")) or 0  
		local Pex_Enguia = tonumber(getElementData(source, "peixe.Enguia")) or 0  
		setAccountData ( conta, "peixe.Tubarão", Pex_Tubarao )
		setAccountData ( conta, "peixe.Estrela do mar", Pex_Estrela )
		setAccountData ( conta, "peixe.Tilápia", Pex_Tilapia )
		setAccountData ( conta, "peixe.Tucunaré", Pex_Tucunare )
		setAccountData ( conta, "peixe.Carpa", Pex_Carpa )
		setAccountData ( conta, "peixe.Esponja", Pex_Esponja )
		setAccountData ( conta, "peixe.Enguia", Pex_Enguia )
			
	end
end

addEventHandler ( "onPlayerLogin", root,
  function ( _, acc )
	setTimer ( Loadind_Itens, 60, 1, acc )
  end
)

function Start_Server ( res )
	if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Loadind_Itens ( acc )
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), Start_Server )

function Stop_Server ( res )
    if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Save_Itens ( acc )
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement(), Stop_Server )

function Quit_Server ( quitType )
	local acc = getPlayerAccount(source)
	if not isGuestAccount ( acc ) then
		if acc then
			Save_Itens ( acc )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), Quit_Server )
