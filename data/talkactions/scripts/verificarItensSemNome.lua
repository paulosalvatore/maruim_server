function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	if param == "zerar" then
		itensSemNomeAtual[player:getId()] = nil
	else
		if not itensSemNomeVerificados then
			verificarItensSemNome()
		end
		if #itensSemNome == 0 then
			player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Nenhum item sem nome foi encontrado.")
			return false
		end

		if not itensSemNomeAtual[player:getId()] or not itensSemNome[itensSemNomeAtual[player:getId()] + 1] then
			itensSemNomeAtual[player:getId()] = 1
		else
			itensSemNomeAtual[player:getId()] = itensSemNomeAtual[player:getId()] + 1
		end

		local verificarItem = itensSemNomeAtual[player:getId()]
		local posicaoItem = player:getPosition() + {x = 1}
		local tile = Tile(posicaoItem)
		local itensTile = tile:getItems()

		if itensTile and #itensTile > 0 then
			for i = 1, #itensTile do
				itensTile[i]:remove(1)
			end
		end
		Game.createItem(Tile(player:getPosition()):getGround():getId(), 1, posicaoItem)

		player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Item " .. itensSemNome[verificarItem] .. " inserido.")
		Game.createItem(itensSemNome[verificarItem], 1, posicaoItem)
	end

	return false
end
