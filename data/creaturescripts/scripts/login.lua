function onLogin(player)
	if player:getVocation():getId() == 0 then
		local modalTitulo = "Login Bloqueado"
		local modalMensagem = "Você deve escolher uma vocação no site antes de conectar seu personagem.\n"
		local modal = ModalWindow(modalNoVocation, modalTitulo, modalMensagem)
		modal:addButton(1, "Ok")
		modal:setDefaultEnterButton(1)
		modal:sendToPlayer(player)
		addEvent(function() player:remove() end, 0)
		return true
	end
	local loginStr = "Seja bem-vindo ao " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Por favor, escolha seu outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Sua última visita foi em %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- Stamina
	nextUseStaminaTime[player.uid] = 0

	-- Events
	player:registerEvent("PrepareDeath")
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("MatarCriatura")
	player:registerEvent("LevelUp")
	return true
end
