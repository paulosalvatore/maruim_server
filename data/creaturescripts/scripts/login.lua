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

	-- Events
	player:registerEvent("PrepareDeath")
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("MatarCriatura")
	player:registerEvent("LevelUp")

	if player:checarRecompensaPendente() then
		player:registerEvent("RecompensaNivel")
	end

	return true
end
