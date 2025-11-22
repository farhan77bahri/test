----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 08 May 2014
-- Resource: GTIrentalUI/rental_gui.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

rentalGUI = {tab = {}, tabpanel = {}, label = {}, button = {}, window = {}, gridlist = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 492, 389
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 551, 242, 492, 389
rentalGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "BGO - VEICULOS", false)
guiWindowSetSizable(rentalGUI.window[1], false)
guiSetAlpha(rentalGUI.window[1], 0.90)
-- Visibility
guiSetVisible(rentalGUI.window[1], false)
-- Tab Panel
rentalGUI.tabpanel[1] = guiCreateTabPanel(9, 21, 472, 359, false, rentalGUI.window[1])

-- Vehicles Tab
---------------->>

-- Tab
rentalGUI.tab[1] = guiCreateTab("Veiculos", rentalGUI.tabpanel[1])
-- Gridlist
rentalGUI.gridlist[1] = guiCreateGridList(23, 20, 210, 292, false, rentalGUI.tab[1])
guiGridListAddColumn(rentalGUI.gridlist[1], "ID", 0.25)
guiGridListAddColumn(rentalGUI.gridlist[1], "Veiculo", 0.4)
guiGridListAddColumn(rentalGUI.gridlist[1], "Preço", 0.25)
guiGridListSetSortingEnabled(rentalGUI.gridlist[1], false)
-- Label (Static)
rentalGUI.label[1] = guiCreateLabel(250, 20, 202, 113, "Selecione um veículo da lista que você gostaria de alugar. Devolva seu veículo alugado aqui quando tiver terminado.\n\n(Nota: você será cobrado por qualquer dano que o veículo tem quando você devolvê-lo.)", false, rentalGUI.tab[1])
guiSetFont(rentalGUI.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(rentalGUI.label[1], "center", true)
-- Label (Dynamic)
rentalGUI.label[2] = guiCreateLabel(251, 145, 199, 82, "Este veículo é restrito aos seguintes grupos:\nGrupo A, Grupo B, Grupo C", false, rentalGUI.tab[1])
guiLabelSetHorizontalAlign(rentalGUI.label[2], "center", true)
-- Buttons
rentalGUI.button[1] = guiCreateButton(250, 238, 201, 45, "Pegar veículo", false, rentalGUI.tab[1])
guiSetFont(rentalGUI.button[1], "default-bold-small")
guiSetProperty(rentalGUI.button[1], "NormalTextColour", "FFAAAAAA")
rentalGUI.button[2] = guiCreateButton(250, 289, 99, 22, "Guardar veiculo", false, rentalGUI.tab[1])
guiSetProperty(rentalGUI.button[2], "NormalTextColour", "FFAAAAAA")
rentalGUI.button[3] = guiCreateButton(353, 289, 99, 22, "Cancelar", false, rentalGUI.tab[1])
guiSetProperty(rentalGUI.button[3], "NormalTextColour", "FFAAAAAA")

-- Weapons Tab
--------------->>

-- Tab
rentalGUI.tab[2] = guiCreateTab("Armas", rentalGUI.tabpanel[1])
-- Labels
rentalGUI.label[3] = guiCreateLabel(37, 18, 174, 15, "Armas", false, rentalGUI.tab[2])
guiSetFont(rentalGUI.label[3], "default-bold-small")
guiLabelSetHorizontalAlign(rentalGUI.label[3], "center", false)
rentalGUI.label[4] = guiCreateLabel(26, 223, 420, 85, "Selecione quaisquer Armas ou Ferramentas que você gostaria de alugar.\nQuando você verifica uma arma, qualquer arma atual que você tenha naquele slot será automaticamente depositada neste cofre de armas..\n\nSuas armas permanecerão armazenadas até que você as tire.\nArmas podem ser levadas de volta em qualquer quiosque de aluguel.", false, rentalGUI.tab[2])
guiSetFont(rentalGUI.label[4], "default-bold-small")
guiLabelSetHorizontalAlign(rentalGUI.label[4], "center", true)
rentalGUI.label[5] = guiCreateLabel(258, 18, 174, 15, "Minhas armas armazenadas", false, rentalGUI.tab[2])
guiSetFont(rentalGUI.label[5], "default-bold-small")
guiLabelSetHorizontalAlign(rentalGUI.label[5], "center", false)
-- Gridlist
rentalGUI.gridlist[2] = guiCreateGridList(25, 40, 200, 111, false, rentalGUI.tab[2])
guiGridListAddColumn(rentalGUI.gridlist[2], "Arma", 0.4)
guiGridListAddColumn(rentalGUI.gridlist[2], "Bala", 0.4)
guiGridListSetSortingEnabled(rentalGUI.gridlist[2], false)
rentalGUI.gridlist[3] = guiCreateGridList(245, 40, 200, 111, false, rentalGUI.tab[2])
guiGridListAddColumn(rentalGUI.gridlist[3], "Arma", 0.4)
guiGridListAddColumn(rentalGUI.gridlist[3], "Bala", 0.4)
guiGridListSetSortingEnabled(rentalGUI.gridlist[3], false)
-- Buttons
rentalGUI.button[4] = guiCreateButton(57, 159, 138, 31, "Trocar arma", false, rentalGUI.tab[2])
guiSetFont(rentalGUI.button[4], "default-bold-small")
guiSetProperty(rentalGUI.button[4], "NormalTextColour", "FFAAAAAA")
rentalGUI.button[5] = guiCreateButton(277, 159, 138, 31, "Retirar arma", false, rentalGUI.tab[2])
guiSetProperty(rentalGUI.button[5], "NormalTextColour", "FFAAAAAA")
rentalGUI.button[6] = guiCreateButton(215, 166, 41, 18, "Fechar", false, rentalGUI.tab[2])
guiSetProperty(rentalGUI.button[6], "NormalTextColour", "FFAAAAAA")

-- Rental Mods
--------------->>

addEventHandler("onClientResourceStart", resourceRoot, function()
	local txd = engineLoadTXD("mods/icons4.txd")
	engineImportTXD(txd, 1277)
	local dff = engineLoadDFF("mods/pickupsave.dff")
	engineReplaceModel(dff, 1277)
end)
