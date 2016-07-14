function onStepIn(player, item, position, fromPosition)
	local cidade = Town(item:getActionId() - 4000)
	player:setTown(cidade)
	player:teleportarJogador(cidade:getTemplePosition(), true)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Você se tornou cidadão de " .. formatarNomeCidade(cidade:getName()) .. ".")
end