function Party:onJoin(player)
	local masmorraId = player:verificarFila()
	if masmorraId > 0 then
		player:sendCancelMessage(configMasmorras.mensagens.entrarPartyBloqueado)
		return false
	end
	return true
end

function Party:onLeave(player)
	local masmorraId = player:verificarMasmorra()
	if masmorraId > 0 then
		player:sendCancelMessage(configMasmorras.mensagens.sairPartyBloqueado)
		return false
	end
	return true
end

function Party:onDisband()
	return true
end
