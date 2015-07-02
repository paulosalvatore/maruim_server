function onKill(player, target)
	if isPlayer(target) or isSummon(target) or isNpc(target) then 
		return true 
	end

	local taskId = target:checarTask()
	if taskId > 0 then
		local statusTask = player:verificarStatusTask(taskId)
		if statusTask == configTasks.valorIniciada then
			player:adicionarProgressoTask(taskId)
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
end