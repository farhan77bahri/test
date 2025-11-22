guiSetInputMode("no_binds_when_editing")
_guiCreateStaticImage = guiCreateStaticImage
guiCreateStaticImage = function ( x, y, width, height, path, relative, parent, color )
	if not parent then parent = nil end
	staticImage = _guiCreateStaticImage ( x, y, width, height, path, relative, parent, color )
	if color then
		guiSetProperty ( staticImage, "ImageColours", "tl:FF"..color.." tr:FF"..color.." bl:FF"..color.." br:FF"..color.."" )
	end
	return staticImage
end
guiStaticImageSetColor = function ( element, color )
	guiSetProperty ( element, "ImageColours", "tl:FF"..color.." tr:FF"..color.." bl:FF"..color.." br:FF"..color.."" )
end
ScrollPane = {}
Edit = {}
_guiCreateEdit = guiCreateEdit
guiCreateEdit = function ( x, y, width, height, text, relative, parent )
	if (relative) then
		width, height = getAbsoluteFromRelative(parent,width,height)
		relative = false
	end
	local edit = _guiCreateEdit ( x, y, width, height, text, relative, parent )
	addEventHandler("onClientGUIChanged",edit,setEditText)
	guiEditSetMaxLength(edit,width/8)
	guiSetAlpha(edit,0)
	local img = guiCreateStaticImage ( x, y, width, height, "Imagens/transparent.png", relative, parent, "5e5e5e" )
	guiSetEnabled(img,false)
	local text = guiCreateLabel ( 7, 0, width, height, text, relative, img )
	guiLabelSetColor(text,255, 255, 255)
	guiSetFont ( text, "default-normal" )
	guiLabelSetVerticalAlign(text,"center")
	Edit[edit] = {}
	Edit[edit].img = img
	Edit[edit].text = text
	
	return edit
end
function setEditText(element)
	guiSetText(Edit[element].text,guiGetText(element))
end
_guiCreateScrollPane = guiCreateScrollPane
guiCreateScrollPane = function ( x, y, width, height, relative, parent )
	local panebg = guiCreateStaticImage ( x, y, width-20, height, "Imagens/transparent.png", relative, parent )
	guiSetProperty ( panebg, "ImageColours", "tl:00000000 tr:00000000 bl:00000000 br:00000000" )
	local pane = _guiCreateScrollPane ( 0, 0, width, height, relative, panebg )
	local scrollbg = guiCreateStaticImage ( x+width-20, y, 20, height, "Imagens/transparent.png", relative, parent )
	guiSetProperty ( scrollbg, "ImageColours", "tl:00000000 tr:00000000 bl:00000000 br:00000000" )
	local scrollBar = guiCreateStaticImage ( 10, 5, 2, height-10, "Imagens/transparent.png", relative, scrollbg )
	guiStaticImageSetColor(scrollBar,"CCCCCC")
	local scrollBar2 = guiCreateStaticImage ( 10, 5, 2, 0, "Imagens/transparent.png", relative, scrollbg )
	guiStaticImageSetColor(scrollBar2,"CCCCCC")
	local scroll = guiCreateStaticImage ( 2, 3, 16, 16, "Imagens/music.png", relative, scrollbg )
	guiStaticImageSetColor(scroll,"444444")
	ScrollPane[pane] = {}
	ScrollPane[pane].scroll = {scroll = scroll, scrollBar = scrollBar, scrollBar2 = scrollBar2, panebg=panebg, scrollbg=scrollbg}
	guiSetEnabled(scrollBar,false)
	addEventHandler("onClientGUIMouseDown", scroll, mouseDown, false)
	return pane
end
function mouseDown ( btn, x, y )
	if btn == "left" then
		local elementPos
		if (source == gui.staticimage[2]) then
			clickedElement = source
			elementPos = { guiGetPosition( getElementParent(gui.staticimage[2]), false ) }
			offsetPos = { x - elementPos[ 1 ], y - elementPos[ 2 ] }
			return
		end
		for i,v in pairs(ScrollPane) do
			if v.scroll and (v.scroll.scroll == source) then
				clickedElement = source
				elementPos = { guiGetPosition( source, false ) }
				offsetPos = { elementPos[ 1 ], y - elementPos[ 2 ] }
				return
			end
		end
	end
end
addEventHandler("onClientGUIMouseUp", resourceRoot,
	function ( btn, x, y )
		if btn == "left" then
			clickedElement = nil
		end
	end
)
addEventHandler("onClientClick", getRootElement(),
	function(button,state)
		if button == "left" and state == "up" then
			if ( clickedElement ) then clickedElement = nil end
		end
	end
)
addEventHandler( "onClientCursorMove", getRootElement( ),
    function ( _, _, x, y )
		if not clickedElement then return end
		if (gui.staticimage[2] == clickedElement) then
			guiSetPosition( getElementParent(gui.staticimage[2]), x - offsetPos[ 1 ], y - offsetPos[ 2 ], false )
			return
		end
		local _, heightScroll = guiGetSize ( clickedElement, false )
		local _, heightScrollBar = guiGetSize ( getElementParent(clickedElement), false )
		heightScrollBar = heightScrollBar - 5
		if (y - offsetPos[ 2 ] >= 0 and ((y - offsetPos[ 2 ])+heightScroll) <= heightScrollBar) then
			guiSetPosition( clickedElement, offsetPos[ 1 ], y - offsetPos[ 2 ] + 3, false )
			posyScroll = y - offsetPos[ 2 ]
			for i,v in pairs(ScrollPane) do
				if (v.scroll.scroll == clickedElement) then
					guiSetSize ( v.scroll.scrollBar2, 2, posyScroll, false )
					local calc = (((posyScroll)*100)/(heightScrollBar-heightScroll))
					guiScrollPaneSetVerticalScrollPosition (i, calc)
					return
				end
			end
		end
    end
)