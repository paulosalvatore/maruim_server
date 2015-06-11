function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if	(not modalWindowId == configMasmorras.storageBase+configMasmorras.modalPrincipal or
		not modalWindowId == configMasmorras.storageBase+configMasmorras.modalMasmorraEncontrada) or
		buttonId == 2 then
		return false
	elseif modalWindowId == configMasmorras.storageBase+configMasmorras.modalPrincipal then
		if choiceId < 255 then
			player:iniciarLocalizadorMasmorra(choiceId)
		else
			player:removerLocalizadorMasmorra()
		end
	elseif modalWindowId == configMasmorras.storageBase+configMasmorras.modalMasmorraEncontrada then
		if buttonId == 1 then
			player:aceitarConviteMasmorra()
		end
	end
end