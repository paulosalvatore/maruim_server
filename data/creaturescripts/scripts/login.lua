function onLogin(player)
	local loginStr = "Seja bem-vindo ao " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Por favor, escolha seu outfit."
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Sua última visita foi em %s.", os.date("%d/%m/%Y às %X", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- Ouro Monstros
	local playerGuid = player:getGuid()

	local resultId = db.storeQuery('SELECT `ouro_monstros`, `limite_ouro_monstros` FROM `players` WHERE `id` = ' .. db.escapeString(playerGuid))

	local jogadorOuroMonstros, jogadorLimiteOuroMonstros

	if resultId then
		jogadorOuroMonstros = result.getDataInt(resultId, "ouro_monstros")
		jogadorLimiteOuroMonstros = result.getDataInt(resultId, "limite_ouro_monstros")
		result.free(resultName)
	end

	if jogadorLimiteOuroMonstros < limiteOuroMonstrosPadrao then
		jogadorLimiteOuroMonstros = limiteOuroMonstrosPadrao
	end

	player:definirOuroMonstros(jogadorOuroMonstros, jogadorLimiteOuroMonstros)

	-- Casamento
	if player:pegarStatusCasamento() ~= STATUS_CASAMENTO_CASADO then
		if player:getSex() == PLAYERSEX_FEMALE and player:hasOutfit(329) then
			player:removerOutfit(329)
		elseif player:getSex() == PLAYERSEX_MALE and player:hasOutfit(328) then
			player:removerOutfit(328)
		end
	end

	-- Stamina
	nextUseStaminaTime[player.uid] = 0
	
	-- Rewards notice
	local rewards = #player:getRewardList()
	if rewards > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have %s %s in your reward chest.", rewards == 1 and 'one' or rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id 
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	-- Events
	player:registerEvent("PrepareDeath")
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("MatarCriatura")
	player:registerEvent("LevelUp")
	player:registerEvent("BossParticipation")

	if player:checarRecompensaPendente() then
		player:registerEvent("RecompensaNivel")
	end

	return true
end
