function onLogout(player)

	if getCreatureCondition(player, CONDITION_SPELLCOOLDOWN, 160) then
		player:sendCancelMessage("Você não pode desconectar-se agora.")
		return false
	end

	if player:verificarMasmorra() > 0 then
		player:sendCancelMessage(configMasmorras.mensagens.logoutBloqueado)
		return false
	end

	if player:verificarFila() > 0 then
		player:removerFila()
	end

	local playerId = player:getId()
	if nextUseStaminaTime[playerId] ~= nil then
		nextUseStaminaTime[playerId] = nil
	end

	return true
end
