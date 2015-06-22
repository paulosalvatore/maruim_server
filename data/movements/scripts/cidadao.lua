function onStepIn(player, item, position, fromPosition)
	local actionId = item:getActionId()
	local cidade = Town(actionId-4000)
	player:setTown(cidade)
	player:teleportarJogador(cidade:getTemplePosition(), false, true)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Você se tornou cidadão de " .. formatarNomeCidade(cidade:getName()) .. ".")
end