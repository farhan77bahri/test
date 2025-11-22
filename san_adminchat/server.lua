addCommandHandler("men", function(p)
--  if isPlayerInACL(p, "Console") or isPlayerInACL(p, "SuperModerator") or isPlayerInACL(p, "SubDono") or isPlayerInACL(p, "Moderator") or isPlayerInACL(p, "SuperModerator") or isPlayerInACL(p, "Admin") then
	if getElementData(p, "acc:admin") >= 1 then --and getElementData(p,"char:adminduty") == 1 then
    triggerClientEvent(p, "Shouts:onPlayerChangeMenu", p)
  else
    return
  end
end)
local isMessage = false
addEvent("Shouts:onPlayerTriggerServerShout", true)
addEventHandler("Shouts:onPlayerTriggerServerShout", root, function(text, name, r, g, b)
  if text and name ~= nil then
    if not isMessage then
      if name == true then
        send = getPlayerName(source) .. "\n" .. text
      else
        send = text
      end
      isMessage = true
      triggerClientEvent(root, "Shouts:onPlayerGetText", root, send, r, g, b)
      outputDebugString("ADMIN MENSSAGEM: " .. getPlayerName(source) .. " mandou uma menssagem para todos " .. text)
      setTimer(function()
        isMessage = false
      end, 10200, 1)
    else
      outputChatBox("Por favor aguarde a menssagem atual para sair.", source, 255, 0, 0)
      return
    end
  end
end)
function isPlayerInACL(player, acl)
  local account = getAccountName(getPlayerAccount(player))
  if isObjectInACLGroup("user." .. account, aclGetGroup(acl)) then
    return true
  else
    return false
  end
end
