
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--
----------------------------------- mod desenvolvido por Developer & .Dev -----------------------------------
------------------------------------ Caso queira mais mods desse estilo -------------------------------------
---------------------------------------- entre em contato no discord ----------------------------------------
---------------------------------------- Developer#6617 ou .Dev#1793 ----------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--
----------------------------------------------- @.Dev'Scripts -----------------------------------------------
------------------------------------- @New Dreams RolePlay [CLOSED BETA] ------------------------------------
-------------------------------------     https://discord.gg/xwzYeAT     ------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--
------------------------------------------------- VERSÃO 1.5 ------------------------------------------------
--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--


local segundos = 4 -- tempo para assobiar novamente! (o tempo não pode ser menor que 1, pois ocorrerá bugs!)
local tecla = "n" -- tecla para assobiar


local assobio = {
  tick = {},
  tempo = {},
  doing = {},
};

function Assobiar(jogador)
  if not isPedOnGround (jogador) then return end -- se o player não estiver no chão, a função NÃO EXECUTA!
  if isPedInVehicle(jogador) then return end -- se o player estiver em um veículo, a função NÃO EXECUTA!
  if getTickCount() - (assobio.tick[jogador] or 0) >= segundos * 1000 then -- se o tempo for maior que os segundos então:
    if assobio.doing[jogador] == false or assobio.doing[jogador] == nil then
      controls(jogador, false)
      setPedAnimation(jogador, "food", "eat_burger", -1, false, false, false, false) -- animação 1
      setTimer(setPedAnimationProgress, 800, 1, jogador, "eat_burger", 1)  -- algumas config da animação (recomendo não mexer!)
      assobio.doing[jogador] = true
      assobio.tick[jogador] = getTickCount()
      local cx, cy, cz = getElementPosition(jogador)
      triggerClientEvent(getRootElement(), "devs_Assobio", jogador, cx, cy, cz) -- ativa o som do assobio (arquivo client.lua)
      assobio.tempo[jogador] = setTimer(function() -- começa o tempo para a animação 2
        setPedAnimation(jogador, "ghands", "gsign2lh", -1, false, false, false, false) -- animação 2
        setTimer(function() -- inicia o tempo para terminar o assobio
          cancelAnimn(jogador) -- função que termina o assobio
          controls(jogador, true)
        end, 1000, 1) -- tempo animação 2
      end, 1000, 1)  -- tempo animação 1
    end
  end
end 

function cancelAnimn(player)
  --setPedAnimation(player) -- caso haja algum bug, retire os dois traços da frente!
  --setPedWalkingStyle(player, 0) -- caso haja algum bug, retire os dois traços da frente!
  assobio.doing[player] = false
  if isTimer (assobio.tempo[player]) then killTimer (assobio.tempo[player]) assobio.tempo[player] = nil end
end

function Res()
  for _, player in ipairs(getElementsByType("player")) do
    assobio.tick[player] = 4
    assobio.doing[player] = false
    bindKey(player, "n", "down", Assobiar)
  end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), Res)

function Join()
  for _, player in ipairs(getElementsByType("player")) do
    assobio.tick[player] = 4
    assobio.doing[player] = false
    bindKey(player, tecla, "down", Assobiar)
  end
end
addEventHandler("onPlayerJoin", getRootElement(), Join)

function Clean()
  for _, player in ipairs(getElementsByType("player")) do
    unbindKey(player, tecla, "down", Assobiar)
    if isTimer (assobio.tempo[jogador]) then killTimer (assobio.tempo[jogador]) end
      if assobio.doing[player] then
        destroyElement(assobio.doing[player] )
        assobio.doing[player] = nil
        assobio.tick[player] = nil
      end
  end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), Clean)

function Wasted()
  for _, player in ipairs(getElementsByType("player")) do
    if isTimer (assobio.tempo[jogador]) then killTimer (assobio.tempo[jogador]) end
      if assobio.doing[player] then
        destroyElement(assobio.doing[player] )
        assobio.doing[player] = nil
        assobio.tick[player] = 4
      end
  end
end
addEventHandler("onPlayerWasted", getRootElement(), Wasted)

function controls(player, state)
  if state == false then
    toggleControl ( player, "jump", false )
  elseif state == true then
    toggleControl ( player, "jump", true )
  end
end
