--[[local weapons = {
   {fileName="ak47", model=355},{fileName="colt", model=346},
   {fileName="m4", model=356},{fileName="magnum", model=348},
   {fileName="mp5", model=353},{fileName="shotgun", model=349},
   {fileName="sniper", model=358},{fileName="uzi", model=352},
   {fileName="silen", model=347}, {fileName="spaz", model=351},{fileName="off", model=350}
}
 
function load()
    for index, weapon in pairs(weapons) do
        tex = engineLoadTXD ( "models/weap/"..weapon.fileName.. ".txd", weapon.model )
        engineImportTXD ( tex, weapon.model )
        mod = engineLoadDFF ( "models/weap/"..weapon.fileName.. ".dff", weapon.model )
        engineReplaceModel ( mod, weapon.model )
    end
end
 
addEventHandler("onClientResourceStart",resourceRoot,
function ()
        setTimer ( load, 1000, 1)
end)]]