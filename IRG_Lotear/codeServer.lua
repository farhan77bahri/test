addEvent("AnimLoot", true)
addEventHandler("AnimLoot", root, function (player)
	setPedAnimation(player, "BOMBER","BOM_Plant_2Idle", 3000, true, false, false, false)
end)

------------------------------------ VERIFICAR SE TEM ITEM -----------------------------
addEvent("VerificarM16", true)
addEventHandler("VerificarM16", root, function (Player)
if exports['san_items']:hasItemS(Player, 52) then 
setElementData(Player, "ComM16", true)
else
setElementData(Player, "ComM16", false)
end
end)

addEvent("VerificarDeagle", true)
addEventHandler("VerificarDeagle", root, function (Player)
if exports['san_items']:hasItemS(Player, 44) then 
setElementData(Player, "ComDeagle", true)
else
setElementData(Player, "ComDeagle", false)
end
end)

addEvent("VerificarAK", true)
addEventHandler("VerificarAK", root, function (Player)
if exports['san_items']:hasItemS(Player, 51) then 
setElementData(Player, "ComAK", true)
else
setElementData(Player, "ComAK", false)
end
end)
------------------------------------------------------------------------------------------------------



------------------------------------ DAR/RETIRAR UMA M16 ------------------------------------------
addEvent("DarM16", true)
addEventHandler("DarM16", root, function (Player)
	exports['san_items']:giveItem(Player, 52, 1, 1, 0, true)
end)

addEvent("RetirarM16", true)
addEventHandler("RetirarM16", root, function (Player)
if exports['san_items']:hasItemS(Player, 52) then 
	exports['san_items']:takePlayerItemToID(Player, 52, 0)
end
end)
------------------------------------------------------------------------------------------------------



------------------------------------ DAR/RETIRAR UMA DEAGLE ------------------------------------------
addEvent("RetirarDeagle", true)
addEventHandler("RetirarDeagle", root, function (Player)
if exports['san_items']:hasItemS(Player, 44) then 
	exports['san_items']:takePlayerItemToID(Player, 44, 0)
end
end)

addEvent("DarDeagle", true)
addEventHandler("DarDeagle", root, function (Player)
	exports['san_items']:giveItem(Player, 44, 1, 1, 0, true)
end)
------------------------------------------------------------------------------------------------------


------------------------------------ DAR/RETIRAR UMA AK-47 ------------------------------------------
addEvent("DarAK", true)
addEventHandler("DarAK", root, function (Player)
	exports['san_items']:giveItem(Player, 51, 1, 1, 0, true)
end)

addEvent("RetirarAK", true)
addEventHandler("RetirarAK", root, function (Player)
if exports['san_items']:hasItemS(Player, 51) then 
	exports['san_items']:takePlayerItemToID(Player, 51, 0)
end
end)
------------------------------------------------------------------------------------------------------


