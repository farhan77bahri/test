local whitelist = { 
	["970CD3F7B16A81312BF86EEC0EB72DE4"] = true, --farhan
	["F3BF1238D559DE9A860CE5D8D37D78A1"] = true, --Amir Ghasemi
	["955E3D3ED5C3E9C6238480A63D45B9A4"] = true, --Reza
	--["E74DAB4AA7E701EA2A3AE3BFAB92A2E3"] = true, --Adel
	["4CD4FE080C41BA89F9E004ECF56372E2"] = true, --Omraneh
	["71D95082DF6FD4C0168DAFFAC44151A1"] = true, --Amir Esmaeili
	

	--VIDEÓ HELP!!
	--["389CC44F1766BE2A06F430BA35E405F2"] = true, -- hoseyni
	["511899BD96A25F72D2F365F5063504A1"] = true, --Soheil
    --["B0A33462B77A947BF23B33C3916B11E2"] = true, --spanser
   -- ["7609A832D28030C02BEF394F20770EC4"] = true, --darya
	["567853835BFBE048C3A55AFD7F414374"] = true, --khodam

	["A36E739FEB0E512E8C3223AD44BB0FA1"] = true,  --saleh amini
	
	 
  --  ["3A3C4C187AE98898E05A3D0041769AF2"] = true,  ---Ali
--["511899BD96A25F72D2F365F5063504A1"] = true,	-- Soheil
}
addEventHandler( "onPlayerConnect", root, function (_, _, _, serial) 
	if not ( whitelist[ serial ] ) then 
		  cancelEvent( true, "Just Admins!" ) 
	end 
end )