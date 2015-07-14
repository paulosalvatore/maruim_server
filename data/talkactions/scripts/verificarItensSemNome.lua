function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	if param == "zerar" then
		itensSemNomeVerificados[player:getId()] = nil
	else
		if #itensSemNome == 0 then
			verificarItensSemNome()
		end

		if not itensSemNomeVerificados[player:getId()] then
			itensSemNomeVerificados[player:getId()] = 1
		else
			itensSemNomeVerificados[player:getId()] = itensSemNomeVerificados[player:getId()] + 1
		end
		
		local verificarItem = itensSemNomeVerificados[player:getId()]
		local posicaoItem = player:getPosition() + {x = 1}
		local tile = Tile(posicaoItem)
		local itensTile = tile:getItems()
		if itensTile and #itensTile > 0 then
			for i = 1, #itensTile do
				itensTile[i]:remove(1)
			end
		end
		player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Item " .. itensSemNome[verificarItem] .. " inserido.")
		Game.createItem(itensSemNome[verificarItem], 1, posicaoItem)
	end

	return false
end
