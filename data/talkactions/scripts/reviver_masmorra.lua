function onSay(player, words, param)
	local masmorraId = player:verificarMasmorra()
	if masmorraId > 0 then
		ressuscitarJogadoresMasmorra(masmorraId)
	end
	return true
end
