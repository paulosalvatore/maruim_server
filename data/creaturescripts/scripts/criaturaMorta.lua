function onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	if not creature or creature:isPlayer() or not killer or not killer:isPlayer() then
		return true
	end

	local nomeMonstro = creature:getName()
	local ouroTotalMonstro = monstros[nomeMonstro] or nil

	if not ouroTotalMonstro then
		return true
	end

	local ouroJogadores, bonusOuroJogadores = 0, 0

	if type(ouroTotalMonstro) == "table" and #ouroTotalMonstro >= 2 then
		ouroJogadores = math.random(ouroTotalMonstro[1], ouroTotalMonstro[2])

		if #ouroTotalMonstro == 3 and ouroTotalMonstro[3][2] >= math.random(100) then
			bonusOuroJogadores = math.random(1, ouroTotalMonstro[3][1]) * 100
		end
	end

	if type(ouroJogadores) ~= "number" or ouroJogadores <= 0 then
		ouroJogadores = 0
	end

	local monstroId = creature:getId()
	local monstrosDano = monstrosDano[nomeMonstro][monstroId]
	local monstrosDanoTotal = monstrosDano.danoTotal
	local monstrosDanoJogadores = {}

	for jogadorId, danoCausado in pairs(monstrosDano.jogadores) do
		if Player(jogadorId) then
			monstrosDanoJogadores[jogadorId] = danoCausado
		else
			monstrosDanoTotal = monstrosDanoTotal - danoCausado
		end
	end

	local ouroPlayerParty = {}

	for jogadorId, danoCausado in pairs(monstrosDanoJogadores) do
		local porcentagemJogador = danoCausado*100/monstrosDanoTotal
		local ouroJogador = round(ouroJogadores*porcentagemJogador/100)

		local bonusOuroJogador = 0
		if bonusOuroJogadores > 0 then
			bonusOuroJogador = round(bonusOuroJogadores*porcentagemJogador/100)
		end

		local player = Player(jogadorId)

		if player then

			local party = player:getParty()

			if party and party:checarOuroMonstroCompartilhado() then
				ouroPlayerParty[player:getId()] = {ouroJogador, bonusOuroJogador}
			else
				player:adicionarOuroMonstros(ouroJogador, bonusOuroJogador)
			end
		end
	end

	local ouroParty = {}

	for playerId, ouro in pairs(ouroPlayerParty) do
		local player = Player(playerId)
		local party = player:getParty()

		local membros = party:getAllClosestMembers(playerId)

		local ouroJogador = math.ceil(ouro[1]/#membros)
		local bonusOuroJogador = math.ceil(ouro[2]/#membros)

		for chave, membro in pairs(membros) do
			local membroId = membro:getId()

			if ouroParty[membroId] ~= nil then
				ouroParty[membroId] = {
					ouroParty[membroId][1] + ouroJogador,
					ouroParty[membroId][2] + bonusOuroJogador
				}
			else
				ouroParty[membroId] = {ouroJogador, bonusOuroJogador}
			end
		end
	end

	for playerId, ouro in pairs(ouroParty) do
		local player = Player(playerId)
		local ouroJogador = ouro[1]
		local bonusOuroJogador = ouro[2]

		player:adicionarOuroMonstros(ouroJogador, bonusOuroJogador)
	end

	return true
end
