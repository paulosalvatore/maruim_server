function onLogout(player)

	if player:checarLogoutDesativado() then
		player:sendCancelMessage("Você não pode se desconectar agora. Aguarde alguns instantes.")
		return false
	end

	local playerId = player:getId()
	if nextUseStaminaTime[playerId] ~= nil then
		nextUseStaminaTime[playerId] = nil
	end

	player:gravarOuroMonstros()

	return true
end
