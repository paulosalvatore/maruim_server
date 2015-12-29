function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local split = param:split(",")

	if split[1] == nil then
		player:sendCancelMessage("Parâmetros insuficientes.")
		return false
	end

	local quantidadeMonstros = 100
	if split[2] ~= nil and tonumber(split[2]) > 0 then
		quantidadeMonstros = math.min(split[2], 1300)
	end

	resultadoLoot = {}
	local nomeMonstro = split[1]
	local monsterType = MonsterType(nomeMonstro)

	if monsterType == nil then
		player:sendCancelMessage("Monstro inválido.")
		return false
	end

	local posicaoMonstro = player:getPosition() + {y = 1}
	local tempo = math.max(quantidadeMonstros*2, 1000)

	for i = 1, quantidadeMonstros do
		local monstro = Game.createMonster(nomeMonstro, posicaoMonstro, false, true)
		local monstroMaxHP = monsterType:getMaxHealth()
		doTargetCombatHealth(0, monstro, COMBAT_PHYSICALDAMAGE, -monstroMaxHP*10, -monstroMaxHP*10, CONST_ME_NONE)

		addEvent(function(playerId, monsterType, posicaoMonstro, i, quantidadeMonstros)
			local corpoId = monsterType:getCorpseId()
			local corpo = Tile(posicaoMonstro):getItemById(corpoId)

			for a, b in pairs(monsterType:getLoot()) do
				local itemId = b.itemId
				local quantidadeItens = corpo:getItemCountById(itemId)
				local quantidadeVezes = 1

				if resultadoLoot[itemId] ~= nil then
					quantidadeVezes = resultadoLoot[itemId][2]

					if quantidadeItens > 0 then
						quantidadeVezes = quantidadeVezes + 1
					end

					quantidadeItens = quantidadeItens + resultadoLoot[itemId][1]
				end

				resultadoLoot[itemId] = {quantidadeItens, quantidadeVezes}
			end

			corpo:remove(1)

			if i == quantidadeMonstros-1 then
				Player(playerId):sendTextMessage(1, "Loot dos monstros contabilizados.")
			end
		end, tempo, player:getId(), monsterType, posicaoMonstro, i, quantidadeMonstros)
	end

	addEvent(function(playerId, nomeMonstro, quantidadeMonstros)
		local mensagem = quantidadeMonstros .. " " .. nomeMonstro .. " foram mortos durante o teste.\n"

		for lootId, lootInfo in pairs(resultadoLoot) do
			mensagem = mensagem .. round(100*lootInfo[2]/quantidadeMonstros, 2) .. "% derrubaram o item " .. ItemType(lootId):getName() .. " - Total: " .. lootInfo[1] .. "\n"
		end

		Player(playerId):sendTextMessage(1, mensagem)
	end, tempo+1000, player:getId(), nomeMonstro, quantidadeMonstros)

	player:sendTextMessage(1, "Monstros posicionados e serão mortos em " .. tempo .. " milissegundos.")

	return false
end
