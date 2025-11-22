-- Feito Por CantZ
screen = {guiGetScreenSize()}
screenW, screenH = guiGetScreenSize()
x, y = (screen[1]/1366), (screen[2]/768)
KepAlpha = 80 
font = DxFont("files/fonte.ttf", 9)

widgetsHud = {
	avatar = {
		["posX"] = x*1092,
		["posY"] = y*43,
		["posW"] = x*41,
		["posH"] = y*41,
	},
	menu = {
		["posX"] = x*1079,
		["posY"] = y*34,
		["posW"] = x*272,
		["posH"] = y*60,
	},
	menuNome = {
		["posX"] = x*1079,
		["posY"] = y*4.5,
		["posW"] = x*272,
		["posH"] = y*25.5,
	},
	vidaBg = {
		["posX"] = x*1146,
		["posY"] = y*44,
		["posW"] = x*194,
		["posH"] = y*16,
	},
	coleteBg = {
		["posX"] = x*1146,
		["posY"] = y*67,
		["posW"] = x*194,
		["posH"] = y*16,
	},
	vida = {
		["posX"] = x*1146,
		["posY"] = y*44,
		["posW"] = x*194,
		["posH"] = y*16,
	},
	colete = {
		["posX"] = x*1146,
		["posY"] = y*67,
		["posW"] = x*194,
		["posH"] = y*16,
	},
	bgMoney = {
		["posX"] = x*1079,
		["posY"] = y*98,
		["posW"] = x*272,
		["posH"] = y*24,
	},
	bgBank = {
		["posX"] = x*1079,
		["posY"] = y*126,
		["posW"] = x*272,
		["posH"] = y*24,
	},
	bgID = {
		["posX"] = x*1200,
		["posY"] = y*98,
		["posW"] = x*72,
		["posH"] = y*24,
	},
	bgLevel = {
		["posX"] = x*1200,
		["posY"] = y*126,
		["posW"] = x*72,
		["posH"] = y*24,
	},
	bgFome = {
		["posX"] = x*1279,
		["posY"] = y*98,
		["posW"] = x*72,
		["posH"] = y*24,
	},
	bgSede = {
		["posX"] = x*1279,
		["posY"] = y*126,
		["posW"] = x*72,
		["posH"] = y*24,
	},
	bgProcurado = {
		["posX"] = x*1279,
		["posY"] = y*154.5,
		["posW"] = x*72,
		["posH"] = y*24,
	},
	coinImg = {
		["posX"] = x*1089,
		["posY"] = y*103,
		["posW"] = x*13,
		["posH"] = y*13,
	},
	bankImg = {
		["posX"] = x*1088,
		["posY"] = y*131,
		["posW"] = x*14,
		["posH"] = y*14,
	},
	iconBg = {
		["posX"] = x*1151,
		["posY"] = y*47,
		["posW"] = x*11,
		["posH"] = y*34,
	},
	txtMoney = {
		["posX"] = x*1110,
		["posY"] = y*98,
		["posW"] = x*1348,
		["posH"] = y*122,
	},
	txtNome = {
		["posX"] = x*1090,
		["posY"] = y*5 -93,
		["posW"] = x*1348,
		["posH"] = y*122,
	},
	txtHora = {
		["posX"] = x*1310,
		["posY"] = y*5 -93,
		["posW"] = x*1348,
		["posH"] = y*122,
	},
	txtBank = {
		["posX"] = x*1110,
		["posY"] = y*125.5,
		["posW"] = x*1348,
		["posH"] = y*151,
	},
	txtFome = {
		["posX"] = x*1310,
		["posY"] = y*98,
		["posW"] = x*1348,
		["posH"] = y*122,
	},
	txtSede = {
		["posX"] = x*1310,
		["posY"] = y*125.5,
		["posW"] = x*1348,
		["posH"] = y*151,
	},
	txtID = {
		["posX"] = x*1230,
		["posY"] = y*98,
		["posW"] = x*1348,
		["posH"] = y*122,
	},
	txtLevel = {
		["posX"] = x*1230,
		["posY"] = y*125.5,
		["posW"] = x*1348,
		["posH"] = y*151,
	},
	txtProcurado = {
		["posX"] = x*1318,
		["posY"] = y*180.5,
		["posW"] = x*1348,
		["posH"] = y*151,
	},
    imgFome = {
		["posX"] = x*1289,
		["posY"] = y*102,
		["posW"] = x*14,
		["posH"] = y*14,
	},
	imgSede = {
		["posX"] = x*1289,
		["posY"] = y*130.9,
		["posW"] = x*13,
		["posH"] = y*13,
	},
    imgID = {
		["posX"] = x*1207,
		["posY"] = y*103,
		["posW"] = x*14,
		["posH"] = y*14,
	},
	imgLevel = {
		["posX"] = x*1207,
		["posY"] = y*130.8,
		["posW"] = x*15,
		["posH"] = y*15,
	},
	imgProcurado = {
		["posX"] = x*1289,
		["posY"] = y*157.9,
		["posW"] = x*14,
		["posH"] = y*14,
	},
	imgHora = {
		["posX"] = x*1293,
		["posY"] = y*10,
		["posW"] = x*14,
		["posH"] = y*14,
	},
};

local Enable = {
	"ammo", 
	"armour", 
	"clock",
	"health", 
	"money",
	"weapon", 
	"wanted",
	"area_name",
	"vehicle_name",
	"breath",
	"clock"
};

addEventHandler("onClientResourceStart", resourceRoot, function()
	for _, v in ipairs(Enable) do
		setPlayerHudComponentVisible(v, false)
	end
end)

function ShaiderRectangleMenu(x, y, w, h, borderColor, bgColor, postGUI)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = tocolor(0, 0, 0, 180)
		end
		if (not bgColor) then
			bgColor = borderColor
		end
		dxDrawRectangle(x, y, w, h, bgColor, postGUI);
		dxDrawRectangle(x, y - 1, w, 1, borderColor, postGUI);
		dxDrawRectangle(x, y + h, w, 1, borderColor, postGUI);
		dxDrawRectangle(x - 1, y, 1, h, borderColor, postGUI);
		dxDrawRectangle(x + w, y, 1, h, borderColor, postGUI);
	end
end

function dxDrawRectangleBorde(left, top, width, height, color, postgui)
    if not postgui then
        postgui = false;
    end

    left, top = left + 2, top + 2;
    width, height = width - 4, height - 4;

    dxDrawRectangle(left - 2, top, 2, height, color, postgui);
    dxDrawRectangle(left + width, top, 2, height, color, postgui);
    dxDrawRectangle(left, top - 2, width, 2, color, postgui);
    dxDrawRectangle(left, top + height, width, 2, color, postgui);

    dxDrawRectangle(left - 1, top - 1, 1, 1, color, postgui);
    dxDrawRectangle(left + width, top - 1, 1, 1, color, postgui);
    dxDrawRectangle(left - 1, top + height, 1, 1, color, postgui);
    dxDrawRectangle(left + width, top + height, 1, 1, color, postgui);

    dxDrawRectangle(left, top, width, height, color, postgui);
end

function convertNumber ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end