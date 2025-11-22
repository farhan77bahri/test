addEventHandler("onClientResourceStart", resourceRoot,
	function( )
	
		local world = { ["158"] = 1337 }
		
		for key, value in pairs ( world ) do
			local var = { }
			
			var[1] = engineLoadTXD("".. key ..".txd", value)
			engineImportTXD( var[1], value )
			
			var[2] = engineLoadDFF( "".. key ..".dff", value)
			engineReplaceModel( var[2], value )
			
			var[3] = engineLoadCOL( "".. key ..".col", value)
			engineReplaceCOL ( var[3], value)
		end				
	end
)
