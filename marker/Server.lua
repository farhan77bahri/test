
addEventHandler ("onPlayerWeaponFire", root, 
   function (weapons)
        
         if getElementData(source, "char:dutyfaction") == 1000 then return end

		   
		   
         if  (getElementData(source, "Fire")) then return end
		 setElementData(source, "Fire", true)
		 x,y,z = getElementPosition(source)
		 local weaponName = getWeaponNameFromID(weapons)
		 local localidade = getZoneName(x, y, z)
		 exports.san_admin:outputAdminMessage("Tir Andazi Dar #7cc576" .. localidade .."  #FFFFFF Gun: #7cc576("..weaponName..")  N° #FFFFFF Player: #7cc576(" .. getElementData(source, "playerid")..")")
		 for _, p in ipairs (getElementsByType("player")) do
			 if getElementData(source, "char:dutyfaction") == 1 then
			 --isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(p)), aclGetGroup ("Policial")) then
			      outputChatBox (" " , p, 112, 128, 144 ,true)
				   outputChatBox ("#7cc576[Alarm]#ffffff Tir Aznazi Dar #7cc576" .. localidade .."   #FFFFFFBa Aslahe: #7cc576("..weaponName..") #FFFFFFN°  " , p, 112, 128, 144 ,true)
				   
				  outputChatBox (" " , p, 112, 128, 144 ,true)
				  local blip = createBlip ( x,y,z, 20 , 0, 0, 0, 255)
				setElementVisibleTo(blip, root, false)
				setElementVisibleTo(blip, p, true)
				playSoundFrontEnd ( p, 44 )
				
				setTimer ( function()
					destroyElement(blip)
				end, 30000, 1)
				
			else	
			
			
			end
		end
		 
		 setTimer(setElementData, 30000, 1, source, "Fire", false)
		 end)