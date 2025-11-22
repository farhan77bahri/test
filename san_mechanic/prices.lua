--[[
{"windscreen_dummy", "Szélvédő"},
{"bump_front_dummy", "Első lökhárító"},
{"bump_rear_dummy", "Hátsó lökhárító"},
{"bonnet_dummy", "Motorháztető"},
{"boot_dummy", "Csomagtartó"},
{"door_lf_dummy", "Bal első ajtó"},
{"door_rf_dummy", "Jobb első ajtó"},
{"door_lr_dummy", "Bal hátsó ajtó"},
{"door_rr_dummy", "Jobb hátsó ajtó"},
{"wheel_rf_dummy", "Jobb első kerék"},
{"wheel_lf_dummy", "Bal első kerék"},
{"wheel_rb_dummy", "Jobb hátsó kerék"},
{"wheel_lb_dummy", "Bal hátsó kerék"},
{"wheel_rear", "Hátsó kerék"},
{"wheel_front", "Első kerék"}

Ajtóknál, Motorháztetőknél, stb.:
1: Ajar, intact
2: Shut, damaged
3: Ajar, damaged
4: Missing

Példa
["door_lf_dummy"] = {10, 20, 30, 40},

Kerekeknél:
1: Flat
2: Fallen off
3: Collisionless - Szerintem nem nagyon lehet ilyet elérni.

Példa
["wheel_rb_dummy"] = {10, 20, 30},

Lökhárítő, szélvédő, és "front-left panel", "rear-left panel" és a többi, ezek nem tudom mik
1: Sérült
2: Elég sérült
3: Nagyon sérült

Példa
["windscreen_dummy"] = {10, 20, 30},


Motor:
1: 999 és 750 között
2: 749 és 500 között
3: 499 és 250 között
4: 249 és 0 között (250 alatt azt hiszem már ég a kocsi tehát nem hinném hogy lesz ilyen.)
5: Ha valami hiba miatt nem lehet lekérni a motor állapotát.

Példa
["Motor"] = {10, 20, 30, 40, 20},
]]
repairSoundPath = "sound.wav"
repairTime = 5--Másodpercben

--Ezredmásodpercre konvertálás
repairTime = repairTime * 1000

priceTable = {
	["Motor"] = {10,20,30,40},
	["windscreen_dummy"] = {10, 15, 20},
	["bump_front_dummy"] = {15, 20, 25},
	["bump_rear_dummy"] = {15, 20, 25},
	["bonnet_dummy"] = {15, 20, 25, 30},
	["boot_dummy"] = {15, 20, 25, 30},
	["door_lf_dummy"] = {15, 20, 25, 30},
	["door_rf_dummy"] = {15, 20, 25, 30},
	["door_lr_dummy"] = {15, 20, 25, 30},
	["door_rr_dummy"] = {15, 20, 25, 30},
	
	["wheel_rf_dummy"] = {15, 20, 25, 30},
	["wheel_lf_dummy"] = {15, 20, 25, 30},
	["wheel_rb_dummy"] = {15, 20, 25, 30},
	["wheel_lb_dummy"] = {15, 20, 25, 30},
	
	["wheel_rear"] = {15, 20, 25, 30},
	["wheel_front"] = {15, 20, 25, 30},
}
defPrice = 10 --Ha a táblában nem lenne benne az ár, mennyi lenne az alapértelmezett.