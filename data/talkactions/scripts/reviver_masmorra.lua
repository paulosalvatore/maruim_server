function onSay(player, words, param)
	local masmorraId = player:verificarMasmorra()
	if masmorraId > 0 then
		local checar = player:checarReviverJogadoresMasmorra(masmorraId)
		if checar == true then
			reviverJogadoresMasmorra(masmorraId, self:getName())
		else
			player:sendCancelMessage(checar)
		end
	end
	return true
end
