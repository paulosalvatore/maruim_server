function onThink(player, interval)
	if not player:checarRecompensaPendente() then
		player:unregisterEvent("RecompensaNivel")
		return
	end

	if not player:getCondition(CONDITION_INFIGHT) and not modalRecompensaAberto[player:getId()] then
		player:enviarModalRecompensa()
	end

	return true
end

function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if modalWindowId < recompensaIdBase or modalWindowId > recompensaIdBase+recompensasInicio+recompensasMaximo then
		return false
	elseif modalWindowId > recompensaIdBase+recompensasInicio and modalWindowId < recompensaIdBase+recompensasOpcoesInicio then
		local recompensaId = modalWindowId - recompensaIdBase - recompensasInicio
		if buttonId == 1 then
			if choiceId == 1 then
				player:entregarRecompensa(recompensaId)
			elseif choiceId == 2 then
				player:entregarRecompensa(recompensaId, true)
			elseif choiceId == 3 then
				player:modalTempoRecompensaMaisTarde(recompensaId)
			end
		elseif buttonId == 3 then
			player:removerEscolhaRecompensa(recompensaId)
		else
			player:enviarModalRecompensaMaisTarde(recompensaId, 30)
		end
	elseif modalWindowId > recompensaIdBase+recompensasInicio+recompensasOpcoesInicio and modalWindowId < recompensaIdBase+recompensasInicio+recompensasMaisTardeInicio then
		local recompensaId = modalWindowId - recompensaIdBase - recompensasOpcoesInicio - recompensasInicio
		if buttonId == 1 then
			player:selecionarRecompensa(recompensaId, choiceId)
		else
			player:enviarModalRecompensaMaisTarde(recompensaId, 30)
		end
	elseif modalWindowId > recompensaIdBase+recompensasInicio+recompensasMaisTardeInicio and modalWindowId < recompensaIdBase+recompensasInicio+recompensasMaximo then
		local recompensaId = modalWindowId - recompensaIdBase - recompensasMaisTardeInicio - recompensasInicio
		if buttonId == 1 and choiceId == 1 then
			player:enviarModalRecompensaMaisTarde(recompensaId, 10)
		elseif buttonId == 1 and choiceId == 2 then
			player:enviarModalRecompensaMaisTarde(recompensaId, 30)
		elseif buttonId == 1 and choiceId == 3 then
			player:enviarModalRecompensaMaisTarde(recompensaId, 60)
		elseif buttonId == 1 and choiceId == 4 then
			player:enviarModalRecompensaMaisTarde(recompensaId, 300)
		elseif buttonId == 3 then
			player:enviarModalRecompensa(recompensaId)
		else
			player:enviarModalRecompensaMaisTarde(recompensaId, 30)
		end
	end
end
