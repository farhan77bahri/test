if fileExists("Client.lua") then
	fileDelete("Client.lua")
end

local medico = createBlip(319.40350341797, -1509.1489257812, 36.0390625, 22)
setElementData(medico ,"blip >> name", "Hospital")
setBlipVisibleDistance(medico, 100)


local shop = createBlip(1480.48046875, -1673.7219238281, 13.696957588196,25)
setElementData(shop ,"blip >> name", "Park Iran-Gaming")
setBlipVisibleDistance(shop, 100)

-------------
function test()
   player = getLocalPlayer(localPlayer)
   -- exports["irg_radar"]:createStayBlip("LSPD",createBlip (1731.8878173828, -1296.893432617,0,0,2,255,0,0,255,0,0),0,"police_hq",24,24,255, 255, 255)
   occupiedVehicle = getPedOccupiedVehicle(localPlayer);
  -- if occupiedVehicle then
   setElementData(occupiedVehicle, "gpsDestination", {1731, -1296});
  -- else
	--outputChatBox("#ff0000To Mashin Nisti",255,255,255,true)
--end
end
addCommandHandler("are",test)
	
	
	--exports.fv_radar:addGPSLine(1731, -1296, 13)
	
	
	
	local gun = createBlip(1373.982421875, -1279.8725585938, 13.546875, 17)
	setElementData(gun ,"blip >> name", "Gun-Shop")
	setBlipVisibleDistance(gun, 100)

	
	local oficina = createBlip(394.94372558594, -1828.3643798828, 7.3740587234497, 63)
	setElementData(oficina ,"blip >> name", "Mechanic")
	setBlipVisibleDistance(oficina, 100)


	
	


	


	local blipZIP = createBlip(  1457.6550292969,-1143.5875244141,24.274166107178, 45 )
	setElementData(blipZIP ,"blip >> name", "Loja de Roupas")
	setBlipVisibleDistance(blipZIP, 100)
	
	local blipmafia = createBlip(  -2567.2150878906, 624.88690185547, 15.845808982849, 0 )
	setElementData(blipmafia ,"blip >> name", "Mafia Godratmand")
	setBlipVisibleDistance(blipmafia, 100)


	local blipMascaras = createBlip(2244.7780761719,-1679.9641113281,15.478799819946, 45 )
	setElementData(blipMascaras ,"blip >> name", "SkinShop-Women")
	setBlipVisibleDistance(blipMascaras, 100)
	
	local SkinShopMen = createBlip(1567.8623046875, -1897.1022949219, 13.560665130615, 45 )
	setElementData(SkinShopMen ,"blip >> name", "SkinShop-Men")
	setBlipVisibleDistance(SkinShopMen, 100)
	
	
	local SkinShopMen2 = createBlip(460.59454345703, -1501.0174560547, 31.057096481323, 45 )
	setElementData(SkinShopMen2 ,"blip >> name", "SkinShop-Men")
	setBlipVisibleDistance(SkinShopMen2, 100)
	
	 --1567.8623046875, -1897.1022949219, 13.560665130615
	
	
	local GrooveST = createBlip(2487.286, -1669.46, 13.847, 15 )
    setElementData(GrooveST ,"blip >> name", "Grove Street")
	setBlipVisibleDistance(GrooveST, 100)
	
	
	
	
	
	local Boate = createBlip(2421.5678710938, -1219.2196044922, 25.563049316406, 21)
    setElementData(Boate ,"blip >> name", "Club96")
	setBlipVisibleDistance(Boate, 100)


	local Shop1 = createBlip(1947.94921875, -1873.2763671875, 13.62656211853027, 12)
    setElementData(Shop1 ,"blip >> name", "Shop")
	setBlipVisibleDistance(Shop1, 100)
	local Shop2 = createBlip(1377.827392578125, -1885.089233398438, 13.626562118530, 12)
    setElementData(Shop2 ,"blip >> name", "Shop")
	setBlipVisibleDistance(Shop2, 100)
	local Shop3 = createBlip(384.3728637695312, -1918.016845703125, 8.826562881469727, 12)
    setElementData(Shop3 ,"blip >> name", "Shop")
	setBlipVisibleDistance(Shop3, 100)
	local Shop4 = createBlip(1312.4638671875, -1129.4970703125, 23.92656326293945, 12)
    setElementData(Shop4 ,"blip >> name", "Shop")
	setBlipVisibleDistance(Shop4, 100)
	local Shop5 = createBlip(2655.6484375, -1424.6474609375, 30.52656173706055, 12)
    setElementData(Shop5 ,"blip >> name", "Shop")
	setBlipVisibleDistance(Shop5, 100)
	local Shop6 = createBlip( 613.0888671875, -1516.990234375, 15.02656269073486, 12)
    setElementData(Shop6 ,"blip >> name", "Shop")
	setBlipVisibleDistance(Shop6, 100)
	--local Shop7 = createBlip(1947.94921875, -1873.2763671875, 13.62656211853027, 12)
  --  setElementData(Shop7 ,"blip >> name", "Shop")
	--setBlipVisibleDistance(Shop7, 100)
	
	


	



