icon_map_jobbtn = guiCreateStaticImage(76,80,200,40,"images/icon_mapbtn.png",false, window)
icon_map_salonbtn = guiCreateStaticImage(76,130,200,40,"images/icon_mapbtn.png",false, window)
icon_map_carbtn = guiCreateStaticImage(76,180,200,40,"images/icon_mapbtn.png",false, window)
--icon_map_mapbtn = guiCreateStaticImage(76,230,200,40,"images/icon_mapbtn.png",false, window)
icon_mapbtn_fon = guiCreateStaticImage(400,300,400,300,"images/icon_mapbtn_fon.png",false, window)
icon_salonbtn_fon = guiCreateStaticImage(400,300,400,300,"images/icon_salonbtn_fon.png",false, window)
icon_carbtn_fon = guiCreateStaticImage(400,300,400,300,"images/icon_carbtn_fon.png",false, window)
icon_map_background = guiCreateStaticImage(430,100,300,400,"images/icon_map_background.png",false, window)
closemap = guiCreateStaticImage(1050,10,19,18,"images/close.png",false)

myFont7 = guiCreateFont( "font/fontregular.ttf", 17 )
myFont8 = guiCreateFont( "font/fontregular.ttf", 12 )
myFont9 = guiCreateFont( "font/fontregular.ttf", 18 )

label_jobtext = guiCreateLabel(360,130,500,500,"", false, window)
label_salontext = guiCreateLabel(360,130,500,500,"", false, window)
label_cartext = guiCreateLabel(360,130,500,500,"", false, window)


label_mapjobbtn = guiCreateLabel(65,10,57,20,"Trabalho", false, icon_map_jobbtn)
label_mapjobsbtn = guiCreateLabel(500,80,400,40,"Trabalho do servidor", false, window)
label_mapsalonsbtn = guiCreateLabel(490,80,400,40,"Concessionárias de servidores", false, window)
label_mapsalonbtn = guiCreateLabel(53,10,95,20,"Concessionárias de automóveis", false, icon_map_salonbtn)
label_mapcarbtn = guiCreateLabel(58,10,85,20,"Transporte", false, icon_map_carbtn)
label_mapcarsbtn = guiCreateLabel(490,80,400,40,"Transporte de servidor", false, window)

guiSetVisible(label_mapcarsbtn, false)
guiSetVisible(icon_carbtn_fon, false)
guiSetVisible(label_mapsalonsbtn, false)
guiSetVisible(icon_salonbtn_fon, false)
guiSetVisible(icon_map_mapbtn, false)
guiSetVisible(icon_map_carbtn, false)
guiSetVisible(icon_map_jobbtn, false)
guiSetVisible(icon_map_salonbtn, false)
guiSetVisible(label_mapjobsbtn, false)
guiSetVisible(label_mapsalonbtn, false)
guiSetVisible(label_jobtext, false)
guiSetVisible(label_salontext, false)
guiSetVisible(label_cartext, false)
guiSetVisible(icon_mapbtn_fon, false)
guiSetVisible(closemap, false)
guiSetVisible(icon_map_background, false)


guiLabelSetColor(label_salontext, 136,136,136)
guiLabelSetColor(label_jobtext, 136,136,136)
guiLabelSetColor(label_cartext, 136,136,136)
guiLabelSetColor(label_mapjobsbtn, 1,1,1)
guiLabelSetColor(label_mapsalonsbtn, 1,1,1)
guiLabelSetColor(label_mapcarsbtn, 1,1,1)
guiLabelSetColor(label_mapjobbtn, 255,255,255)
guiLabelSetColor(label_mapsalonbtn, 255,255,255)
guiLabelSetColor(label_mapcarbtn, 255,255,255)
guiLabelSetColor(label_mapmapbtn, 255,255,255)

guiSetFont(label_mapjobsbtn, myFont7)
guiSetFont(label_mapsalonsbtn, myFont7)
guiSetFont(label_mapcarsbtn, myFont7)
guiSetFont(label_mapjobbtn, myFont8)
guiSetFont(label_mapsalonbtn, myFont8)
guiSetFont(label_mapcarbtn, myFont8)
guiSetFont(label_mapmapbtn, myFont8)
guiSetFont(label_jobtext, myFont9)
guiSetFont(label_salontext, myFont9)
guiSetFont(label_cartext, myFont9)



addEventHandler( "onClientGUIClick", root,
function()
	if source == label_mapcarbtn then
	guiSetVisible(label_mapjobsbtn,false)
	guiSetVisible(label_jobtext, false)
		guiSetVisible(icon_mapbtn_fon, false)
		guiSetVisible(icon_map_background,false)  
		guiSetVisible(label_mapcarsbtn, true)
		guiSetVisible(label_salontext, false)
		guiSetVisible(icon_salonbtn_fon, false)
		guiSetVisible(label_mapsalonsbtn, false)
		guiSetVisible(label_cartext, true)
		guiSetVisible(icon_carbtn_fon, true)
	end
end)

addEventHandler( "onClientGUIClick", root,
function()
	if source == icon_map_carbtn then
	guiSetVisible(label_mapjobsbtn,false)
	guiSetVisible(label_jobtext, false)
		guiSetVisible(icon_mapbtn_fon, false)
		guiSetVisible(icon_map_background,false)  
		guiSetVisible(label_mapcarsbtn, true)
		guiSetVisible(label_salontext, false)
		guiSetVisible(icon_salonbtn_fon, false)
		guiSetVisible(label_mapsalonsbtn, false)
		guiSetVisible(label_cartext, true)
		guiSetVisible(icon_carbtn_fon, true)
	end
end)
------------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
	if source == label_mapsalonbtn then
	guiSetVisible(icon_salonbtn_fon, true)
	guiSetVisible(label_mapsalonbtn, true)
	guiSetVisible(label_mapsalonsbtn, true)
	guiSetVisible(label_salontext, true)
	guiSetVisible(label_mapjobsbtn,false)
	guiSetVisible(label_jobtext, false)
		guiSetVisible(icon_mapbtn_fon, false)
		guiSetVisible(icon_map_background,false) 
guiSetVisible(label_mapcarsbtn, false)	
guiSetVisible(label_cartext, false)	
guiSetVisible(icon_carbtn_fon, false)
	end
end)

addEventHandler( "onClientGUIClick", root,
function()
	if source == icon_map_salonbtn then
	guiSetVisible(icon_salonbtn_fon, true)
	guiSetVisible(label_mapsalonbtn, true)
	guiSetVisible(label_mapsalonsbtn, true)
	guiSetVisible(label_salontext, true)
	guiSetVisible(label_mapjobsbtn,false)
	guiSetVisible(label_jobtext, false)
		guiSetVisible(icon_mapbtn_fon, false)
		guiSetVisible(icon_map_background,false) 
guiSetVisible(label_mapcarsbtn, false)	
guiSetVisible(label_cartext, false)
guiSetVisible(icon_carbtn_fon, false)


	end
end)
--------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
	if source == labeltest2 then
	guiSetVisible(labelnewtext,true)
	guiSetVisible(icon_map_mapbtn,true)
	guiSetVisible(icon_map_carbtn, true)
guiSetVisible(icon_map_jobbtn, true)
guiSetVisible(icon_map_salonbtn, true)
guiSetVisible(label_jobtext, false)
guiSetVisible(label_salontext, false)
guiSetVisible(label_mapjobsbtn, false)
guiSetVisible(icon_mapbtn_fon, false)
guiSetVisible(icon_salonbtn_fon, false)
guiSetVisible(label_mapsalonsbtn, false)
guiSetVisible(label_mapsalonbtn, true)
guiSetVisible(label_mapcarsbtn, false)
guiSetVisible(label_cartext, false)
guiSetVisible(icon_carbtn_fon, false)


	end
end)




--------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
	if source ==  mapsbtn then
	guiSetVisible(icon_map_mapbtn,true)
		guiSetVisible(icon_map_carbtn, true)
guiSetVisible(icon_map_jobbtn, true)
guiSetVisible(icon_map_salonbtn, true)
guiSetVisible(icon_salonbtn_fon, false)
guiSetVisible(label_mapsalonbtn, true)





	else

	end
end)
---------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
	if source ==  labelnewtext14 then
	guiSetVisible(icon_map_mapbtn, true)
		guiSetVisible(icon_map_carbtn, true)
guiSetVisible(icon_map_jobbtn, true)
guiSetVisible(icon_map_salonbtn, true)
guiSetVisible(label_mapsalonbtn, true)





	else

	end
end)
---------------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
	if source ==  labelnews then
	guiSetVisible(icon_map_mapbtn, false)
	guiSetVisible(icon_map_carbtn, false)
guiSetVisible(icon_map_jobbtn, false)
guiSetVisible(icon_map_salonbtn, false)
guiSetVisible(label_mapjobsbtn, false)
guiSetVisible(label_jobtext, false)
guiSetVisible(icon_mapbtn_fon, false)
guiSetVisible(icon_salonbtn_fon, false)
guiSetVisible(label_mapsalonsbtn, false)
guiSetVisible(label_salontext, false)
guiSetVisible(label_mapcarsbtn, false)
guiSetVisible(label_cartext, false)
guiSetVisible(icon_carbtn_fon, false)




	else

	end
end)

addEventHandler( "onClientGUIClick", root,
function()
	if source ==  labelnews4 then
	guiSetVisible(icon_map_mapbtn, false)
	guiSetVisible(icon_map_carbtn, false)
guiSetVisible(icon_map_jobbtn, false)
guiSetVisible(icon_map_salonbtn, false)
guiSetVisible(label_mapjobsbtn, false)
guiSetVisible(label_jobtext, false)
guiSetVisible(icon_mapbtn_fon, false)
guiSetVisible(icon_salonbtn_fon, false)
guiSetVisible(label_mapsalonsbtn, false)
guiSetVisible(label_salontext, false)
guiSetVisible(label_mapcarsbtn, false)
guiSetVisible(label_cartext, false)






	end
end)

addEventHandler( "onClientGUIClick", root,
function()
	if source == icon_map_jobbtn then
	guiSetVisible(label_mapjobsbtn,true)
	guiSetVisible(label_jobtext, true)
	guiSetVisible(icon_mapbtn_fon, true)
	guiSetVisible(icon_map_background, false)
	guiSetVisible(icon_salonbtn_fon, false)
	guiSetVisible(label_mapsalonsbtn, false)
	guiSetVisible(label_salontext, false)
			guiSetVisible(label_mapcarsbtn, false)
			guiSetVisible(label_cartext, false)
			guiSetVisible(icon_carbtn_fon, false)



	end
end)

addEventHandler( "onClientGUIClick", root,
function()
	if source == label_mapjobbtn then
	guiSetVisible(label_mapjobsbtn,true)
	guiSetVisible(label_jobtext, true)
		guiSetVisible(icon_mapbtn_fon, true)
		guiSetVisible(icon_map_background, false)
		guiSetVisible(icon_salonbtn_fon, false)
		guiSetVisible(label_mapsalonsbtn, false)
		guiSetVisible(label_salontext, false)
				guiSetVisible(label_mapcarsbtn, false)
				guiSetVisible(label_cartext, false)
				guiSetVisible(icon_carbtn_fon, false)



	end
end)





  addEventHandler( 'onClientMouseEnter', root, function()

      if source == closemap then
        guiSetAlpha(closemap, 0.5)
		
		end
      end)
	  
	    addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == closemap then
        guiSetAlpha( closemap , 1.0 );

    end   
 end)


  addEventHandler( 'onClientMouseEnter', root, function()

      if source == label_mapjobbtn then
        guiSetAlpha( label_mapjobbtn , 0.5 );
		guiSetAlpha( icon_map_jobbtn , 0.5 )
		end
      end)
	  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == label_mapjobbtn then
        guiSetAlpha( label_mapjobbtn , 1.0 );
		guiSetAlpha( icon_map_jobbtn , 1.0 )
    end   
 end)

  addEventHandler( 'onClientMouseEnter', root, function()

      if source == label_mapsalonbtn then
        guiSetAlpha( label_mapsalonbtn , 0.5 );
		guiSetAlpha( icon_map_salonbtn , 0.5 )
		end
      end)
	  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == label_mapsalonbtn then
        guiSetAlpha( label_mapsalonbtn , 1.0 );
		guiSetAlpha( icon_map_salonbtn , 1.0 )
    end   
 end)

 
 
  addEventHandler( 'onClientMouseEnter', root, function()

      if source == label_mapcarbtn then
        guiSetAlpha( label_mapcarbtn , 0.5 );
		guiSetAlpha( icon_map_carbtn , 0.5 );
		end
      end)
	  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == label_mapcarbtn then
        guiSetAlpha( label_mapcarbtn , 1.0 );
		guiSetAlpha( icon_map_carbtn , 1.0 );
    end   
 end)

  addEventHandler( 'onClientMouseEnter', root, function()

      if source == label_mapmapbtn then
        guiSetAlpha( label_mapmapbtn , 0.5 );
		guiSetAlpha( icon_map_mapbtn , 0.5 );
		end
      end)
	  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == label_mapmapbtn then
        guiSetAlpha( label_mapmapbtn , 1.0 );
		guiSetAlpha( icon_map_mapbtn , 1.0 );
    end   
 end)
------------------------------------------------
  addEventHandler( 'onClientMouseEnter', root, function()

      if source == icon_map_mapbtn then
        guiSetAlpha( icon_map_mapbtn , 0.5 );
		end
      end)
	  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == icon_map_mapbtn then
        guiSetAlpha( icon_map_mapbtn , 1.0 );
    end   
 end)
 
  addEventHandler( 'onClientMouseEnter', root, function()

      if source == icon_map_carbtn then
        guiSetAlpha( icon_map_carbtn , 0.5 );
		end
      end)
	  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == icon_map_carbtn then
        guiSetAlpha( icon_map_carbtn , 1.0 );
    end   
 end)
 
  addEventHandler( 'onClientMouseEnter', root, function()
      if source == icon_map_jobbtn then
        guiSetAlpha( icon_map_jobbtn , 0.5 );
		end
      end)
	  
  addEventHandler( 'onClientMouseLeave', root, function()
      if source == icon_map_jobbtn then
        guiSetAlpha( icon_map_jobbtn , 1.0 );
    end   
	end)
  addEventHandler( 'onClientMouseEnter', root, function()
      if source == icon_map_salonbtn then
        guiSetAlpha( icon_map_salonbtn , 0.5 );
		end
      end)
	  
  addEventHandler( 'onClientMouseLeave', root, function()
      if source == icon_map_salonbtn then
        guiSetAlpha( icon_map_salonbtn , 1.0 );
    end   
 end)