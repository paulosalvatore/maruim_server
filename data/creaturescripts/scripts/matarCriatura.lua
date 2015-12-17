function onKill(player, target)
	if isPlayer(target) or isSummon(target) or isNpc(target) then 
		return true 
	end

	local tasks = target:checarTask()
	if #tasks > 0 then
		for a, b in pairs(tasks) do
			if player:verificarStatusTask(b) == configTasks.valorIniciada then
				player:adicionarProgressoTask(b)
			end
		end
	end

	local masmorraId = player:verificarMasmorra()
	if masmorraId > 0 then
		local masmorra = Masmorras[masmorraId]
		local criaturas = masmorra.data.criaturas
		for a, b in pairs(criaturas) do
			if target:getId() == b then
				table.remove(Masmorras[masmorraId].data.criaturas, a)
			end
		end
		local tempoFinalizar = configMasmorras.tempoFinalizar
		if #criaturas == 0 then
			Masmorras[masmorraId].finalizada = true
			enviarMensagemMasmorraFinalizada(masmorraId)
			addEvent(finalizarMasmorra, tempoFinalizar*1000, masmorraId, masmorra.masmorraAtual)
		else
			enviarProgressoMasmorra(masmorraId)
		end
	end

	return true
end
