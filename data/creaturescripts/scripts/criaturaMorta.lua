function onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	if not creature or creature:isPlayer() or not killer or not killer:isPlayer() then
		return true
	end

	local nomeMonstro = creature:getName()
	local ouroTotalMonstro = monstros[nomeMonstro] or nil

	if not ouroTotalMonstro then
		return true
	end

	if type(ouroTotalMonstro) == "table" and #ouroTotalMonstro == 2 then
		ouroTotalMonstro = math.random(ouroTotalMonstro[1], ouroTotalMonstro[2])
	end

	if ouroTotalMonstro <= 0 or type(ouroTotalMonstro) ~= "number" then
		ouroTotalMonstro = 0
	end

	local monstroId = creature:getId()
	local monstrosDano = monstrosDano[nomeMonstro][monstroId]
	local monstrosDanoTotal = monstrosDano.danoTotal
	local monstrosDanoJogadores = monstrosDano.jogadores

	for jogadorId, danoCausado in pairs(monstrosDanoJogadores) do
		local porcentagemJogador = danoCausado*100/monstrosDanoTotal
		local ouroTotalJogador = round(ouroTotalMonstro*porcentagemJogador/100)

		local jogador = Player(jogadorId)
		if jogador then
			jogador:addMoneyBank(ouroTotalJogador)
		end
	end

	return true
end
