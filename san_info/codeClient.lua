local displayWidth, displayHeight = guiGetScreenSize();

local notificationData = {};

local notificationFont = dxCreateFont('files/fonts/roboto.ttf', 12 * 2, false);
local iconsFont = dxCreateFont('files/fonts/icons.ttf', 12 * 2, false);
local iconsFont2 = dxCreateFont('files/fonts/icons2.ttf', 12 * 2, false);
local iconsFont3 = dxCreateFont('files/fonts/icons3.ttf', 10 * 2, false);

addEventHandler('onClientRender', root,
	function()
		for k, v in pairs(notificationData) do
			if (v.State == 'fadeIn') then
				local alphaProgress = (getTickCount() - v.AlphaTick) / 650;
				local alphaAnimation = interpolateBetween(0, 0, 0, 255, 0, 0, alphaProgress, 'Linear');
				
				if (alphaAnimation) then
					v.Alpha = alphaAnimation;
				else
					v.Alpha = 255;
				end
				
				if (alphaProgress > 1) then
					v.Tick = getTickCount();
					v.State = 'openTile';
				end
			elseif (v.State == 'fadeOut') then
				local alphaProgress = (getTickCount() - v.AlphaTick) / 650;
				local alphaAnimation = interpolateBetween(255, 0, 0, 0, 0, 0, alphaProgress, 'Linear');
				
				if (alphaAnimation) then
					v.Alpha = alphaAnimation;
				else
					v.Alpha = 0;
				end
				
				if (alphaProgress > 1) then
					notificationData = {};
				end
			elseif (v.State == 'openTile') then
				local tileProgress = (getTickCount() - v.Tick) / 350;
				local tilePosition = interpolateBetween(v.StartX, 0, 0, v.EndX, 0, 0, tileProgress, 'Linear');
				local tileWidth = interpolateBetween(0, 0, 0, v.Width, 0, 0, tileProgress, 'Linear');
				
				if (tilePosition and tileWidth) then
					v.CurrentX = tilePosition;
					v.CurrentWidth = tileWidth;
				else
					v.CurrentX = v.EndX;
					v.CurrentWidth = v.Width;
				end
				
				if (tileProgress > 1) then
					v.State = 'fixTile';
					
					setTimer(function()
						v.Tick = getTickCount();
						v.State = 'closeTile';
					end, string.len(v.Text) * 45 + 5000, 1);
				end
			elseif (v.State == 'closeTile') then
				local tileProgress = (getTickCount() - v.Tick) / 350;
				local tilePosition = interpolateBetween(v.EndX, 0, 0, v.StartX, 0, 0, tileProgress, 'Linear');
				local tileWidth = interpolateBetween(v.Width, 0, 0, 0, 0, 0, tileProgress, 'Linear');
				
				if (tilePosition and tileWidth) then
					v.CurrentX = tilePosition;
					v.CurrentWidth = tileWidth;
				else
					v.CurrentX = v.StartX;
					v.CurrentWidth = 0;
				end
				
				if (tileProgress > 1) then
					v.AlphaTick = getTickCount();
					v.State = 'fadeOut';
				end
			elseif (v.State == 'fixTile') then
				v.Alpha = 255;
				v.CurrentX = v.EndX;
				v.CurrentWidth = v.Width;
			end
			
			dxDrawRectangle(v.CurrentX, 20, 25 + v.CurrentWidth, 25, tocolor(0, 0, 0, 150), _, true);
			
			if (v.Alpha == 255) then
				dxDrawText(v.Text, v.CurrentX + 26 + 10, 20, v.CurrentX + 26 + 10 + v.CurrentWidth - 20, 20 + 25, tocolor(0, 0, 0, 255), 0.50, notificationFont, 'center', 'center', true, false, true); -- szöveg
				dxDrawText(v.Text, v.CurrentX + 25 + 10, 20, v.CurrentX + 25 + 10 + v.CurrentWidth - 20, 20 + 25, tocolor(255, 255, 255, 255), 0.50, notificationFont, 'center', 'center', true, false, true); -- szöveg
			end
			
			if (v.Type == 'info') then
				dxDrawText('', v.CurrentX + 6, 20, v.CurrentX + 1 + 26 - 10, 20 + 25, tocolor(0, 0, 0, 255), 1, iconsFont, 'center', 'center', false, false, true);
				dxDrawText('', v.CurrentX + 5, 20, v.CurrentX + 1 + 25 - 10, 20 + 25, tocolor(0, 167, 255, v.Alpha), 1, iconsFont, 'center', 'center', false, false, true);
			elseif (v.Type == 'success') then
				dxDrawText('', v.CurrentX + 6, 20, v.CurrentX + 5 + 26 - 10, 20 + 25, tocolor(0, 0, 0, 255), 1, iconsFont, 'center', 'center', false, false, true);
				dxDrawText('', v.CurrentX + 5, 20, v.CurrentX + 5 + 25 - 10, 20 + 25, tocolor(124, 197, 118, v.Alpha), 1, iconsFont, 'center', 'center', false, false, true);
			elseif (v.Type == 'admin') then
				dxDrawText('', v.CurrentX + 6, 20, v.CurrentX + 3 + 26 - 10, 20 + 25, tocolor(0, 0, 0, 255), 1, iconsFont, 'center', 'center', false, false, true);
				dxDrawText('', v.CurrentX + 5, 20, v.CurrentX + 3 + 25 - 10, 20 + 25, tocolor(124, 197, 118, v.Alpha), 1, iconsFont, 'center', 'center', false, false, true);
			elseif (v.Type == 'admin2') then
				dxDrawText('', v.CurrentX + 6, 20, v.CurrentX + 3 + 26 - 10, 20 + 25, tocolor(0, 0, 0, 255), 1, iconsFont, 'center', 'center', false, false, true);
				dxDrawText('', v.CurrentX + 5, 20, v.CurrentX + 3 + 25 - 10, 20 + 25, tocolor(215, 85, 85, v.Alpha), 1, iconsFont, 'center', 'center', false, false, true);
			end
		end
	end
)

function addNotification(text, type)
	if (text and type) then
		if (notificationData ~= nil) then
			table.remove(notificationData, #notificationData);
		end
		
		table.insert(notificationData,
			{
				StartX = (displayWidth / 2) - (25 / 2),
				EndX = (displayWidth / 2) - ((dxGetTextWidth(text, 1.0, notificationFont) + 20 + 25) / 2),
				Text = text,
				Width = dxGetTextWidth(text, 1.0, notificationFont) + 20,
				Alpha = 0,
				State = 'fadeIn',
				Tick = 0,
				AlphaTick = getTickCount(),
				CurrentX = (displayWidth / 2) - (25 / 2),
				CurrentWidth = 0,
				Type = type or 'info'
			}
		);
		if type == "info" then
			playSound("files/i.mp3")
		elseif type == "success" then
			playSound("files/i.mp3")
		elseif type == "admin" then
			playSound("files/i.mp3")
		elseif type == "admin2" then
			playSound("files/i.mp3")
		end
	end
end
addEvent("boxos",true)
addEventHandler("boxos",root,addNotification)