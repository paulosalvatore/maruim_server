function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if (not modalWindowId == configTasks.storageBase and
		not modalWindowId == configTasks.storageBase+configTasks.modalTasksDisponiveis and
		not modalWindowId == configTasks.storageBase+configTasks.modalTasksProgresso and
		not modalWindowId == configTasks.storageBase+configTasks.modalTasksRealizadas and
		not modalWindowId == configTasks.storageBase+configTasks.modalTasksDisponiveisInfo and
		not modalWindowId == configTasks.storageBase+configTasks.modalTasksProgressoInfo and
		not modalWindowId == configTasks.storageBase+configTasks.modalTasksRealizadasInfo) or
		buttonId == 2 then
		return false
	elseif modalWindowId == configTasks.storageBase then
		if choiceId == 1 then
			player:enviarTasksModalDisponiveis()
		elseif choiceId == 2 then
			player:enviarTasksModalProgresso()
		elseif choiceId == 3 then
			player:enviarTasksModalRealizadas()
		elseif choiceId == 4 then
			player:enviarTasksModalRecompensas()
		end
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksDisponiveis then
		if buttonId == 1 then
			player:iniciarTask(choiceId)
		elseif buttonId == 3 then
			player:enviarTasksModalPrincipal()
		elseif buttonId == 4 then
			player:enviarTasksModalInfo(choiceId, configTasks.modalTasksDisponiveisInfo)
		end
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksProgresso then
		if buttonId == 1 then
			player:enviarTasksModalInfo(choiceId, configTasks.modalTasksProgressoInfo)
		elseif buttonId == 3 then
			player:enviarTasksModalPrincipal()
		end
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksRealizadas then
		if buttonId == 1 then
			player:enviarTasksModalInfo(choiceId, configTasks.modalTasksRealizadasInfo)
		elseif buttonId == 3 then
			player:enviarTasksModalPrincipal()
		end
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksRecompensas then
		if buttonId == 1 then
			player:retirarRecompensa(choiceId)
		elseif buttonId == 3 then
			player:enviarTasksModalPrincipal()
		end
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksDisponiveisInfo then
		if buttonId == 1 then
			player:iniciarTask(choiceId)
		else
			player:enviarTasksModalDisponiveis()
		end
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksProgressoInfo then
		if buttonId == 1 then
			player:iniciarTask(choiceId)
		else
			player:enviarTasksModalProgresso()
		end
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksRealizadasInfo then
		if buttonId == 1 then
			player:iniciarTask(choiceId)
		else
			player:enviarTasksModalRealizadas()
		end
	end
end