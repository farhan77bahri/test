-- Little fixes by mtaresource.ru
--#####################################################
local isMenuOpened = false

function centerWindow ( center_window )                           
	local sx, sy = guiGetScreenSize ( )                           
	local windowW, windowH = guiGetSize ( center_window, false )  
	local x, y = ( sx - windowW ) / 2, ( sy - windowH ) / 2       
	guiSetPosition ( center_window, x, y, false )                 
end    
myFont = guiCreateFont( "font/font.otf", 15 )
myFont2 = guiCreateFont( "font/MyriadPro.otf", 18 )
myFont3 = guiCreateFont( "font/font.otf", 16 )
myFont4 = guiCreateFont( "font/font.otf", 11 )
myFont5 = guiCreateFont( "font/font.otf", 12 )
myFont6 = guiCreateFont( "font/font.otf", 14 )
myFont7 = guiCreateFont( "font/fontregular.ttf", 16 )
myFont10 = guiCreateFont( "font/fontregular.ttf", 14 )
myFont11 = guiCreateFont( "font/fontregular.ttf", 14 )


window = guiCreateStaticImage(670,670,960,597,"images/window.png", false) 
user = guiCreateStaticImage(15,15,50,50,"images/icon_user.png",false, window)
guiSetVisible(window, false)

new = guiCreateStaticImage(31,140,19,19,"images/icon_home.png",false, window)
new2 = guiCreateStaticImage(20,130,40,40,"images/icon_home1.png",false, window)

test = guiCreateStaticImage(33,200,15,22,"images/icon_marker.png",false, window)
test2 = guiCreateStaticImage(20,190,40,40,"images/icon_marker1.png",false, window)

news = guiCreateStaticImage(29,251,23,20,"images/icon_car.png",false, window)
news2 = guiCreateStaticImage(20,240,40,40,"images/icon_car1.png",false, window)

news3 = guiCreateStaticImage(35,298,10,22,"images/icon_money.png",false, window)
news4 = guiCreateStaticImage(20,290,40,40,"images/icon_money1.png",false, window)

report = guiCreateStaticImage(100,130,250,270,"images/icon_report.png",false, window)
maps = guiCreateStaticImage(375,130,250,270,"images/icon_maps.png",false, window)
cars = guiCreateStaticImage(650,130,250,270,"images/icon_cars.png",false, window)

reportbtn = guiCreateStaticImage(25,230,200,30,"images/icon_rep_btn.png",false, report)
mapsbtn = guiCreateStaticImage(25,230,200,30,"images/icon_map_btn.png",false, maps)
carsbtn = guiCreateStaticImage(25,230,200,30,"images/icon_car_btn.png",false, cars)

question = guiCreateStaticImage(110,430,780,150,"images/icon_question.png",false, window)
helpbtn = guiCreateStaticImage(740,60,20,20,"images/icon_help.png",false, question)
helpcarbtn = guiCreateStaticImage(740,120,20,20,"images/icon_help.png",false, question)

close = guiCreateStaticImage(920,10,19,18,"images/close.png",false, window)
close2 = guiCreateStaticImage(920,10,19,18,"images/close_active.png",false, window)

labelnew = guiCreateLabel(20,130,40,40,"", false, window)
labeltest2 = guiCreateLabel(20,190,40,40,"", false, window)
labelnews = guiCreateLabel(20,240,40,40,"", false, window)
labelnews4 = guiCreateLabel(20,290,40,40,"", false, window)

labelclose = guiCreateLabel(920,10,19,18,"", false, window)

labelnewtext4 = guiCreateLabel(100,20,500,80,"Ajuda para ganhar", false, window)
labelnewtext3 = guiCreateLabel(100,20,500,80,"Ajuda do carro", false, window)
labelnewtext2 = guiCreateLabel(100,20,500,80,"Página inicial", false, window)
labelnewtext = guiCreateLabel(100,20,500,80,"Ajuda do sobre o servidor", false, window)
labelnewtext9 = guiCreateLabel(10,120,500,80,"Onde comprar um carro?", false, question)
labelnewtext8 = guiCreateLabel(10,60,500,80,"Como ganhar dinheiro?", false, question)
labelnewtext7 = guiCreateLabel(10,10,500,20,"Perguntas Frequentes", false, question)
labelnewtext6 = guiCreateLabel(100,70,500,80,"Você tem alguma dúvida ao jogar no servidor? ", false, window)
labelnewtext5 = guiCreateLabel(100,100,500,80,"Entre em contato com o suporte técnico do servidor", false, window)
labelnewtext10 = guiCreateLabel(10,10,500,80,"Relatório", false, report)
labelnewtext11 = guiCreateLabel(10,10,500,80,"Ajuda", false, maps)
labelnewtext12 = guiCreateLabel(10,10,500,80,"Carros", false, cars)

xmlOverview1 = xmlLoadFile( "Carkey.xml" )
xmlOverview2 = xmlLoadFile( "Jobs.xml" )

labelcarkey = guiCreateLabel ( 100, 50, 500, 500, xmlNodeGetValue( xmlOverview1 ), false, window )

labeljobkey = guiCreateLabel ( 100, 50, 800, 500, xmlNodeGetValue( xmlOverview2 ), false, window )

labelnewtext13 = guiCreateLabel(35,8,140,15,"Solicitação", false, reportbtn)
labelnewtext14 = guiCreateLabel(70,8,70,15,"Ver mais", false, mapsbtn)
labelnewtext15 = guiCreateLabel(70,8,70,15,"Ver mais", false, carsbtn)
labelnewtext16 = guiCreateLabel(13,40,400,150,"* Para deixar uma solicitação, clique em", false, report)
labelnewtext16 = guiCreateLabel(25,60,400,15,"botão 'Solicitação'", false, report)
labelnewtext18 = guiCreateLabel(1,40,400,150,"* Para ver os mais detalhes", false, maps)
labelnewtext18 = guiCreateLabel(13,60,400,15,"Clique no botão 'Ver mais' ", false, maps)
labelnewtext17 = guiCreateLabel(13,40,400,150,"* Para visualizar mais", false, cars)
labelnewtext17 = guiCreateLabel(25,60,400,15,"veículo", false, cars)
labelnewtext17 = guiCreateLabel(25,80,400,15,"Clique no botão 'Ver mais'", false, cars)

guiLabelSetColor(labelnewtext2, 1,1,1)
guiLabelSetColor(labelnewtext, 1,1,1)
guiLabelSetColor(labelnewtext3, 1,1,1)
guiLabelSetColor(labelnewtext4, 1,1,1)
guiLabelSetColor(labelnewtext5, 190,190,190)
guiLabelSetColor(labelnewtext6, 1,1,1)
guiLabelSetColor(labelnewtext7, 1,1,1)
guiLabelSetColor(labelcarkey, 136,136,136)
guiLabelSetColor(labeljobkey, 136,136,136)
guiLabelSetColor(labelnewtext10, 255,255,255)
guiLabelSetColor(labelnewtext11, 255,255,255)
guiLabelSetColor(labelnewtext12, 255,255,255)

guiLabelSetColor(labelnewtext16, 255,255,255)
guiLabelSetColor(labelnewtext18, 255,255,255)
guiLabelSetColor(labelnewtext17, 255,255,255)

guiLabelSetColor(labelnewtext13, 1,1,1)
guiLabelSetColor(labelnewtext14, 1,1,1)
guiLabelSetColor(labelnewtext15, 1,1,1)

guiLabelSetColor(labelnewtext8, 130,130,130)
guiLabelSetColor(labelnewtext9, 130,130,130)
guiSetFont(labelnewtext2, myFont7)
guiSetFont(labelnewtext, myFont)
guiSetFont(labelnewtext3, myFont)
guiSetFont(labelnewtext4, myFont)
guiSetFont(labelnewtext5, myFont2)
guiSetFont(labelnewtext6, myFont6)
guiSetFont(labelnewtext7, myFont4)
guiSetFont(labelnewtext8, myFont4)
guiSetFont(labelnewtext9, myFont4)
guiSetFont(labelnewtext10, myFont3)
guiSetFont(labelnewtext11, myFont3)
guiSetFont(labelnewtext12, myFont3)
guiSetFont(labelnewtext13, myFont5)
guiSetFont(labelnewtext14, myFont5)
guiSetFont(labelnewtext15, myFont5)
guiSetFont(labelnewtext16, myFont4)
guiSetFont(labelnewtext18, myFont4)
guiSetFont(labelnewtext17, myFont4)
guiSetFont(labelcarkey, myFont10)
guiSetFont(labeljobkey, myFont11)

guiSetVisible(labelnewtext, false)
guiSetVisible(labelcarkey, false)
guiSetVisible(labeljobkey, false)
guiSetVisible(labelnewtext2, false)
guiSetVisible(labelnewtext3, false)
guiSetVisible(labelnewtext4, false)
guiSetVisible(labelnewtext5, true)
guiSetVisible(labelnewtext6, true)
guiSetVisible(labelnewtext7, true)
guiSetVisible(labelnewtext8, true)
guiSetVisible(labelnewtext9, true)
guiSetVisible(labelnewtext10, true)
guiSetVisible(labelnewtext11, true)
guiSetVisible(labelnewtext12, true)

---------------------------------------------------------
addEventHandler('onClientGUIClick', root, function()

	if source == labelnewtext13 then
	executeCommandHandler ( "report", playerSource )
	 	guiSetVisible(window,false)
	showCursor(false)
		end
end)
------------
addEventHandler('onClientGUIClick', root, function()

	if source == reportbtn then
	executeCommandHandler ( "report", playerSource )
	 	guiSetVisible(window,false)
	showCursor(false)
		end
end)
-------------------------------------------------------
  addEventHandler( 'onClientMouseEnter', root, function()

      if source == helpbtn then
        guiSetAlpha( helpbtn, 0.5 );
		end
      end)
  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == helpbtn then
        guiSetAlpha( helpbtn , 1.0 );
    end   
 end)
-------------------------------
  addEventHandler( 'onClientMouseEnter', root, function()

      if source == helpcarbtn then
        guiSetAlpha( helpcarbtn, 0.5 );
		end
      end)
  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == helpcarbtn then
        guiSetAlpha( helpcarbtn , 1.0 );

    end   
 end)
-----------------------------------------------------
  addEventHandler( 'onClientMouseEnter', root, function()

      if source == reportbtn then
        guiSetAlpha( reportbtn, 0.5 );
		end
      end)
  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == reportbtn then
        guiSetAlpha( reportbtn , 1.0 );
    end   
 end)
-------------------------------
  addEventHandler( 'onClientMouseEnter', root, function()

      if source == labelnewtext13 then
        guiSetAlpha( labelnewtext13, 0.5 );
		guiSetAlpha( reportbtn, 0.5 );
		end
      end)
  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == labelnewtext13 then
        guiSetAlpha( labelnewtext13 , 1.0 );
		guiSetAlpha( reportbtn , 1.0 );
    end   
 end)
 
   addEventHandler( 'onClientMouseEnter', root, function()

      if source == labelnewtext14 then
        guiSetAlpha( labelnewtext14, 0.5 );
		guiSetAlpha( mapsbtn, 0.5 );
		end
      end)
  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == labelnewtext14 then
        guiSetAlpha( labelnewtext14 , 1.0 );
		guiSetAlpha( mapsbtn , 1.0 );
    end   
 end)
 
    addEventHandler( 'onClientMouseEnter', root, function()

      if source == labelnewtext15 then
        guiSetAlpha( labelnewtext15, 0.5 );
		guiSetAlpha( carsbtn, 0.5 );
		end
      end)
  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == labelnewtext15 then
        guiSetAlpha( labelnewtext15 , 1.0 );
		guiSetAlpha( carsbtn , 1.0 );
    end   
 end)
 
------------------------------
  addEventHandler( 'onClientMouseEnter', root, function()

      if source == mapsbtn then
        guiSetAlpha( mapsbtn, 0.5 );
		end
      end)
  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == mapsbtn then
        guiSetAlpha( mapsbtn , 1.0 );
    end   
 end)
 
   addEventHandler( 'onClientMouseEnter', root, function()

      if source == carsbtn then
        guiSetAlpha( carsbtn, 0.5 );
		end
      end)
  
  addEventHandler( 'onClientMouseLeave', root, function()
  
      if source == carsbtn then
        guiSetAlpha( carsbtn , 1.0 );
    end   
 end)
---------------------------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
	if source == labelclose then
	guiSetVisible(window,false)
	showCursor(false)
	isMenuOpened = false
	end
end)

addEventHandler( "onClientMouseLeave", root, 
function()
	if source == labelnew then
		guiSetVisible(new,true)
		guiSetVisible(new2,false)
	end
end)
addEventHandler( "onClientMouseEnter", root,
function()
	if source == labelnew then
		guiSetVisible(new,false)
		guiSetVisible(new2,true)
	end
end)
guiSetVisible(new2, false)

addEventHandler( "onClientGUIClick", root,
function()
	if source == labelclose then
	guiSetVisible(window,false)
	showCursor(false)
	isMenuOpened = false
	end
end)

addEventHandler( "onClientMouseLeave", root, 
function()
	if source == labelnews then
		guiSetVisible(news,true)
		guiSetVisible(news2,false)
	end
end)
addEventHandler( "onClientMouseEnter", root,
function()
	if source == labelnews then
		guiSetVisible(news,false)
		guiSetVisible(news2,true)
	end
end)
guiSetVisible(news2, false)

addEventHandler( "onClientGUIClick", root,
function()
	if source == labelclose then
	guiSetVisible(window,false)
	showCursor(false)
	isMenuOpened = false
	end
end)

addEventHandler( "onClientMouseLeave", root, 
function()
	if source == labelalena then
		guiSetVisible(alena,true)
		guiSetVisible(alena,false)
	end
end)
addEventHandler( "onClientMouseEnter", root,
function()
	if source == labelalena then
		guiSetVisible(alena,false)
		guiSetVisible(alena,true)
	end
end)
guiSetVisible(news2, false)

addEventHandler( "onClientMouseLeave", root, 
function()
	if source == labelnews4 then
		guiSetVisible(news3,true)
		guiSetVisible(news4,false)
	end
end)
addEventHandler( "onClientMouseEnter", root,
function()
	if source == labelnews4 then
		guiSetVisible(news3,false)
		guiSetVisible(news4,true)
	end
end)
guiSetVisible(news4, false)
-----------------------------------
addEventHandler( "onClientGUIClick", root,
function()
if source == labelnew then
	guiSetVisible(labelnewtext,false)
	guiSetVisible(labelnewtext2,true)
	guiSetVisible(icon_map_background,false)  
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(question,true)
    guiSetVisible(maps,true)
	guiSetVisible(report,true)
	guiSetVisible(cars,true)
	guiSetVisible(labelnewtext5,true)
	guiSetVisible(labelnewtext6,true)
	guiSetVisible(labelnewtext7,true)
	guiSetVisible(labelnewtext8,true)
	guiSetVisible(labelnewtext9,true)
	guiSetVisible(icon_map_mapbtn, false)
	guiSetVisible(icon_map_carbtn, false)
	guiSetVisible(label_mapjobsbtn, false)
	guiSetVisible(label_salontext, false)
	guiSetVisible(icon_mapbtn_fon, false)
	guiSetVisible(label_mapsalonbtn, false)
	guiSetVisible(label_cartext, false)
	guiSetVisible(label_mapsalonsbtn, false)
	guiSetVisible(icon_carbtn_fon, false)
	guiSetVisible(labelcarkey, false)
	guiSetVisible(icon_map_jobbtn, false)
	guiSetVisible(icon_map_salonbtn, false)
	guiSetVisible(label_jobtext, false)
	guiSetVisible(icon_salonbtn_fon, false)
	guiSetVisible(label_mapcarsbtn, false)
	guiSetVisible(labeljobkey, false)
else
	
end
end)

addEventHandler( "onClientGUIClick", root,
function()
if source == labeltest2 then
	guiSetVisible(labelnewtext,true)
	guiSetVisible(icon_map_background,true)                               
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(question,false)
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
	guiSetVisible(labelcarkey, false)
	guiSetVisible(labeljobkey, false)
else

end
end)

----------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
if source ==  mapsbtn then
	guiSetVisible(labelnewtext,true)
	guiSetVisible(icon_map_background,true)  
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(labelcarkey, false)
	guiSetVisible(question,false)
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
else

end
end)
----------
addEventHandler( "onClientGUIClick", root,
function()
if source ==  labelnewtext14 then
	guiSetVisible(labelnewtext,true)
	guiSetVisible(icon_map_background,true)  
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(question,false)
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
	guiSetVisible(labelcarkey, false)
else

end
end)
----------------------------------------------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
	if source == labelnews then
	guiSetVisible(labelnewtext3,true)
	guiSetVisible(icon_map_background,false)  
	guiSetVisible(labelnewtext,false)
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(question,false)
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
	guiSetVisible(labelcarkey, true)
	guiSetVisible(labeljobkey, false)
else


end
end)
--------------------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
if source == labelnewtext15 then
	guiSetVisible(labelnewtext3,true)
	guiSetVisible(icon_map_background,false)  
	guiSetVisible(labelnewtext,false)
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(question,false)
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
	guiSetVisible(labelcarkey, true)
else
	
end
end)
----------------------------------------------------------
addEventHandler( "onClientGUIClick", root,
function()
if source == carsbtn then
	guiSetVisible(labelnewtext3,true)
	guiSetVisible(labelnewtext,false)
	guiSetVisible(icon_map_background,false)  
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(question,false)
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
	guiSetVisible(labelcarkey, true)
end
end)
--------------------------------
addEventHandler( "onClientGUIClick", root,
function()
if source == helpcarbtn then
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
	guiSetVisible(icon_map_background,true)   
	guiSetVisible(label_cartext, false)
	guiSetVisible(labelcarkey, false)
	guiSetVisible(icon_map_background,true)  
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(question,false)
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
end
end)

addEventHandler( "onClientGUIClick", root,
function()
if source == helpbtn then
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
	guiSetVisible(icon_map_background,true)   
	guiSetVisible(label_cartext, false)
	guiSetVisible(labelcarkey, false)
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(question,false)
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
end
end)

addEventHandler( "onClientGUIClick", root,
function()
	if source == labelnews4 then
	guiSetVisible(labelnewtext4,true)
	guiSetVisible(labelnewtext2,false)
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(labelnewtext,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(question,false)
	guiSetVisible(icon_map_background,false)  
	guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
	guiSetVisible(labelcarkey, false)
	guiSetVisible(labeljobkey, true)
	end
end)
----------------------------------------------------------------------------

addEventHandler( "onClientMouseLeave", root, 
function()
	if source == labeltest2 then
		guiSetVisible(test,true)
		guiSetVisible(test2,false)
	end
end)
addEventHandler( "onClientMouseEnter", root,
function()
	if source == labeltest2 then
		guiSetVisible(test,false)
		guiSetVisible(test2,true)
	end
end)
guiSetVisible(test2, false)


addEventHandler( "onClientMouseLeave", root, 
function()
	if source == labelclose then
		guiSetVisible(close,true)
		guiSetVisible(close2,false)
	end
end)
addEventHandler( "onClientMouseEnter", root,
function()
	if source == labelclose then
		guiSetVisible(close,false)
		guiSetVisible(close2,true)
	end
end)
guiSetVisible(close2, false)

function enable ()
if (isMenuOpened == false) then
	centerWindow(window)
    guiSetVisible(labelnewtext2,true)
    guiSetVisible(maps,true)
	guiSetVisible(report,true)
	guiSetVisible(cars,true)
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(icon_map_mapbtn, false)
	guiSetVisible(icon_map_carbtn, false)
	guiSetVisible(icon_map_jobbtn, false)
	guiSetVisible(icon_map_salonbtn, false)
	guiSetVisible(label_mapjobsbtn, false)
	guiSetVisible(label_jobtext, false)
	guiSetVisible(icon_mapbtn_fon, false)
	guiSetVisible(icon_map_background,false)  
	guiSetVisible(icon_salonbtn_fon, false)
	guiSetVisible(label_mapsalonbtn, false)
	guiSetVisible(label_mapsalonsbtn, false)
	guiSetVisible(label_mapcarsbtn, false)
	guiSetVisible(icon_carbtn_fon, false)
	guiSetVisible(labelnewtext5,true)
	guiSetVisible(labelnewtext6,true)
	guiSetVisible(labelnewtext7,true)
	guiSetVisible(labelnewtext8,true)
	guiSetVisible(labelnewtext9,true)
	guiSetVisible(question,true)
	guiSetVisible(label_salontext, false)
	guiSetVisible(label_cartext, false)
	guiSetVisible(labelcarkey, false)
	guiSetVisible(labeljobkey, false)
	guiSetVisible(labelnewtext,false)
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(window, true)
	showCursor(true)
	isMenuOpened = true
else
	guiSetVisible(labelnewtext2,false)
    guiSetVisible(maps,false)
	guiSetVisible(report,false)
	guiSetVisible(cars,false)
	guiSetVisible(labelnewtext3,false)
	guiSetVisible(icon_map_mapbtn, false)
	guiSetVisible(icon_map_carbtn, false)
	guiSetVisible(icon_map_jobbtn, false)
	guiSetVisible(icon_map_salonbtn, false)
	guiSetVisible(label_mapjobsbtn, false)
	guiSetVisible(label_jobtext, false)
	guiSetVisible(icon_mapbtn_fon, false)
	guiSetVisible(icon_map_background,false)  
	guiSetVisible(icon_salonbtn_fon, false)
	guiSetVisible(label_mapsalonbtn, false)
	guiSetVisible(label_mapsalonsbtn, false)
	guiSetVisible(label_mapcarsbtn, false)
	guiSetVisible(icon_carbtn_fon, false)
	guiSetVisible(labelnewtext5,false)
	guiSetVisible(labelnewtext6,false)
	guiSetVisible(labelnewtext7,false)
	guiSetVisible(labelnewtext8,false)
	guiSetVisible(labelnewtext9,false)
	guiSetVisible(question,false)
	guiSetVisible(label_salontext, false)
	guiSetVisible(label_cartext, false)
	guiSetVisible(labelcarkey, false)
	guiSetVisible(labeljobkey, false)
	guiSetVisible(labelnewtext,false)
	guiSetVisible(labelnewtext4,false)
	guiSetVisible(window, false)
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
	showCursor(false)
	executeCommandHandler ( "showmapoff", playerSource )
	isMenuOpened = false
end
end
bindKey("f9","down", enable)