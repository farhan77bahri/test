
addEventHandler ("onPlayerWeaponFire", root, 
   function (weapons1)
         if not (getElementData(source, "Fire")) then
		 setElementData(source, "Fire", true)
		 x,y,z = getElementPosition(source)
		 local localidade = getZoneName(x, y, z)
		 local weaponName = getWeaponNameFromID(weapons1)
	     exports.san_admin:outputAdminMessage("Está acontecendo um tiroteio em #7cc576" .. localidade .."  #FFFFFFBa Aslahe: #7cc576("..weaponName..")  N° #FFFFFFda chamada #7cc576(" .. getElementData(source, "playerid")..")")
		 setTimer(setElementData, 60000, 1, source, "Fire", false)
		 end
   end
)