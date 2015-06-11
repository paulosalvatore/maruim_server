function onPrepareDeath(player, lastHitKiller, mostDamageKiller)
	local masmorraId = player:verificarMasmorra()
	if masmorraId > 0 then
		local masmorra = Masmorras[masmorraId]
		local tempoRetorno = configMasmorras.tempoRetorno
		local posicaoSala = Position(masmorra.posicaoSala) + {x = searchArrayKey(masmorra.jogadores, player:getId())}
		player:teleportarJogador(posicaoSala)
		addEvent(function(cid, masmorraId)
			local player = Player(cid)
			local masmorraId = player:verificarMasmorra()
			if masmorraId > 0 then
				player:teleportarJogador(Masmorras[masmorraId].posicao)
			end
		end, tempoRetorno*1000, player:getId(), masmorraId)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Você voltará para a masmorra em " .. tempoRetorno .. " segundos.")
		player:addHealth(player:getMaxHealth()-player:getHealth())
		for i, v in ipairs(conditionsHealing) do
			if getCreatureCondition(player, v) == true then
				doRemoveCondition(player, v)
			end
		end
		return false
	end
	return true
end
