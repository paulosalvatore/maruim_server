function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
	local monstroNome = creature:getName()

	if not attacker or not attacker:isPlayer() or not monstrosDano[monstroNome] then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	local monstroId = creature:getId()
	local jogadorId = attacker:getId()

	if not monstrosDano[monstroNome][monstroId] then
		monstrosDano[monstroNome][monstroId] = {
			danoTotal = 0,
			jogadores = {}
		}
	end

	local danoCausado = primaryDamage + secondaryDamage
	local monstroDanoTotal = monstrosDano[monstroNome][monstroId].danoTotal + danoCausado
	local danoCausadoJogador = (monstrosDano[monstroNome][monstroId].jogadores[jogadorId] or 0) + danoCausado
	local vidaRestanteMonstro = creature:getHealth() - danoCausado

	if vidaRestanteMonstro <= 0 then
		monstroDanoTotal = monstroDanoTotal + vidaRestanteMonstro
		danoCausadoJogador = danoCausadoJogador + vidaRestanteMonstro
	end

	monstrosDano[monstroNome][monstroId].danoTotal = monstroDanoTotal
	monstrosDano[monstroNome][monstroId].jogadores[jogadorId] = danoCausadoJogador

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
