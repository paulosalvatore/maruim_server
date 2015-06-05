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
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksDisponiveisInfo then
		player:enviarTasksModalDisponiveis()
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksProgressoInfo then
		player:enviarTasksModalProgresso()
	elseif modalWindowId == configTasks.storageBase+configTasks.modalTasksRealizadasInfo then
		player:enviarTasksModalRealizadas()
	end
end