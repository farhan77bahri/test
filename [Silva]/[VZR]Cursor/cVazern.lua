--[[


 ################################################
 #                                              #                                                  
 #             SCRIPT PRODUZIDO POR:            #
 #            FACEBOOK.COM/VAZERNMTA            #
 #                                              #
 #                                              #
 ################################################




]]



function cursorButton()
	showCursor(not isCursorShowing())
end
bindKey("m", "down", cursorButton)

