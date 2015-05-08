local config = {
	passos = 18,
	tempo = 300,
	posicoesTartaruga = {
		{0, 0, 5756},
		{0, -1, 5757},
		{-1, 0, 5758},
		{1, 0, 5759},
		{0, 1, 5755},
		{-1, 1, 5761},
		{1, 1, 5760}
	},
	posicoesAgua = {
		{0, 2},
		{-1, 2},
		{1, 2}
	},
	posicoesReset = {
		{0, 0},
		{-1, 1},
		{0, 1},
		{1, 1},
		{-1, 2},
		{0, 2},
		{1, 2},
		{-1, 3},
		{0, 3},
		{1, 3}
	}
}
local passos = config.passos - 1
local tempo = config.tempo
local posicoesTartaruga = config.posicoesTartaruga
local posicoesAgua = config.posicoesAgua
local posicoesReset = config.posicoesReset
function gerarIdAgua()
	local objetos = {
		math.random(4608, 4625),
		math.random(4664, 4666)
	}
	local numeroVetor = math.random(0, 10)
	if(numeroVetor <= 8) then
		objeto = objetos[1]
	else
		objeto = objetos[2]
	end
	return objeto
end
function reiniciarTartaruga(posicao)
	local posicaoTartaruga = posicao + {y = passos + 4}
	local posicaoJogador = posicao + {y = 3}
	for chave, valor in pairs(posicoesReset) do
		x = valor[1]
		y = valor[2]-1
		objeto = gerarIdAgua()
		posicaoObjeto = posicaoJogador + {x = x, y = y}
		Tile(posicaoObjeto):getGround():transform(objeto)
		posicaoObjeto:sendMagicEffect(CONST_ME_WATERSPLASH)
		posicaoObjeto:sendMagicEffect(CONST_ME_LOSEENERGY)
	end
	criarTartaruga(posicaoTartaruga, -1)
	return true
end
function criarTartaruga(posicao, passo)
	for chave, valor in pairs(posicoesTartaruga) do
		x = valor[1]
		y = valor[2]-1
		objeto = valor[3]
		posicaoObjeto = posicao + {x = x, y = y - passo}
		Tile(posicaoObjeto):getGround():transform(objeto)
		if(passo == -1) then
			posicaoObjeto:sendMagicEffect(efeitos["teleport"])
		end
	end
	return true
end
function criarAgua(posicao, passo)
	for chave, valor in pairs(posicoesAgua) do
		x = valor[1]
		y = valor[2]-1
		objeto = gerarIdAgua()
		posicaoObjeto = posicao + {x = x, y = y - passo}
		Tile(posicaoObjeto):getGround():transform(objeto)
		posicaoObjeto:sendMagicEffect(CONST_ME_WATERSPLASH)
		posicaoObjeto:sendMagicEffect(CONST_ME_LOSEENERGY)
	end
	return true
end
function moverTartaruga(playerUid, direcaoY, posicao, passo)
	local player = Player(playerUid)
	if player then
		if(passo >= 0) then
			local posicaoJogador = posicao + {y = direcaoY - passo}
			player:teleportTo(posicaoJogador)
		end
	end
	criarTartaruga(posicao, passo)
	if(passo >= 0) then
		criarAgua(posicao, passo)
	end
	if(passo == passos) then
		posicao = posicao + {y = -4 - passos}
		if(isPlayer(player)) then
			player:teleportTo(posicao, true)
			posicao:sendMagicEffect(CONST_ME_TELEPORT)
		end
		addEvent(reiniciarTartaruga, 1000, posicao)
	end
	return true
end
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local posicaoJogador = player:getPosition()
	posicaoJogador:sendMagicEffect(CONST_ME_POFF)
	local posicaoObjeto = posicaoJogador + {y = -2}
	local checarTartaruga = Tile(posicaoObjeto):getGround():getId()
	local inFight = getCreatureCondition(player, CONDITION_INFIGHT)
	if(inFight == false) then
		if(checarTartaruga == 5755) then
			if(item.itemid == 1945) then
				Item(item.uid):transform(item.itemid + 1)
			elseif(item.itemid == 1946) then
				Item(item.uid):transform(item.itemid - 1)
			end
			local posicaoJogador = posicaoJogador + {y = -3}
			player:teleportTo(posicaoJogador, true)
			for i = 0, passos, 1 do
				addEvent(moverTartaruga, tempo*i, player.uid, -1, posicaoJogador, i)
			end
		else
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Aguarde o retorno da tartaruga.")
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você deve sair do combate")
	end
	return true
end