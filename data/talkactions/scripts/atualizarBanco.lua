function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	if param == nil then
		player:sendCancelMessage("Parâmetros insuficientes.")
	elseif param == "profissoes" or param == "profissões" then
		atualizarProfissoesBanco()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Profissões atualizadas.")
	elseif param == "receitas" then
		atualizarReceitasBanco()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Receitas atualizadas.")
	elseif param == "npcs" then
		atualizarNpcs()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "NPCs atualizados.")
	elseif param == "cidades" then
		atualizarCidades()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Cidades atualizadas.")
	elseif param == "itens" then
		atualizarItens()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Itens atualizadas.")
	end
	return false
end
