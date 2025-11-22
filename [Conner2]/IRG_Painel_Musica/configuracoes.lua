config = {
	btnOpen = "F5", -- Botão para abrir/fechar o painel
	toggleRadioCmd = "radio", -- Comando para JOGADORES ativarem/desativarem a rádio
	changeMusicCmd = "trocar", -- Comando para STAFFS (permissão mute) pularem a música atual da rádio
	keySoundCloud = "a3e059563d7fd3372b49b37f00a00bcf", -- Key  API.SoundCloud.com
	timerSpam = 20, -- Tempo em minutos para liberar músicas repetidas na rádio
	limitMusicSearch = 20, -- Quantia de músicas que aparecerão na pesquisa (quanto maior o valor, maior será o delay nos resultados)
	limitRadioMusicLengh = 4, -- Quando a música da rádio atingir  "4" min automáticamente é trocada (anti músicas longas)
	limitRadioMusicLenghOn = true, -- Caso queira que músicas longas toquem até o fim mude para "false"
	priceUseRadio = 20000, -- Preço para adicionar uma música na rádio
	btnAddMusicVeh = true, -- Habilitar/desabilitar o botão de adicionar rádio no veículo (caso ñ tenha no seu sv deixe como "false")
	btnAddMusicRadio = true -- Em alguns casos a rádio pode ser chata deixando "false" você desabilita ela
	
	-- Em servers com uma quantia alta de players é recomendado que a rádio sempre seja moderada por um staff
	
	--[[
		Cada key da API do SoundCloud possui um limite de 15000 requisições diárias, caso o fluxo seje alto esse limite é possível de ser atingido,
		por isso estou disponibilizando outras Keys que você pode estar trocando:
		
			"DwqGOXHZ3lGjIjuEdEZTIyENVhV4q2hm",
			"6cNXLxGM04XhrBxiIpYlrW7b0bf0vdxl",
			"86913ee69789fcba86f317a6471e20b3",
			"73e3c687ca5a2f6c5fa3143b76c4c665",
			"90d140308348273b897fab79f44a7c89",
			"331298d3dba3e267911a9e2b14f734f6",
			"a8dc0bd0cb12743bc319ff304e098c20",
			"50383c11fb5ad9dd88440a5a1555fa63",
			"a3e059563d7fd3372b49b37f00a00bcf"
	--]]
}