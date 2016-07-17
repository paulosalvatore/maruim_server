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

	local stats = player:inBossFight()
	if stats then
		-- Player logged out (or died) in the middle of a boss fight, store his damageOut and stamina
		local boss = Monster(stats.bossId)		
		if boss then
			local dmgOut = boss:getDamageMap()[playerId]
			if dmgOut then
				stats.damageOut = (stats.damageOut or 0) + dmgOut.total
			end
			stats.stamina = player:getStamina()
		end
	end

	return true
end
