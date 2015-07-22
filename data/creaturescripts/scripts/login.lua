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
	if player:getSex() == PLAYERSEX_FEMALE then
		if getPlayerMarriageStatus(player:getGuid()) == MARRIED_STATUS and not player:hasOutfit(329) then
			player:addOutfit(329)
		elseif getPlayerMarriageStatus(player:getGuid()) ~= MARRIED_STATUS and player:hasOutfit(329) then
			player:removeOutfit(329)
		end
	else
		if getPlayerMarriageStatus(player:getGuid()) == MARRIED_STATUS and not player:hasOutfit(328) then
			player:addOutfit(328)
		elseif getPlayerMarriageStatus(player:getGuid()) ~= MARRIED_STATUS and player:hasOutfit(328) then
			player:removeOutfit(328)
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
