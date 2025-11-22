local dir = "files"
function loadMod ( f, m )
	if fileExists ( dir..'/'.. f ..'.txd' ) then
		txd = engineLoadTXD ( dir ..'/'.. f ..'.txd' )
		engineImportTXD ( txd, m )
	end
	if fileExists ( dir..'/'.. f ..'.dff' ) then
		dff = engineLoadDFF ( dir..'/'.. f ..'.dff', m )
		engineReplaceModel ( dff, m )
	end
	if fileExists(dir..'/'.. f ..'.col') then
		col = engineLoadCOL(dir..'/'.. f ..'.col')
		engineReplaceCOL ( col, m )
	end
end



addEventHandler("onClientResourceStart", resourceRoot, 
function ()
	loadMod ( "wls_marihuana", 18470)
	loadMod ( "wls_cserep", 16404)
	loadMod ( "wls_koka", 18214)
	loadMod ( "wls_mak", 18471)
end
)

engineSetAsynchronousLoading ( true, false )

function addkreszobject(dffneve,txdneve,kreszid)
	removeWorldModel(tonumber(kreszid),10000,0,0,0) -- először töröljük!
end

function replaceut(id,txdnev)
	local txd = engineLoadTXD("comy_kresz/utak/"..txdnev..".txd")
    engineImportTXD(txd, id)
end

local GarageModell = createObject ( 14798, 540.6953125, -117.505859375, 1001.515625, 0, 0, 83.088134765625 )
setElementDimension(GarageModell,-1)
setElementInterior(GarageModell,3)

removeWorldModel(5681,10000,0,0,0) --Autómosó délin
removeWorldModel(1676,10000,0,0,0) --Felrobbantható benyakút
