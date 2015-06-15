function onSay(player, words, param)
	local masmorraId = player:verificarMasmorra()
	if masmorraId > 0 then
		local checar = player:checarReviverJogadoresMasmorra(masmorraId)
		if checar == true then
			reviverJogadoresMasmorra(masmorraId, player:getName())
			player:getPosition():sendMagicEffect(efeitos["green"])
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Você reviveu todos os jogadores da masmorra.")
		else
			player:sendCancelMessage(checar)
		end
	end
	return true
end
