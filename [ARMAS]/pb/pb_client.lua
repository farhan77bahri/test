----------- By Thunderking -----------
----------- Thunderking Always Is Here -----------
addEventHandler("onClientResourceStart", resourceRoot,
function()
		local screenW, screenH = guiGetScreenSize()
        pbWindow = guiCreateStaticImage((screenW - 1189) / 2, (screenH - 691) / 2, 1189, 691, "pb_back.png", false)

        pbTop = guiCreateStaticImage(0, 0, 1189, 36, "white.png", false, pbWindow)
        guiSetProperty(pbTop, "ImageColours", "tl:FFFF9595 tr:FFFF9595 bl:FFFF9595 br:FFFF9595")

        pbTopLabel = guiCreateLabel((1189 - 119) / 2, (36 - 15) / 2, 119, 15, "IRAN Game Paint-Ball", false, pbTop)
        guiSetFont(pbTopLabel, "default-bold-small")

        pbJoinWindow = guiCreateStaticImage(50, (691 - 465) / 2, 330, 465, "white.png", false, pbWindow)
        guiSetProperty(pbJoinWindow, "ImageColours", "tl:8AFF9595 tr:8AFF9595 bl:8AFF9595 br:8AFF9595")

        pbJoinTop = guiCreateStaticImage(0, 0, 330, 38, "white.png", false, pbJoinWindow)
        guiSetProperty(pbJoinTop, "ImageColours", "tl:B9FEF695 tr:B9FEF695 bl:B9FEF695 br:B9FEF695")

        pbJoinTopLabel = guiCreateLabel((330 - 98) / 2, (38 - 17) / 2, 98, 17, "Join Match Panel", false, pbJoinTop)
        guiSetFont(pbJoinTopLabel, "default-bold-small")
        guiLabelSetColor(pbJoinTopLabel, 1, 1, 0)

        pbJoinPic = guiCreateStaticImage((330 - 328) / 2, (465 - 192) / 2 - 100, 328, 192, "paintball.jpg", false, pbJoinWindow)
        pbCloseButton = guiCreateStaticImage(330 - 151 - 10, (465 - 41) / 2 +200, 151, 41, "close.png", false, pbJoinWindow)
        pbJoinButton = guiCreateStaticImage(10, (465 - 41) / 2 +200, 151, 41, "join.png", false, pbJoinWindow)
        pbMainLabel = guiCreateLabel(11, 246, 309, 141, "Baraye Join Shodan Dar Match Bar Rooye Join \n Va Baraye Bastan Kamel Panel Bar Rooye \n Button Close Click Konid! \n \n \n Hamchenin Mitavanid Baraye Sakhtan Match \nMape Marboote Va Tedad Round \nRa Moshakhas Konid Va Sepas \n Bar Rooye Create Match Bzanid!", false, pbJoinWindow)
        guiSetFont(pbMainLabel, "default-bold-small")
        guiLabelSetColor(pbMainLabel, 1, 1, 0)

        pbCreateWindow = guiCreateStaticImage(1189 - 330 - 50, (691 - 465) / 2, 330, 465, "white.png", false, pbWindow)
        guiSetProperty(pbCreateWindow, "ImageColours", "tl:8AFF9595 tr:8AFF9595 bl:8AFF9595 br:8AFF9595")

        pbCreateTop = guiCreateStaticImage(0, 0, 330, 37, "white.png", false, pbCreateWindow)
        guiSetProperty(pbCreateTop, "ImageColours", "tl:B9FEF695 tr:B9FEF695 bl:B9FEF695 br:B9FEF695")

        pbCreateTopLabel = guiCreateLabel((330 - 112) / 2, (37 - 16) / 2, 112, 16, "Create Match Panel", false, pbCreateTop)
        guiSetFont(pbCreateTopLabel, "default-bold-small")
        guiLabelSetColor(pbCreateTopLabel, 1, 1, 0)

        pbMap1 = guiCreateStaticImage(0, (465 - 89) / 2 -125, 103, 89, "paintball.jpg", false, pbCreateWindow)
        pbMap2 = guiCreateStaticImage((330 - 103) / 2, (465 - 89) / 2 -125, 103, 89, "shahrak.jpg", false, pbCreateWindow)
        pbMap3 = guiCreateStaticImage(330 - 103 , (465 - 89) / 2 -125, 103, 89, "jungle.jpg", false, pbCreateWindow)
        pbMap4 = guiCreateStaticImage(0, (465 - 89) / 2 -25, 103, 89, "keshti.jpg", false, pbCreateWindow)
        pbMap5 = guiCreateStaticImage((330 - 103) / 2, (465 - 89) / 2 -25, 103, 89, "carter.jpg", false, pbCreateWindow)
		pbMap6 = guiCreateStaticImage(330 - 103 , (465 - 89) / 2 -25, 103, 89, "hotel.jpg", false, pbCreateWindow)
        pbm4 = guiCreateStaticImage(0, (465 - 35) / 2 +100, 99, 35, "m4.png", false, pbCreateWindow)
        pbdeagle = guiCreateStaticImage((330 - 99) / 2, (465 - 35) / 2 +100, 99, 35, "deagle.png", false, pbCreateWindow)
        pbrifle = guiCreateStaticImage(330 - 99, (465 - 35) / 2 +100, 99, 35, "rifle.png", false, pbCreateWindow)
        pbStart = guiCreateStaticImage((330 - 146) / 2, (465 - 39) / 2 +200, 146, 39, "create.png", false, pbCreateWindow)   
		guiSetProperty(pbWindow, "Visible", "False")
end
)

showCursor(false)

function PaintBallRoBazKon(root)
	if root == getLocalPlayer() then
            guiSetProperty(pbWindow, "Visible", "True")
            showCursor(true)
            setElementData(root, "pbMap", nil)
            setElementData(root, "pbGunSet", nil)
		
	end
end
addEvent("PaintBallRoBazKon",true)
addEventHandler("PaintBallRoBazKon", root, PaintBallRoBazKon)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == pbCloseButton then
		guiSetProperty(pbWindow, "Visible", "False")
        showCursor(false)
        setElementData(getLocalPlayer(), "pbMap", nil)
	elseif source == pbMap1 then
        guiStaticImageLoadImage ( pbJoinPic, "paintball.jpg" )
        setElementData(getLocalPlayer(), "pbMap", 1)
	elseif source == pbMap2 then
        guiStaticImageLoadImage ( pbJoinPic, "shahrak.jpg" )
        setElementData(getLocalPlayer(), "pbMap", 2)
	elseif source == pbMap3 then
        guiStaticImageLoadImage ( pbJoinPic, "jungle.jpg" )
        setElementData(getLocalPlayer(), "pbMap", 3)
	elseif source == pbMap4 then
        guiStaticImageLoadImage ( pbJoinPic, "keshti.jpg" )
        setElementData(getLocalPlayer(), "pbMap", 4)
	elseif source == pbMap5 then
        guiStaticImageLoadImage ( pbJoinPic, "carter.jpg" )
        setElementData(getLocalPlayer(), "pbMap", 5)
	elseif source == pbMap6 then
        guiStaticImageLoadImage ( pbJoinPic, "hotel.jpg" )
        setElementData(getLocalPlayer(), "pbMap", 6)
    elseif source == pbm4 then
        if getElementData(getLocalPlayer(), "pbMap") > 0  then
            exports.san_infobox:addNotification("M4 Baraye Paintball Set Shod!", "success")
            setElementData(getLocalPlayer(), "pbGunSet", 31)
        elseif getElementData(getLocalPlayer(), "pbMap") == nil then
            exports.san_infobox:addNotification("Lotfan Ebteda Yek Map Ra Entekhab Konid!", "success")
        end
    elseif source == pbdeagle then
        if getElementData(getLocalPlayer(), "pbMap") > 0  then
            exports.san_infobox:addNotification("Deagle Baraye Paintball Set Shod!", "success")
            setElementData(getLocalPlayer(), "pbGunSet", 24)
        elseif getElementData(getLocalPlayer(), "pbMap") == nil then
            exports.san_infobox:addNotification("Lotfan Ebteda Yek Map Ra Entekhab Konid!", "success")
        end
    elseif source == pbrifle then
        if getElementData(getLocalPlayer(), "pbMap") > 0  then
            exports.san_infobox:addNotification("Rifle Baraye Paintball Set Shod!", "success")
            setElementData(getLocalPlayer(), "pbGunSet", 33)
        elseif getElementData(getLocalPlayer(), "pbMap") == nil then
            exports.san_infobox:addNotification("Lotfan Ebteda Yek Map Ra Entekhab Konid!", "success")
        end
    elseif source == pbJoinButton then
        triggerServerEvent("onClientClickedJoin", getLocalPlayer(), getLocalPlayer() )
    elseif source == pbStart then
        triggerServerEvent("onClientClickedCreate", getLocalPlayer(), getLocalPlayer() )
	end
end)

function paintBallRoBeband(root)
    if root == getLocalPlayer() then
        guiSetProperty(pbWindow, "Visible", "False")
        showCursor(false)
        setElementData(getLocalPlayer(), "pbMap", nil)
        setElementData(getLocalPlayer(), "pbGunSet", nil)
	end
end
addEvent("pbForceClose",true)
addEventHandler("pbForceClose", root, paintBallRoBeband)

function dominatingsound(attacker)
	  if attacker == getLocalPlayer() then
	  local dominating = playSound("VoiceEffects/dominating.mp3",false)
	  end
end
addEvent("dominatingsound",true)
addEventHandler("dominatingsound", getRootElement(), dominatingsound)

function godlikesound(attacker)
	  if attacker == getLocalPlayer() then
	  local godlike = playSound("VoiceEffects/godlike.mp3",false)
	  end
end
addEvent("godlikesound",true)
addEventHandler("godlikesound", getRootElement(), godlikesound)

function headshotsound(attacker)
	  if attacker == getLocalPlayer() then
		local headshot = playSound("VoiceEffects/headshot.mp3",false)
	  end
end
addEvent("headshotsound",true)
addEventHandler("headshotsound", getRootElement(), headshotsound)

function holyshiiitsound(attacker)
	  if attacker == getLocalPlayer() then
	  local holyshiiit = playSound("VoiceEffects/holyshiiit.mp3",false)
	  end
end
addEvent("holyshiiitsound",true)
addEventHandler("holyshiiitsound", getRootElement(), holyshiiitsound)


rootElement = getRootElement()
client = getLocalPlayer()

editor_main = guiCreateWindow(0.2295,0.1263,0.5967,0.5781,"PaintBall System",true)
guiWindowSetSizable(editor_main,false)
guiSetProperty(editor_main,"CaptionColour","FFFF0000")
guiSetVisible(editor_main,false)
guiCreateLabel(0.0229,0.0608,0.4501,0.0811,"Script Path:",true,editor_main)
script_path_edit = guiCreateEdit(0.0196,0.1104,0.5712,0.0631,"",true,editor_main)
script_memo = guiCreateMemo(0.0164,0.2658,0.964,0.536,"",true,editor_main)
guiSetProperty(script_memo,"ActiveSelectionColour","FFFF0000")
load_script_button = guiCreateButton(0.6105,0.1171,0.1849,0.0541,"Load Script",true,editor_main)
save_script_button = guiCreateButton(0.0147,0.8964,0.2782,0.0766,"Save Script",true,editor_main)
browse_script_button = guiCreateButton(0.8052,0.1149,0.1588,0.0586,"Browse",true,editor_main)
reload_script_button = guiCreateButton(0.3077,0.8964,0.2782,0.0766,"Reload Script",true,editor_main)
goto_line_button = guiCreateButton(0.6007,0.8964,0.2782,0.0766,"Goto line",true,editor_main)
create_resource_button = guiCreateButton(0.7807,0.1937,0.1849,0.0541,"Create resource",true,editor_main)
close_editor_button = guiCreateButton(0.946,0.045,0.0393,0.0473,"X",true,editor_main) 
script_editor_info_label = guiCreateLabel(0.0262,0.1937,0.5663,0.0631,"",true,editor_main)

goto_line_window = guiCreateWindow(0.415,0.276,0.1582,0.1706,"Goto line",true)
guiSetProperty(goto_line_window,"CaptionColour","FFFF0000")
guiWindowSetSizable(goto_line_window,false)
guiSetVisible(goto_line_window,false)
goto_line_edit = guiCreateEdit(0.1049,0.3588,0.7901,0.2137,"",true,goto_line_window)
guiLabelSetColor(guiCreateLabel(20,23,232,27,"Insert line number",false,goto_line_window),0,255,0)
go_line_button = guiCreateButton(0.0617,0.6565,0.2346,0.2443,"Go",true,goto_line_window)
cancel_line_button = guiCreateButton(0.3272,0.6565,0.6049,0.2443,"Cancel",true,goto_line_window) 

script_browser_window = guiCreateWindow(0.2666,0.1693,0.5195,0.4609,"Script browser",true)
guiSetProperty(script_browser_window,"CaptionColour","FFFF0000")
guiSetAlpha(script_browser_window,0.8)
guiSetVisible(script_browser_window,false)
guiWindowSetSizable(script_browser_window,false)
script_browser_grid_resources = guiCreateGridList(0.0244,0.161,0.3083,0.8107,true,script_browser_window)
guiGridListAddColumn(script_browser_grid_resources,"Resources",0.8)
guiCreateLabel(0.0508,0.0876,0.2575,0.065,"Resources",true,script_browser_window)
script_browser_grid_content = guiCreateGridList(0.3872,0.1638,0.3083,0.8079,true,script_browser_window)
guiGridListAddColumn(script_browser_grid_content,"Scripts",0.8)
guiCreateLabel(0.4154,0.0904,0.2726,0.0593,"Content",true,script_browser_window)
script_browser_load_script = guiCreateButton(0.7218,0.1695,0.25,0.0734,"Load Script",true,script_browser_window)
script_browser_close = guiCreateButton(0.7237,0.274,0.25,0.0734,"Close",true,script_browser_window)

resource_creator_window = guiCreateWindow(0.2353,0.129,0.5918,0.5104,"Resource creator",true)
guiSetProperty(resource_creator_window,"CaptionColour","FFFF0000")
guiWindowSetSizable(resource_creator_window,false)
guiSetVisible(resource_creator_window,false)
guiLabelSetColor(guiCreateLabel(0.0293,0.0663,0.447,0.074,"Resource name:",true,resource_creator_window),255,0,0)
resource_name_edit = guiCreateEdit(0.1733,0.0587,0.5363,0.0689,"MyResource",true,resource_creator_window)
guiLabelSetColor(guiCreateLabel(0.0293,0.2602,0.4898,0.0714,"meta.xml:",true,resource_creator_window),0,255,0)
guiCreateLabel(0.0271,0.3393,0.2889,0.0612,"Name:",true,resource_creator_window)
meta_name_edit = guiCreateEdit(0.0974,0.3291,0.467,0.0714,"None",true,resource_creator_window)
guiCreateLabel(0.0226,0.4464,0.3499,0.0663,"Author:",true,resource_creator_window)
meta_author_edit = guiCreateEdit(0.099,0.4388,0.467,0.0714,tostring(getPlayerName(client)),true,resource_creator_window)
guiCreateLabel(0.0226,0.5663,0.2754,0.0561,"Description:",true,resource_creator_window)
meta_description_edit = guiCreateEdit(0.132,0.5536,0.4323,0.0714,"None",true,resource_creator_window)
guiCreateLabel(0.0181,0.6735,0.395,0.0587,"Version:",true,resource_creator_window)
meta_version_edit = guiCreateEdit(0.0974,0.6633,0.467,0.0714,"1.0",true,resource_creator_window)
guiCreateLabel(0.0226,0.7755,0.3679,0.0638,"Type:",true,resource_creator_window)
meta_type_edit = guiCreateEdit(0.0792,0.7653,0.4884,0.0714,"script",true,resource_creator_window)
guiLabelSetColor(guiCreateLabel(0.6403,0.2653,0.302,0.074,"Create client & server scripts",true,resource_creator_window),255,255,0)
guiCreateLabel(0.5842,0.4388,0.368,0.0714,"Client script name:",true,resource_creator_window)
meta_client_edit = guiCreateEdit(0.5858,0.523,0.3828,0.0842,"",true,resource_creator_window)
guiCreateLabel(0.5858,0.648,0.368,0.0714,"Server script name:",true,resource_creator_window)
meta_server_edit = guiCreateEdit(0.5891,0.727,0.3828,0.0842,"",true,resource_creator_window)
create_resource = guiCreateButton(0.0347,0.8903,0.1865,0.074,"Create",true,resource_creator_window)
cancel_create_resource = guiCreateButton(0.2525,0.8903,0.1865,0.074,"Cancel",true,resource_creator_window)

function visible_editor()
if guiGetVisible(editor_main) == true then
guiSetVisible(editor_main,false)
showCursor(false)
guiSetInputEnabled(false)
else
guiSetVisible(editor_main,true)
showCursor(true)
guiSetInputEnabled(true)
  end
end
addEvent("show_editor",true)
addEventHandler("show_editor",rootElement,visible_editor)

function explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1))
    pos = sp + 1
  end
  table.insert(arr,string.sub(str,pos))
  return arr
end
 
function getLineIndex(mystring, targetLine)
  local exp = explode("\n", mystring)
  local index=0
  for i=1, targetLine-1 do
    index = index + exp[i]:len()
  end
  return index
end
  
function onGUIClick()
if (source == close_editor_button) then
guiSetVisible(editor_main,false)
showCursor(false)
guiSetInputEnabled(false)
elseif (source == load_script_button) then
triggerServerEvent("open_script",client,client,guiGetText(script_path_edit))
elseif (source == save_script_button) then
triggerServerEvent("save_script",client,client,guiGetText(script_path_edit),guiGetText(script_memo))
elseif (source == reload_script_button) then
triggerServerEvent("reload_script",client,client,guiGetText(script_path_edit))
elseif (source == goto_line_button) then
guiSetVisible(goto_line_window,true)
guiBringToFront(goto_line_window,true)
elseif (source == go_line_button) then
guiMemoSetCaretIndex(script_memo, getLineIndex(guiGetText(script_memo), guiGetText(goto_line_edit)))
guiSetVisible(goto_line_window,false)
elseif (source == cancel_line_button) then
guiSetVisible(goto_line_window,false)
guiBringToFront(editor_main,true)
elseif (source == browse_script_button) then
guiSetVisible(script_browser_window,true)
guiBringToFront(script_browser_window,true)
triggerServerEvent("get_resources",client,client)
elseif (source == script_browser_grid_resources) then
selected = guiGridListGetSelectedItem ( script_browser_grid_resources )
if ( selected ) then
guiGridListClear(script_browser_grid_content)
end
resName = guiGridListGetItemText ( script_browser_grid_resources, guiGridListGetSelectedItem ( script_browser_grid_resources ), 1 )
triggerServerEvent("get_content",client,client,resName)
elseif (source == script_browser_close) then
guiSetVisible(script_browser_window,false)
guiBringToFront(editor_main,true)
guiGridListClear(script_browser_grid_resources)
guiGridListClear(script_browser_grid_content)
elseif (source == script_browser_load_script) then
selected = guiGridListGetSelectedItem ( script_browser_grid_content )
if ( selected ) then
scriptName_1 = guiGridListGetItemText ( script_browser_grid_content, guiGridListGetSelectedItem ( script_browser_grid_content ), 1 )
resName_1 = guiGridListGetItemText ( script_browser_grid_resources, guiGridListGetSelectedItem ( script_browser_grid_resources ), 1 )
scriptName_2 = tostring(scriptName_1)
resName_2 = tostring(resName_1)
if #scriptName_2 >= 1 and #resName_2 >= 1 then
triggerServerEvent("open_script_browser",client,client,resName_2,scriptName_2)
guiGridListClear(script_browser_grid_resources)
guiGridListClear(script_browser_grid_content)
guiSetVisible(script_browser_window,false)
guiSetText(script_path_edit,resName_2.."/"..scriptName_2)
else outputChatBox("Something got wrong, select a resource and a script to load!",255,0,0)
end
end
elseif (source == create_resource_button) then
guiSetVisible(resource_creator_window,true)
guiBringToFront(resource_creator_window,true)
elseif (source == cancel_create_resource) then
guiSetVisible(resource_creator_window,false)
elseif (source == create_resource) then
resourceName = guiGetText(resource_name_edit)
name = guiGetText(meta_name_edit)
author = guiGetText(meta_author_edit)
description = guiGetText(meta_description_edit)
version = guiGetText(meta_version_edit)
type = guiGetText(meta_type_edit)
clientSide = guiGetText(meta_client_edit)
serverSide = guiGetText(meta_server_edit)
triggerServerEvent("create_resource",client,client,resourceName,name,author,description,version,type,clientSide,serverSide)
guiSetVisible(resource_creator_window,false)
 end
end
addEventHandler("onClientGUIClick",rootElement,onGUIClick)

function return_msg(text,r,g,b)
guiSetText(script_editor_info_label,text)
guiLabelSetColor(script_editor_info_label,r,g,b)
end
addEvent("return_message",true)
addEventHandler("return_message",rootElement,return_msg)

function return_open_script(text)
guiSetText(script_memo,text)
end
addEvent("return_script_open",true)
addEventHandler("return_script_open",rootElement,return_open_script)

addEvent("return_resources",true)
addEventHandler("return_resources",rootElement,
function (name)
row = guiGridListAddRow(script_browser_grid_resources)
guiGridListSetItemText (script_browser_grid_resources, row, 1, name, false, false )
end)

addEvent("return_content",true)
addEventHandler("return_content",rootElement,
function (src)
if src then
row = guiGridListAddRow(script_browser_grid_content)
guiGridListSetItemText (script_browser_grid_content, row, 1, src, false, false )
  end
end)
----------- By Thunderking -----------
----------- Thunderking Always Is Here -----------