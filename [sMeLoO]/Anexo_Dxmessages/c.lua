local displayWidth, displayHeight = guiGetScreenSize();

local notificationData = {};

local notificationFont = dxCreateFont('files/fonts/roboto.ttf', 12 * 2, false);
local iconsFont = dxCreateFont('files/fonts/icons.ttf', 12 * 2, false);

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
			
			
			if (v.Alpha == 255) then
				dxDrawRectangle(v.CurrentX + 30, 20, 15 + v.CurrentWidth, 26, tocolor(0, 0, 0, 150), false);
				dxDrawText(v.Text, v.CurrentX + 40 + 10, 20, v.CurrentX + 25 + 10 + v.CurrentWidth - 20, 20 + 25, tocolor(255, 255, 255, 200), 0.40, notificationFont, 'center', 'center', true, false, true, true, false);
			end
			
			if (v.Type == 'error') then
				dxDrawRectangle(v.CurrentX, 20, 28, 26, tocolor(255, 0, 0, 150), false);
				dxDrawImage(v.CurrentX, 20, 28, 26, "files/img/error.png", 0, 0, 0, tocolor(255, 255, 255, 240), true);
			elseif (v.Type == 'warning') then
	            dxDrawRectangle(v.CurrentX, 20, 28, 26, tocolor(255, 255, 0, 150), false);
				dxDrawImage(v.CurrentX +1, 20, 25, 26, "files/img/warning.png", 0, 0, 0, tocolor(0, 0, 0, 240), true);
			elseif (v.Type == 'info') then
				dxDrawRectangle(v.CurrentX, 20, 28, 26, tocolor(16, 102, 231, 150), false);
				dxDrawImage(v.CurrentX +2, 20+1, 22, 23, "files/img/info.png", 0, 0, 0, tocolor(255, 255, 255, 240), true);
		elseif (v.Type == 'success') then
				dxDrawRectangle(v.CurrentX, 20, 28, 26, tocolor(0, 255, 0, 150), false);
				dxDrawImage(v.CurrentX, 20, 28, 26, "files/img/succes.png", 0, 0, 0, tocolor(255, 255, 255, 240), true);
			end
		end
	end
)

addEvent('Server:CallNotifications', true);
function createNotification(text, type)
	if (text and type) then
		if (notificationData ~= nil) then
			table.remove(notificationData, #notificationData);
		end
		
		table.insert(notificationData,
			{
				StartX = (displayWidth / 2) - (25 / 2),
				EndX = (displayWidth / 2) - ((dxGetTextWidth(text, 0.40, notificationFont) + 20 + 25) / 2),
				Text = text,
				Width = dxGetTextWidth(text, 0.40, notificationFont) + 20,
				Alpha = 0,
				State = 'fadeIn',
				Tick = 0,
				AlphaTick = getTickCount(),
				CurrentX = (displayWidth / 2) - (25 / 2),
				CurrentWidth = 0,
				Type = type or 'info'
			}
		);
		playSound("files/sfx/sound.mp3")
		--playSoundFrontEnd(11);
	end
end
addEventHandler('Server:CallNotifications', resourceRoot, createNotification);