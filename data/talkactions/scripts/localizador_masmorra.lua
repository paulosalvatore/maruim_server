function onSay(player, words, param)
	if player:verificarMasmorra() > 0 then
		player:sendCancelMessage(configMasmorras.mensagens.comandoBloqueado)
	elseif player:getParty() then
		player:sendCancelMessage(configMasmorras.mensagens.possuiParty)
	elseif not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:sendCancelMessage(configMasmorras.mensagens.pz)
	elseif player:getStorageValue(configMasmorras.storageBase) > os.time() then
		player:sendCancelMessage(configMasmorras.mensagens.aguarde)
	else
		player:enviarModalMasmorra()
	end
	return false
end
