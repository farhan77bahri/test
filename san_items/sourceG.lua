-- inventoryElem = { 'bag', 'weapon', 'key', 'craft'} -- // Inventory szétválasztások
inventoryElem = { 'craft', 'weapon', 'key', 'bag'} -- // Inventory szétválasztások
row = 5 -- // Sor
column = 10 -- // Oszlop
baseWeight = 40 --// Alap súly
oneLevelBag = 55 -- // Sima táska
premiumLevelBag = 80-- // Sima táska
oneLevelBagID = 150 -- // Sima táska ID
premiumLevelBagID = 151 -- // Prémium táska ID
maxCraftSlot = 16 -- // Craft slot
maxCraftRecipe = 9 -- // max Craft receptek
itemLists = {
	--Kaja
	{name = "Hamburger", desc="Deliciousness put together dar mazeye morede alaghe Amrika.", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --1
	{name = "Taco", desc="Behtarin fast food dar shahr", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --2
	{name = "Big Mac", desc="", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --3
	{name = "Sandwich", desc="", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --4
	{name = "Pizza slice", desc="", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --5
	{name = "Cake", desc="", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --6
	{name = "Orange soft drink in glass", desc="", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --7
	{name = "Bottled water", desc="", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --8
	{name = "Bottled beer", desc="", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --9
	{name = "Vodka", desc="", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --10
	{name = "Whiskey", desc="", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --11
	{name = "Cola", desc="", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --12
	{name = "A packet of cigarettes", desc="", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --13
	{name = "Cocaine", desc="", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --14
	{name = "Heroin", desc="", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --15
	{name = "iphone", desc="", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --16
	{name = "Vehicle key", desc="", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'key'}, --17
	{name = "Apartment key", desc="", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'key'}, --18
	{name = "Safe key", desc="", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'key'}, --19
	{name = "radio", desc="", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --20
	{name = "Phone book", desc="", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --21
	{name = "Dice", desc="", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --22
	{name = "A tension iron", desc="", weight=0.4, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --23
	{name = "Watch", desc="", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --24
	{name = "Rope", desc="", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --25
	{name = "Gas can", desc="", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --26
	{name = "HI-FI", desc="", weight=0.4, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --27
	{name = "License", desc="", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --28
	{name = "ID card", desc="", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --29
	{name = "Gas mask", desc="", weight=0.4, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --30
	{name = "Smoke grenade", desc="", weight=0.5, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --31
	{name = "Handcuffs", desc="", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --32
	{name = "Handcuff key", desc="", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --33
	{name = "Badge", desc="", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --34
	{name = "Boxer", desc="", weight=1, stack = false, weaponID = 1, AmmoID = false, level=2, itemTypes= 'weapon'}, --35
	{name = "Ax", desc="", weight=1, stack = false, weaponID = 2, AmmoID = false, level=0, itemTypes= 'bag'}, --36
	{name = "Rubber stick", desc="", weight=0.7, stack = false, weaponID = 3, AmmoID = false, level=2, itemTypes= 'weapon'}, --37
	{name = "Knife", desc="", weight=0.7, stack = false, weaponID = 4, AmmoID = false, level=2, itemTypes= 'weapon'}, --38
	{name = "Baseball bat", desc="", weight=1, stack = false, weaponID = 5, AmmoID = false, level=2, itemTypes= 'weapon'}, --39
	{name = "Premium Axe", desc="", weight=0.2, stack = false, weaponID = 12, AmmoID = false, level=0, itemTypes= 'bag'}, --40
	{name = "Premium Pickaxe", desc="", weight=1, stack = false, weaponID = 10, AmmoID = false, level=0, itemTypes= 'bag'}, --41
	{name = "Pick", desc="A bányászához használatos tárgy.", weight=1, stack = false, weaponID = 11, AmmoID = false, level=0, itemTypes= 'bag'}, --42
	{name = "Molotov cocktail", desc="Erős tűz keletkezik ha eldobod.", weight=0.4, stack = false, weaponID = 18, AmmoID = false, level=4, itemTypes= 'weapon'}, --43
	{name = "Desert Eagle", desc="Erős lővedéket tartalmazó, életveszélyes fegyver.", weight=2.2, stack = false, weaponID = 24, AmmoID = 57, level=3, itemTypes= 'weapon'}, --44
	{name = "Shocking", desc="A rendvédelem közkedvelt fegyvere.", weight=1, stack = false, weaponID = 23, AmmoID = false, level=0, itemTypes= 'weapon'}, --45
	{name = "Colt-45", desc="A pisztolyok legkisebb darabja.", weight=1.5, stack = false, weaponID = 22, AmmoID = 57, level=3, itemTypes= 'weapon'}, --46
	{name = "Shotgun with a sawed-off barrel", desc="Nagykaliberű fegyver, amely nagyon veszélyes.", weight=3, stack = false, weaponID = 26, AmmoID = 60, level=3, itemTypes= 'weapon'}, --47
	{name = "Combat shotgun", desc="A Terrorelhárítók közkedvelt fegyvere.", weight=4, stack = false, weaponID = 27, AmmoID = 60, level=3, itemTypes= 'weapon'}, --48
	{name = "Micro Uzi", desc="A bandások közkedvelt fegyvere.", weight=3.5, stack = false, weaponID = 28, AmmoID = 61, level=3, itemTypes= 'weapon'}, --49
	{name = "MP5", desc="A Terrorelhárítók közkedvelt fegyvere.", weight=2.5, stack = false, weaponID = 29, AmmoID = 61, level=3, itemTypes= 'weapon'}, --50
	{name = "AK-47", desc="Nagykaliberű fegyver, amely veszélyes.", weight=4.1, stack = false, weaponID = 30, AmmoID = 58, level=3, itemTypes= 'weapon'}, --51
	{name = "M16", desc="Nagykaliberű fegyver, amely veszélyes.", weight=3.5, stack = false, weaponID = 31, AmmoID = 59, level=3, itemTypes= 'weapon'}, --52
	{name = "Tec-9", desc="A bandások közkedvelt fegyvere.", weight=1.8, stack = false, weaponID = 32, AmmoID = 61, level=3, itemTypes= 'weapon'}, --53
	{name = "Spray", desc="A falfestés kedvenc eszköze.", weight=0.7, stack = false, weaponID = 41, AmmoID = false, level=1, itemTypes= 'weapon'}, --54
	{name = "Fire extinguisher", desc="A tűz eloltásához használatos tárgy.", weight=1, stack = false, weaponID = 42, AmmoID = false, level=0, itemTypes= 'weapon'}, --55
	{name = "camera", desc="Pár jó kép bármikor jól jön.", weight=0.5, stack = false, weaponID = 43, AmmoID = false, level=1, itemTypes= 'weapon'}, --56
	{name = "9mm cartridge", desc="A kiskaliberű fegyverek lőszere.", weight=0.03, stack = true, weaponID = false, AmmoID = false, level=3, itemTypes= 'weapon'}, --57
	{name = "AK-47-es cartridge", desc="Egy erős nagykaliberű fegyverbe.", weight=0.04, stack = true, weaponID = false, AmmoID = false, level=3, itemTypes= 'weapon'}, --58
	{name = "M4A16-os cartridge", desc="Egy erős nagykaliberű fegyverbe.", weight=0.04, stack = true, weaponID = false, AmmoID = false, level=3, itemTypes= 'weapon'}, --59
	{name = "Sörétes cartridge", desc="Sörétes lőszer shotgunhoz.", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=3, itemTypes= 'weapon'}, --60
	{name = "Gépfegyver cartridge", desc="Gépfegyverekhez használt lőszer.", weight=0.03, stack = true, weaponID = false, AmmoID = false, level=3, itemTypes= 'weapon'}, --61
	{name = "Safe", desc="A titkos dolgok tárolója.", weight=9.2, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --62
	{name = "Unknown object", desc="Nincs leírás...", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --63
	{name = "First aid kit", desc="Az életmentéshez szükséges.", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --64
	{name = "Medicine", desc="Fájdalom csillapító.", weight=0.02, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --65
	{name = "Unknown object", desc="Nincs leírás...", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --66
	{name = "Lighter", desc="A cigihez bármikor jól jön.", weight=0.05, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --67
	{name = "Magnum Sniper", desc="Egy célzás és baaammm.", weight=5, stack = false, weaponID = 34, AmmoID = 69, level=3, itemTypes= 'weapon'}, --68	
	{name = "7mm-es cartridge", desc="Nagykaliberű fegyverek lőszere.", weight=0.04, stack = true, weaponID = false, AmmoID = false, level=3, itemTypes= 'weapon'}, --69
	{name = "Fixed card", desc="Egyből megjavítja a járművet az tuti.", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --70
	{name = "Tankoló kártya", desc="Egyből feltankolja a járművet az tuti.", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --71
	{name = "PP jegy (5000)", desc="5000 PP-t tartalmazó jegy!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --72
	{name = "Feszítővágó", desc="Tűzoltóknak óriási szükség lehet rá.", weight=2.5, stack = false, weaponID = 6, AmmoID = false, level=0, itemTypes= 'bag'}, --73
	{name = "ÉK", desc="A jármű ékeléshez szükséges szerszám.", weight=0.4, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --74
	{name = "Csavarkulcs", desc="A tűzoltók bizony áramtalanításhoz használják.", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --75
	{name = "PP jegy (1000)", desc="1000 PP-t tartalmazó jegy!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --76
	{name = "PP jegy (2000)", desc="2000 PP-t tartalmazó jegy!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --77
	{name = "HP kártya", desc="Egyből feltölti az életerődet fullra az tuti.", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --78
	{name = "Kioperált golyó", desc="Egy sérültből kioperált golyó.", weight=0.03, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --79
	{name = "Csipesz", desc="A cartridgeek kioperálásához szükséges szerszám.", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --80
	{name = "Defibrillátor", desc="A Mentőszolgálat újraélesztéshez használatos eszköze.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --81
	{name = "Aranytömb", desc="Híres Foster Valleyi Bankból...", weight=2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --82
	{name = "Fúrógép", desc="A neve is mutatja mire is jó.", weight=5, stack = false, weaponID = false, AmmoID = false, level=3, itemTypes= 'weapon'}, --83
	{name = "Golyóálló mellény", desc="Egy tűzharcban bármikor jól jöhet.", weight=2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --84
	{name = "Horgászbot", desc="Egy jó időtöltéshez szükséges eszköz.", weight=0.4, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --85
	{name = "Ponty", desc="Ez igen! Szép kapás!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --86
	{name = "Keszeg", desc="Ez igen! Szép kapás!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --87
	{name = "Bakancs", desc="Egy pár bakancs, ami eléggé rossz állapotú.", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --88
	{name = "Döglött hal", desc="A víz tetején úszott...", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --89
	{name = "Konzervdoboz", desc="Egy üres konzervdoboz.", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --90
	{name = "Hínár", desc="A víz legalljáról.", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --91
	{name = "Tonhal", desc="Ez igen! Szép kapás!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --92
	{name = "Polip", desc="Ez igen! Szép kapás!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --93
	{name = "Ördöghal", desc="Ez igen! Szép kapás!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --94
	{name = "Kardhal", desc="Ez igen! Szép kapás!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --95
	{name = "Lepényhal", desc="Ez igen! Szép kapás!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --96
	{name = "Medve trófea", desc="Egy éhes medve emléktárgya!", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --97
	{name = "Róka trófea", desc="Egy éhes róka emléktárgya!", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --98
	{name = "Farkas trófea", desc="Egy éhes farkas emléktárgya!", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --99
	{name = "Medvebőr", desc="Egy éhes medve emléktárgya!", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --100
	{name = "Rókabőr", desc="Egy éhes róka emléktárgya!", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --101
	{name = "Farkasbőr", desc="Egy éhes farkas emléktárgya!", weight=0.3, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --102
	{name = "M40A1 puska", desc="A vadászok közkedvelt fegyvere.", weight=4, stack = false, weaponID = 33, AmmoID = 69, level=3, itemTypes= 'weapon'}, --103
	{name = "Alpha láda", desc="Mit rejthet?", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --104
	{name = "Béta láda", desc="Mit rejthet?", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --105
	{name = "Omega láda", desc="Mit rejthet?", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --106
	{name = "Gamma láda", desc="Mit rejthet?", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --107
	{name = "Legend láda", desc="Mit rejthet?", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --108
	{name = "20 millió forint", desc="20 millió forint.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --109
	{name = "Lottó szelvény", desc="Egy szelvény, amely bármit hozhat a jövőre.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --110
	{name = "Horgászengedély", desc="A horgászáshoz használatos engedély.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --111
	{name = "Fegyverengedély", desc="A fegyverektartásához használatos engedély.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --112
	{name = "AK-47 Gold", desc="Matricás fegyver.", weight=4.1, stack = false, weaponID = 30, AmmoID = 58, level=3, itemTypes= 'weapon'}, --113
	{name = "AK-47 Flower", desc="Matricás fegyver.", weight=4.1, stack = false, weaponID = 30, AmmoID = 58, level=3, itemTypes= 'weapon'}, --114
	{name = "AK-47 Case Hardened", desc="Matricás fegyver.", weight=4.1, stack = false, weaponID = 30, AmmoID = 58, level=3, itemTypes= 'weapon'}, --115
	{name = "MP5 Royal", desc="Matricás fegyver.", weight=2.5, stack = false, weaponID = 29, AmmoID = 61, level=3, itemTypes= 'weapon'}, --116
	{name = "MP5 Hyper Beast", desc="Matricás fegyver.", weight=2.5, stack = false, weaponID = 29, AmmoID = 61, level=3, itemTypes= 'weapon'}, --117
	{name = "MP5 Fade", desc="Matricás fegyver.", weight=2.5, stack = false, weaponID = 29, AmmoID = 61, level=3, itemTypes= 'weapon'}, --118
	{name = "Pinky Desert Eagle", desc="Matricás fegyver.", weight=2.2, stack = false, weaponID = 24, AmmoID = 57, level=3, itemTypes= 'weapon'}, --199
	{name = "M16 BOOM", desc="Matricás fegyver.", weight=3.5, stack = false, weaponID = 31, AmmoID = 59, level=3, itemTypes= 'weapon'}, --120
	{name = "Red Shade Uzi", desc="Matricás fegyver.", weight=3.5, stack = false, weaponID = 28, AmmoID = 61, level=3, itemTypes= 'weapon'}, --121
	{name = "MP5 Cobalt", desc="Matricás fegyver.", weight=2.5, stack = false, weaponID = 29, AmmoID = 61, level=3, itemTypes= 'weapon'}, --122
	{name = "Gold Uzi", desc="Matricás fegyver.", weight=3.5, stack = false, weaponID = 28, AmmoID = 61, level=3, itemTypes= 'weapon'}, --123
	{name = "Blue Camo Uzi", desc="Matricás fegyver.", weight=3.5, stack = false, weaponID = 28, AmmoID = 61, level=3, itemTypes= 'weapon'}, --124
	{name = "DDPAT Desert Eagle", desc="Matricás fegyver.", weight=2.2, stack = false, weaponID = 24, AmmoID = 57, level=3, itemTypes= 'weapon'}, --125
	{name = "M16 Plublack", desc="Matricás fegyver.", weight=3.5, stack = false, weaponID = 31, AmmoID = 59, level=3, itemTypes= 'weapon'}, --126
	{name = "Artic Magnum", desc="Matricás fegyver.", weight=5, stack = false, weaponID = 34, AmmoID = 69, level=3, itemTypes= 'weapon'}, --127
	{name = "Shotgun", desc="A sörtétesek legidősebb darabja.", weight=4, stack = false, weaponID = 25, AmmoID = 60, level=3, itemTypes= 'weapon'}, --128
	{name = "Shotgun Asiimov", desc="Matricás fegyver.", weight=4, stack = false, weaponID = 25, AmmoID = 60, level=3, itemTypes= 'weapon'}, --129
	{name = "Shotgun Viper", desc="Matricás fegyver.", weight=4, stack = false, weaponID = 25, AmmoID = 60, level=3, itemTypes= 'weapon'}, --130
	{name = "Tec-9 BOOM", desc="Matricás fegyver.", weight=1.8, stack = false, weaponID = 32, AmmoID = 61, level=3, itemTypes= 'weapon'}, --131
	{name = "Red Vein Tec-9", desc="Matricás fegyver.", weight=1.8, stack = false, weaponID = 32, AmmoID = 61, level=3, itemTypes= 'weapon'}, --132
	{name = "AK-47 Asiimov", desc="Matricás fegyver.", weight=4.1, stack = false, weaponID = 30, AmmoID = 58, level=3, itemTypes= 'weapon'}, --133
	{name = "Spider Kés", desc="Matricás fegyver.", weight=0.7, stack = false, weaponID = 4, AmmoID = false, level=2, itemTypes= 'weapon'}, --134
	{name = "Camo Kés", desc="Matricás fegyver.", weight=0.7, stack = false, weaponID = 4, AmmoID = false, level=2, itemTypes= 'weapon'}, --135
	{name = "Vadászengedély", desc="A vadászáshoz használatos engedély.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --136
	{name = "Marihuána mag", desc="Illegális...", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --137
	{name = "Grinder", desc="Egy hasznos szerkezet!", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --138
	{name = "Kokain mag", desc="Illegális...", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --139
	{name = "Üres cserép", desc="Egy üres cserép.", weight=0.5, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --140
	{name = "Cserép földel", desc="Egy cserép földel.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --141
	{name = "Cserép maggal (k)", desc="Egy cserép kokain maggal.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --142
	{name = "Cserép maggal (m)", desc="Egy cserép marihuána maggal.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --143
	{name = "Joint", desc="Illegális...", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --144
	{name = "Marihuána", desc="ILLEGÁL.", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --145
	{name = "Virágföld", desc="Ültetéshez szükséges alapanyag.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --146
	{name = "Locsoló kanna", desc="A virágok gondozásához.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --147
	{name = "OCB", desc="OCB...", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --148
	{name = "Őrölt marihuána", desc="Egy marék marihuána darálva...", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --149
	{name = "Táska", desc="Ha több tárgy kell, mindig jól jön.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --150
	{name = "Prémium táska", desc="Ha több tárgy kell, mindig jól jön.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --151
	{name = "Rendőrségi védőpajzs", desc="Védekezni érdemes vele.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --152
	{name = "Bot", desc="Egy darab bot.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --153
	{name = "Damil", desc="Damil a horgászbothoz.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --154
	{name = "Horog", desc="A halak kifogásához.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --155
	{name = "Csali", desc="Egy horogra való csali.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --156
	{name = "Orsó", desc="A botra felrakni utána damil és horgászatra fel.", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --157
	{name = "Horgászbot( Csalival )", desc="Egy jó időtöltéshez szükséges eszköz.", weight=0.4, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --158
	{name = "Kalapács", desc="Barkácsoláshoz használatos szerszám.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --159
	{name = "AK-47 Belső szerkezet", desc="Egy AK-47-es belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --160
	{name = "AK-47 Cső", desc="Egy AK-47-es csőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --161
	{name = "AK-47 Markolat", desc="Egy AK-47-es markolata.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --162
	{name = "AK-47 Ravasz", desc="Egy AK-47-es ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --163
	{name = "AK-47 Tár", desc="Egy AK-47-es tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --164
	{name = "AK-47 Válltámasz", desc="Egy AK-47-es válltámasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --165
	{name = "M16 Belső szerkezet", desc="Egy M16-os belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --166
	{name = "M16 Csőmarkolat", desc="Egy M16-os csőmarkolata.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --167
	{name = "M16 Cső", desc="Egy M16-os csőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --168
	{name = "M16 Markolat", desc="Egy M16-os markolata.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --169
	{name = "M16 Ravasz", desc="Egy M16-os ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --170
	{name = "M16 Tár", desc="Egy M16-os tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --171
	{name = "M16 Válltámasz", desc="Egy M16-os válltámasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --172
	{name = "Desert Eagle Belső szerkezete", desc="Egy Desert Eagle belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --173
	{name = "Desert Eagle Markolat", desc="Egy Desert Eagle markolata.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --174
	{name = "Desert Eagle Ravasz", desc="Egy Desert Eagle ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --175
	{name = "Desert Eagle Tár", desc="Egy Desert Eagle tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --176
	{name = "Colt-45 Belső szerkezet", desc="Egy Colt-45-ös belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --177
	{name = "Colt-45 Markolat", desc="Egy Colt-45-ös markolata.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --178
	{name = "Colt-45 Ravasz", desc="Egy Colt-45-ös ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --179
	{name = "Colt-45 Tár", desc="Egy Colt-45-ös tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --180
	{name = "M40A1 Belső szerkezet", desc="Egy M40A1 belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --181
	{name = "M40A1 Távcső", desc="Egy M40A1 távcsőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --182
	{name = "M40A1 Cső", desc="Egy M40A1 csőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --183
	{name = "M40A1 Ravasz", desc="Egy M40A1 ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --184
	{name = "M40A1 Tár", desc="Egy M40A1 tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --185
	{name = "M40A1 Válltámasz", desc="Egy M40A1 válltámasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --186
	{name = "MP5 Belső szerkezet", desc="Egy MP5-ös belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --187
	{name = "MP5 Cső", desc="Egy MP5-ös csőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --188
	{name = "MP5 Markolat", desc="Egy MP5-ös markolata.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --189
	{name = "MP5 Ravasz", desc="Egy MP5-ös ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --190
	{name = "MP5 Válltámasz", desc="Egy MP5-ös válltámasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --191
	{name = "MP5 Tár", desc="Egy MP5-ös tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --192
	{name = "Micro Uzi Belső szerkezet", desc="Egy Micro Uzi belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --193
	{name = "Micro Uzi Cső", desc="Egy Micro Uzi csőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --194
	{name = "Micro Uzi Csőmarkolat", desc="Egy Micro Uzi csőmarkolata.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --195
	{name = "Micro Uzi Ravasz", desc="Egy Micro Uzi ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --196
	{name = "Micro Uzi Tár", desc="Egy Micro Uzi tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --197
	{name = "Micro Uzi Válltámasz", desc="Egy Micro Uzi válltámasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --198
	{name = "Shotgun Belső szerkezet", desc="Egy Shotgun belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --199
	{name = "Shotgun Cső", desc="Egy Shotgun csőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --200
	{name = "Shotgun Felhúzó szerkezet", desc="Egy Shotgun felhúzó szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --201
	{name = "Shotgun Ravasz", desc="Egy Shotgun ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --202
	{name = "Shotgun Válltámasz", desc="Egy Shotgun válltámasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --203
	{name = "Tec9 Belső szerkezet", desc="Egy Tec9 belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --204
	{name = "Tec9 Cső", desc="Egy Tec9 csőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --205
	{name = "Tec9 Markolat", desc="Egy Tec9 markolata.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --206
	{name = "Tec9 Ravasz", desc="Egy Tec9 ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --207
	{name = "Tec9 Tár", desc="Egy Tec9 tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --208
	{name = "Magnum Sniper Belső szerkezet", desc="Egy Magnum Sniper belső szerkezete.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --209
	{name = "Magnum Sniper Távcső", desc="Egy Magnum Sniper távcsőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --210
	{name = "Magnum Sniper Cső", desc="Egy Magnum Sniper csőve.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --211
	{name = "Magnum Sniper Ravasz", desc="Egy Magnum Sniper ravasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --212
	{name = "Magnum Sniper Tár", desc="Egy Magnum Sniper tára.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --213
	{name = "Magnum Sniper Válltámasz", desc="Egy Magnum Sniper válltámasza.", weight=0.2, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --214
	{name = "Cigaretta", desc="Egy szál cigaretta .", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --215
	{name = "Csekkfüzet", desc="A rendőrség számára.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --216
	{name = "Csekk", desc="Befizetendő csekk.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --217
	{name = "Kokain cserje", desc="ILLEGÁLIS.", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --218
	{name = "Őrölt kokain cserje", desc="ILLEGÁLIS.", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --219
	{name = "Kézi fűnyíró", desc="Egy kézi fűnyíró, amely a fű levágásához jó!", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --220
	{name = "Kapu kulcs", desc="Egy kapunak a kulcsa!", weight=1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --221
	{name = "Vice Magnum", desc="Matricás fegyver.", weight=5, stack = false, weaponID = 34, AmmoID = 69, level=3, itemTypes= 'weapon'}, --222
	{name = "Alliance Magnum", desc="Matricás fegyver.", weight=5, stack = false, weaponID = 34, AmmoID = 69, level=3, itemTypes= 'weapon'}, --223
	{name = "Dragonlore Magnum", desc="Matricás fegyver.", weight=5, stack = false, weaponID = 34, AmmoID = 69, level=3, itemTypes= 'weapon'}, --224
	{name = "Hyper Beast Magnum", desc="Matricás fegyver.", weight=5, stack = false, weaponID = 34, AmmoID = 69, level=3, itemTypes= 'weapon'}, --225
	{name = "Asiimov Magnum", desc="Matricás fegyver.", weight=5, stack = false, weaponID = 34, AmmoID = 69, level=3, itemTypes= 'weapon'}, --226
	{name = "Villogó", desc="Ha a rend szólít.", weight=0.05, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --227
	{name = "Adásvételi szerződés", desc="Egy szerződés..", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --228
	{name = "Toll", desc="Egy toll.", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --229
	{name = "Pénzkazetta", desc="Pénz van benne.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --230
	{name = "AK-47 Mesterkönyv", desc="AK-47-es könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --231
	{name = "M16 Mesterkönyv", desc="M16-os könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --232
	{name = "Desert Eagle Mesterkönyv", desc="Desert Eagle-s könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --233
	{name = "Shotgun Mesterkönyv", desc="Shotgun-os könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --234
	{name = "Lefűrészelt csövű sörétes Mesterkönyv", desc="Lefűrészelt csövű sörétes könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --235
	{name = "Colt-45 Mesterkönyv", desc="Colt-45-ös könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --236
	{name = "Magnum Mesterkönyv", desc="Magnum-os könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --237
	{name = "M4A01 Mesterkönyv", desc="M4A01-es könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --238
	{name = "MP5 Mesterkönyv", desc="MP5-ös könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --239
	{name = "Micro Uzi Mesterkönyv", desc="Micro Uzi-s könyv.", weight=0.01, stack = false, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --240
	{name = "AK-47 Camo", desc="Matricás fegyver.", weight=4.1, stack = false, weaponID = 30, AmmoID = 58, level=3, itemTypes= 'weapon'}, --241
	{name = "AK-47 Urban Camo", desc="Matricás fegyver.", weight=4.1, stack = false, weaponID = 30, AmmoID = 58, level=3, itemTypes= 'weapon'}, --242
	{name = "Desert Eagle Camo", desc="Matricás fegyver.", weight=2.2, stack = false, weaponID = 24, AmmoID = 57, level=3, itemTypes= 'weapon'}, --243
	{name = "MP5 Camo", desc="Matricás fegyver.", weight=2.5, stack = false, weaponID = 29, AmmoID = 61, level=3, itemTypes= 'weapon'}, --244
	{name = "MP5 Gold", desc="Matricás fegyver.", weight=2.5, stack = false, weaponID = 29, AmmoID = 61, level=3, itemTypes= 'weapon'}, --245
	{name = "Blue Colt-45", desc="Matricás fegyver.", weight=1.5, stack = false, weaponID = 22, AmmoID = 57, level=3, itemTypes= 'weapon'}, --246
	{name = "Army Camo Colt-45", desc="Matricás fegyver.", weight=1.5, stack = false, weaponID = 22, AmmoID = 57, level=3, itemTypes= 'weapon'}, --247
	{name = "M16 Maya", desc="Matricás fegyver.", weight=3.5, stack = false, weaponID = 31, AmmoID = 59, level=3, itemTypes= 'weapon'}, --248
	{name = "Gyémánt kő érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --249
	{name = "Ébenfa érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --250
	{name = "Megkövesedettfa érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --251
	{name = "Arany érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --252
	{name = "Jáde érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --253
	{name = "Kristály érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --254
	{name = "Réz érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --255
	{name = "Ezüst érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --256
	{name = "Fehérarany érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --257
	{name = "Rubin érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --258
	{name = "Gránát érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --259
	{name = "Turmalin érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --260
	{name = "Smaragd érc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --261
	{name = "Kőszilánkok", desc="Hát ez nem nyert..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --262
	{name = "Vasérc", desc="Micsoda érc..", weight=0.05, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --263
	{name = "Vasrúd", desc="Egy nehéz vasrúd.", weight=3, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --264
	{name = "Smaragd Kés", desc="Matricás fegyver.", weight=0.7, stack = false, weaponID = 4, AmmoID = false, level=2, itemTypes= 'weapon'}, --265
	{name = "Rubint Kés", desc="Matricás fegyver.", weight=0.7, stack = false, weaponID = 4, AmmoID = false, level=2, itemTypes= 'weapon'}, --266
	{name = "Gyémánt Kés", desc="Matricás fegyver.", weight=0.7, stack = false, weaponID = 4, AmmoID = false, level=2, itemTypes= 'weapon'}, --267
	{name = "Gyémánt", desc="Értékes...", weight=3, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --268
	{name = "Rubin", desc="Értékes...", weight=3, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --269
	{name = "Smaragd", desc="Értékes...", weight=3, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --270
	{name = "Késnyél", desc="Egy kés nyele.", weight=0.2, stack = true, weaponID = false, AmmoID = false, level=1, itemTypes= 'bag'}, --271
	{name = "PP jegy (100)", desc="100 PP-t tartalmazó jegy!", weight=0.1, stack = false, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --272
	{name = "Strandlabda", desc="2018 NYÁR!", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --273
	{name = "Strandpapucs", desc="2018 NYÁR!", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --274
	{name = "Fagylalt", desc="2018 NYÁR!", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --275
	{name = "Úszógumi", desc="2018 NYÁR!", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --276
	{name = "Kutyatáp", desc="Ha éhes a kutya..", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --277
	{name = "Fuvarlevél ( EVENT )", desc="Szeptember van...", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --278
	{name = "Címke ( EVENT )", desc="Szeptember van...", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --279
	{name = "Autógumi ( EVENT )", desc="Szeptember van...", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --280
	{name = "Titkos könyv ( EVENT )", desc="Szeptember van...", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --281
	{name = "OX jegy", desc="Szeptember van...", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --282
	{name = "M16 EVENT", desc="EVENT", weight=0.1, stack = false, weaponID = 31, AmmoID = 284, level=0, itemTypes= 'weapon'}, --283
	{name = "EVENT lőszer", desc="EVENT", weight=0.01, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'weapon'}, --284
	{name = "Magnum EVENT", desc="EVENT", weight=0.1, stack = false, weaponID = 34, AmmoID = 284, level=0, itemTypes= 'weapon'}, --285
	{name = "MP5 EVENT", desc="EVENT", weight=0.1, stack = false, weaponID = 29, AmmoID = 284, level=0, itemTypes= 'weapon'}, --286
	{name = "Desert Eagle Halloween", desc="Halloweeni Matricás fegyver.", weight=2.2, stack = false, weaponID = 24, AmmoID = 57, level=3, itemTypes= 'weapon'}, --287
	{name = "Colt-45 Halloween", desc="Halloweeni Matricás fegyver.", weight=1.5, stack = false, weaponID = 22, AmmoID = 57, level=3, itemTypes= 'weapon'}, --288
	{name = "Shotgun Halloween", desc="Halloweeni Matricás fegyver.", weight=4, stack = false, weaponID = 25, AmmoID = 60, level=3, itemTypes= 'weapon'}, --289
	{name = "Micro Uzi Halloween", desc="Halloweeni Matricás fegyver.", weight=3.5, stack = false, weaponID = 28, AmmoID = 61, level=3, itemTypes= 'weapon'}, --290
	{name = "MP5 Halloween", desc="Halloweeni Matricás fegyver.", weight=2.5, stack = false, weaponID = 29, AmmoID = 61, level=3, itemTypes= 'weapon'}, --291
	{name = "AK-47 Halloween", desc="Halloweeni Matricás fegyver.", weight=4.1, stack = false, weaponID = 30, AmmoID = 58, level=3, itemTypes= 'weapon'}, --292
	{name = "M16 Halloween", desc="Halloweeni Matricás fegyver.", weight=3.5, stack = false, weaponID = 31, AmmoID = 59, level=3, itemTypes= 'weapon'}, --293
	{name = "Tec-9 Halloween ", desc="Halloweeni Matricás fegyver.", weight=1.8, stack = false, weaponID = 32, AmmoID = 61, level=3, itemTypes= 'weapon'}, --294
	{name = "Magnum Halloween", desc="Halloweeni Matricás fegyver.", weight=5, stack = false, weaponID = 34, AmmoID = 69, level=3, itemTypes= 'weapon'}, --295
	{name = "Tök (Event)", desc="HALLOWEEN EVENT", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --296
	{name = "Fa", desc="Kivágott fa darab", weight=0.1, stack = true, weaponID = false, AmmoID = false, level=0, itemTypes= 'bag'}, --297
}

craftLists = {
	[1] = {
		name = 'vara de pesca',
		level = 0,
		giveCraftItem = 85,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 4,
		craftProgress = 600,
		craftSlots  = {
			--[Slot] = {ItemID, Darabszám}
			[2] = {153, 1},
			[6] = {157, 1},
			[10] = {154, 1},
			[15] = {155, 1},
		},		
	},	
	[2] = {
		name = 'vara de pesca( isca )',
		level = 0,
		giveCraftItem = 158,
		craftDimension = false,
		craftFaction = false,
		craftMaxWant = 2,
		craftTool = false,
		craftProgress = 300,
		craftSlots  = {
			--[Slot] = {ItemID, Darabszám}
			[2] = {85, 1},
			[6] = {156, 1},
		},
	},
	
	[3] = {
		name = 'AK-47',
		level = 3,
		giveCraftItem = 51,
		craftDimension = 123,
		craftFaction = {11, 13},
		craftTool = 159,
		craftMaxWant = 6,
		craftProgress = 1200,
		craftSlots  = {
			--[Slot] = {ItemID, Darabszám}
			[5] = {165, 1},
			[6] = {160, 1},
			[7] = {161, 1},
			[9] = {162, 1},
			[10] = {163, 1},
			[11] = {164, 1},
		},
	},	
	
	[4] = {
		name = 'M16',
		level = 3,
		giveCraftItem = 52,
		craftDimension = 123,
		craftFaction = {11, 13},
		craftTool = 159,
		craftMaxWant = 7,
		craftProgress = 1200,
		craftSlots  = {
			--[Slot] = {ItemID, Darabszám}
			[5] = {172, 1},
			[6] = {166, 1},
			[7] = {167, 1},
			[8] = {168, 1},
			[9] = {169, 1},
			[10] = {170, 1},
			[11] = {171, 1},
		},
	},
	
	[5] = {
		name = 'Desert Eagle',
		level = 3,
		giveCraftItem = 44,
		craftDimension = 123,
		craftFaction = {11, 13},
		craftTool = 159,
		craftMaxWant = 4,
		craftProgress = 1000,
		craftSlots  = {
			--[Slot] = {ItemID, Darabszám}
			[2] = {173, 1},
			[6] = {174, 1},
			[7] = {175, 1},
			[10] = {176, 1},
		},
	},	
	
	[6] = {
		name = 'Colt-45',
		level = 3,
		giveCraftItem = 46,
		craftDimension = 123,
		craftFaction = {10, 11, 13, 9},
		craftTool = 159,
		craftMaxWant = 4,
		craftProgress = 1000,
		craftSlots  = {
			--[Slot] = {ItemID, Darabszám}
			[2] = {177, 1},
			[6] = {178, 1},
			[7] = {179, 1},
			[10] = {180, 1},
		},
	},	
	
	[7] = {
		name = 'M40A1 rifle',
		level = 3,
		giveCraftItem = 103,
		craftDimension = 123,
		craftFaction = {11, 13},
		craftTool = 159,
		craftProgress = 1300,
		craftMaxWant = 6,
		craftSlots  = {
			--[Slot] = {ItemID, Darabszám}
			[5] = {186, 1},
			[6] = {181, 1},
			[7] = {183, 1},
			[2] = {182, 1},
			[10] = {184, 1},
			[11] = {185, 1},
		},
	},	
	
	[8] = {
		name = 'MP5',
		level = 3,
		giveCraftItem = 50,
		craftDimension = 123,
		craftFaction = {11, 13},
		craftTool = 159,
		craftMaxWant = 6,
		craftProgress = 1200,
		craftSlots  = {
			--[Slot] = {ItemID, Darabszám}
			[5] = {191, 1},
			[6] = {187, 1},
			[7] = {188, 1},
			[9] = {189, 1},
			[10] = {190, 1},
			[11] = {192, 1},
		},
	},	
	
	[9] = {
		name = 'Micro Uzi',
		level = 3,
		giveCraftItem = 49,
		craftDimension = 123,
		craftFaction = {10, 11, 13, 9},
		craftTool = 159,
		craftMaxWant = 6,
		craftProgress = 1200,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[5] = {198, 1},
			[6] = {193, 1},
			[7] = {195, 1},
			[8] = {194, 1},
			[10] = {196, 1},
			[11] = {197, 1},
		},
	},	
	
	[10] = {
		name = 'Shotgun',
		level = 3,
		giveCraftItem = 128,
		craftDimension = 123,
		craftFaction = {11, 13},
		craftTool = 159,
		craftMaxWant = 5,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[5] = {203, 1},
			[6] = {199, 1},
			[7] = {200, 1},
			[9] = {202, 1},
			[10] = {201, 1},
		},
	},	
	
	[11] = {
		name = 'Tec9',
		level = 3,
		giveCraftItem = 53,
		craftDimension = 123,
		craftFaction = {10, 11, 13, 9},
		craftTool = 159,
		craftMaxWant = 5,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[5] = {204, 1},
			[6] = {205, 1},
			[9] = {206, 1},
			[10] = {207, 1},
			[11] = {208, 1},
		},
	},	
	
	[12] = {
		name = 'Magnum Sniper',
		level = 3,
		giveCraftItem = 68,
		craftDimension = 123,
		craftFaction = {11, 13},
		craftTool = 159,
		craftMaxWant = 6,
		craftProgress = 1300,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {210, 1},
			[5] = {214, 1},
			[6] = {209, 1},
			[7] = {211, 1},
			[10] = {212, 1},
			[11] = {213, 1},
		},
	},
	
	[13] = {
		name = 'Vazo com terra',
		level = 3,
		giveCraftItem = 141,
		craftDimension = false,
		craftFaction = false,
		craftTool = false,
		craftMaxWant = 2,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {140, 1},
			[6] = {146, 1},
		},
	},	
	
	[14] = {
		name = 'Vazo com semente (m)',
		level = 3,
		giveCraftItem = 143,
		craftDimension = false,
		craftFaction = false,
		craftTool = false,
		craftMaxWant = 2,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {137, 1},
			[6] = {141, 1},
		},
	},	
	
	[15] = {
		name = 'Com núcleo de ladrilho (k)',
		level = 3,
		giveCraftItem = 142,
		craftDimension = false,
		craftFaction = false,
		craftTool = false,
		craftMaxWant = 2,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {139, 1},
			[6] = {141, 1},
		},
	},	
	
	[16] = {
		name = 'Maconha moída',
		level = 3,
		giveCraftItem = 149,
		craftDimension = false,
		craftFaction = {10, 11, 13, 9},
		craftTool = 138,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {145, 1},
		},
	},	
	
	[17] = {
		name = 'Cigarro Maconha',
		level = 3,
		giveCraftItem = 144,
		craftDimension = false,
		craftFaction = false,
		craftTool = false,
		craftMaxWant = 2,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {148, 1},
			[7] = {149, 5},
		},
	},	
	
	[18] = {
		name = 'Arbusto de cocaína moída',
		level = 3,
		giveCraftItem = 219,
		craftDimension = 123,
		craftFaction = {10, 11, 13, 9},
		craftTool = 220,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {218, 1},
		},
	},	
	
	[19] = {
		name = 'cocaína',
		level = 3,
		giveCraftItem = 14,
		craftDimension = false,
		craftFaction = false,
		craftTool = false,
		craftMaxWant = 2,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {26, 1},
			[6] = {219, 3},
		},
	},	
	
	[20] = {
		name = 'barra de ferro',
		level = 0,
		giveCraftItem = 264,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {263, 1000},
		},
	},

	[21] = {
		name = 'Estrutura interna AK-47',
		level = 0,
		giveCraftItem = 160,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},		
	
	[22] = {
		name = 'M16 Estrutura Interna',
		level = 0,
		giveCraftItem = 166,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},		
	
	[23] = {
		name = 'Estrutura Interna Desert Eagle',
		level = 0,
		giveCraftItem = 173,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},	
	
	[24] = {
		name = 'Estrutura interna Colt-45',
		level = 0,
		giveCraftItem = 177,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},	
	
	[25] = {
		name = 'Estrutura Interna MP5',
		level = 0,
		giveCraftItem = 187,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},	
	
	[26] = {
		name = 'Estrutura Interna Micro Uzi',
		level = 0,
		giveCraftItem = 193,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},	
	
	[27] = {
		name = 'Estrutura Interior Shotgun',
		level = 0,
		giveCraftItem = 199,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},	
	
	[28] = {
		name = 'Tec9 Estrutura Interna',
		level = 0,
		giveCraftItem = 204,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},	
	
	[29] = {
		name = 'Estrutura interna do Magnum Sniper',
		level = 0,
		giveCraftItem = 209,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {264, 5},
		},
	},	
	
	[30] = {
		name = 'diamante',
		level = 0,
		giveCraftItem = 268,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {249, 2000},
		},
	},	
	
	[31] = {
		name = 'rubi',
		level = 0,
		giveCraftItem = 269,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {258, 2000},
		},
	},	
	
	[32] = {
		name = 'esmeralda',
		level = 0,
		giveCraftItem = 270,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 1100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {261, 2000},
		},
	},	
	
	[33] = {
		name = 'Faca de diamante',
		level = 0,
		giveCraftItem = 267,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 2100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {268, 1},
			[6] = {268, 1},
			[10] = {268, 1},
			[14] = {271, 1},
		},
	},		
	
	[34] = {
		name = 'Faca de Rubi',
		level = 0,
		giveCraftItem = 266,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 2100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {269, 1},
			[6] = {269, 1},
			[10] = {269, 1},
			[14] = {271, 1},
		},
	},	
	
	[35] = {
		name = 'Faca de Esmeralda',
		level = 0,
		giveCraftItem = 265,
		craftDimension = false,
		craftFaction = false,
		craftTool = 159,
		craftMaxWant = 1,
		craftProgress = 2100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[2] = {270, 1},
			[6] = {270, 1},
			[10] = {270, 1},
			[14] = {271, 1},
		},
	},	

	[36] = {
		name = 'OX craft',
		level = 0,
		giveCraftItem = 109,
		craftDimension = false,
		craftFaction = false,
		craftTool = false,
		craftMaxWant = 1,
		craftProgress = 2100,
		craftSlots  = {
			-- [Slot] = {ItemID, Darabszám}
			[6] = {282, 15},
		},
	},	
}

specialItems = {
	[13] = function(item,value)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700Faz um cigarro: ".. value .. ""
	end,		
	[16] = function(item,value)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700{Number: +98 ".. value .."}\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)..""
	end,	
	[17] = function(item,value)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(ID: ".. value ..")\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)..""
	end,
	[18] = function(item,value)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(ID: ".. value ..")\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)..""
	end,	
	[19] = function(item,value)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(ID: ".. value ..")\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)..""
	end,
	[20] = function(item,value)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(ID: ".. value ..")\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)..""
	end,
	[29] = function(item,value)
		name = getItemName(item)
		desc = getItemDescription(item)
		local values = fromJSON(value)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(ID: ".. values[2] ..")"
	end,	
	[34] = function(item,value)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(ID: ".. value ..")"
	end,
	[57] = function(item,value,count)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(Vazn: "..getItemWeight(item).."kg)\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)
	end,	
	[58] = function(item,value,count)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(Vazn: "..getItemWeight(item).."kg)\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)
	end,	
	[59] = function(item,value,count)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(Vazn: "..getItemWeight(item).."kg)\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)
	end,
	[60] = function(item,value,count)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(Vazn: "..getItemWeight(item).."kg)\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)
	end,	
	[61] = function(item,value,count)
		name = getItemName(item)
		desc = getItemDescription(item)
		return "#7cc576"..name .. "#FFFFFF\n" .. desc,"#FFA700(Vazn: "..getItemWeight(item).."kg)\n#FFFFFFLevel Morede Niyaz: #00AEFF"..getItemNeedLevel(item)
	end,	
	
}

vehicleWeight = {--Quantidade de items que um carro suporte !!
	-- [VehID] = peso,
	[499] = 20,
	[414] = 40,
	[508] = 55,-- Caminhão 1
	[515] = 80,-- Caminhão 2
	[433] = 100,-- Caminhão 3
}

function getType(element)
	if(getElementType(element)=="player")then
		return 0
	elseif(getElementType(element)=="vehicle")then
		return 1
	elseif(getElementType(element)=="object") and (getElementModel(element) == 2332) then
		return 2
	end
end

function getOwnerID(element)
	if(getElementType(element)=="player")then
		return (getElementData(element, 'acc:id') or -1)  --tonumber(getElementData(element, 'acc:id') or -1)
	elseif(getElementType(element)=="vehicle")then
		--return tonumber(getElementData(element, 'veh:owner') or -1)
		return tonumber(getElementData(element, 'veh:id')+10000000 or -1)
	elseif(getElementType(element)=="object") and (getElementModel(element) == 2332) then
		return tonumber(getElementData(element, "safe->ID") or -1)
	end
end

function getItemName(id)
	if itemLists[id] then
		return itemLists[id].name
	end
end

function getItemWeight(id)
	if itemLists[id] then
		return itemLists[id].weight
	end
end

function getItemDescription(id)
	if itemLists[id] then
		return itemLists[id].desc
	end
end

function getItemType(id)
	if itemLists[id] then
		return itemLists[id].itemTypes
	end
end

function getItemWeaponID(id)
	if itemLists[id] then
		return itemLists[id].weaponID
	end
end

function getItemNeedLevel(item)
	if tonumber(itemLists[item].level) > 0 then
		return tonumber(itemLists[item].level)
	else
		return 0
	end
end

function getItemToType(element, items)
	local itemType = "bag"
	if items then 
		if tonumber(getType(element)) == 1 or tonumber(getType(element)) == 2 then 
			itemType = tostring('bag')
		else
			itemType = tostring(itemLists[tonumber(items)].itemTypes)
		end
	end
	return itemType
end

function getItemTable()
	return itemLists
end

function getItemImg(item)
	return fileExists(":san_items/files/items/"..item..".png") and ":san_items/files/items/"..item..".png" or ":san_items/files/items/0.png"
end

function getWeaponID(itemid)--ItemID-ről fegyo ID-re
	if itemLists[tonumber(itemid)].weapon then
		return itemLists[tonumber(itemid)].weapon
	else
		return 0
	end
end
function getWeaponAmmo(item)
	if itemLists[tonumber(item)].ammo then
		return itemLists[tonumber(item)].ammo
	else
		return 1
	end
end

function getItemsStackable(item)
	return itemLists[tonumber(item)].stack or false
end

function isReloadableWeapon(item)
	return itemLists[tonumber(item)].weapon
end

isStickerWeapon = {
	--[ItemID] = "neve a képnek" (san_fegyverPJ ben lévő mappában a kép!!!)
	[113] = "ak_1",
	[114] = "ak_2",
	[115] = "ak_3",
	[133] = "ak_4",
	[241] = "ak_5",
	[242] = "ak_6",
	[116] = "mp_1",
	[117] = "mp_2",
	[118] = "mp_3",
	[122] = "mp_4",
	[244] = "mp_5",
	[245] = "mp_6",
	[120] = "m4_1",
	[121] = "uzi_1",
	[123] = "uzi_2",
	[124] = "uzi_3",
	[119] = "desert_1",
	[125] = "desert_2",
	[243] = "desert_3",
	[126] = "m4_2",
	[248] = "m4_3",
	[283] = "m4_4",
	[285] = "m4_4",
	[286] = "m4_4",
	[127] = "sniper_1",
	[222] = "sniper_2",
	[223] = "sniper_3",
	[224] = "sniper_4",
	[225] = "sniper_5",
	[226] = "sniper_6",
	[129] = "shoutgun_1",
	[130] = "shoutgun_2",
	[131] = "tec9_1",
	[132] = "tec9_2",
	[134] = "knife_1",
	[135] = "knife_2",
	[265] = "knife_3",
	[266] = "knife_4",
	[267] = "knife_5",
	[246] = "colt_1",
	[247] = "colt_2",
	[287] = "halloween",
	[288] = "halloween",
	[289] = "halloween",
	[290] = "halloween",
	[291] = "halloween",
	[292] = "halloween",
	[293] = "halloween",
	[294] = "halloween",
	[295] = "halloween",
}

function getStickerWeapon(itemID)
	return isStickerWeapon[itemID]
end

local itemIDtoWeapon = {
	[44] = 24,
	[45] = 23,
	[46] = 22,
	[47] = 26,
	[48] = 27,
	[49] = 28,
	[50] = 29,
	[286] = 29,
	[51] = 30,
	[52] = 31,
	[53] = 32,
	[54] = 41,
	[55] = 42,
	[56] = 43,
	[68] = 34,
	[103] = 33,
	
	-- Skines fegyók
	[287] = 24,
	[288] = 22,
	[289] = 25,
	[290] = 28,
	[291] = 29,
	[292] = 30,
	[293] = 31,
	[294] = 32,
	[295] = 34,
	[113] = 30,
	[114] = 30,
	[115] = 30,
	[241] = 30,
	[242] = 30,
	[116] = 29,
	[244] = 29,
	[245] = 29,
	[117] = 29,
	[118] = 29,
	[119] = 24,
	[243] = 24,
	[120] = 31,
	[121] = 28,
	[122] = 29,
	[123] = 28,
	[124] = 28,
	[125] = 24,
	[126] = 31,
	[248] = 31,
	[283] = 31,
	[127] = 34,
	[222] = 34,
	[223] = 34,
	[224] = 34,
	[225] = 34,
	[226] = 34,
	[285] = 34,
	[128] = 25,
	[129] = 25,
	[130] = 25,
	[131] = 32,
	[132] = 32,
	[133] = 30,
	[134] = 4,
	[135] = 4,
	[246] = 22,
	[247] = 22,
	[265] = 4,
	[266] = 4,
	[267] = 4,
	--[40] = 6,
}

function getWeaponID(itemid)
	if itemIDtoWeapon[itemid] then
		return itemIDtoWeapon[itemid]
	else
		return 0
	end
end

function isWeapon(itemid)
	if itemIDtoWeapon[itemid] then
		return true
	else
		return false
	end
end
