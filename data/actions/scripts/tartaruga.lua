local config = {
	passos = 18,
	tempo = 300,
	posicoes_tartaruga = {
		{0, 0, 5756},
		{0, -1, 5757},
		{-1, 0, 5758},
		{1, 0, 5759},
		{0, 1, 5755},
		{-1, 1, 5761},
		{1, 1, 5760}
	},
	posicoes_agua = {
		{0, 2},
		{-1, 2},
		{1, 2}
	},
	posicoes_reset = {
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
local posicoes_tartaruga = config.posicoes_tartaruga
local posicoes_agua = config.posicoes_agua
local posicoes_reset = config.posicoes_reset
function gerarIdAgua()
	local objetos = {
		math.random(4608, 4625),
		math.random(4664, 4666)
	}
	local numero_vetor = math.random(0, 10)
	if(numero_vetor <= 8) then
		objeto = objetos[1]
	else
		objeto = objetos[2]
	end
	return objeto
end
function reiniciarTartaruga(posicao)
	local posicao_tartaruga = posicao + {y = passos + 4}
	local posicao_player = posicao + {y = 3}
	for chave, valor in pairs(posicoes_reset) do
		valor_x = valor[1]
		valor_y = valor[2]-1
		objeto = gerarIdAgua()
		posicao_objeto = posicao_player + {x = valor_x, y = valor_y}
		posicao_objeto:getTile():getGround():transform(objeto)
		posicao_objeto:sendMagicEffect(CONST_ME_WATERSPLASH)
		posicao_objeto:sendMagicEffect(CONST_ME_LOSEENERGY)
	end
	criarTartaruga(posicao_tartaruga, -1)
	return true
end
function criarTartaruga(posicao, passo)
	for chave, valor in pairs(posicoes_tartaruga) do
		valor_x = valor[1]
		valor_y = valor[2]-1
		objeto = valor[3]
		posicao_objeto = posicao + {x = valor_x, y = valor_y - passo}
		posicao_objeto:getTile():getGround():transform(objeto)
		if(passo == -1) then
			posicao_objeto:sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end
function criarAgua(posicao, passo)
	for chave, valor in pairs(posicoes_agua) do
		valor_x = valor[1]
		valor_y = valor[2]-1
		objeto = gerarIdAgua()
		posicao_objeto = posicao + {x = valor_x, y = valor_y - passo}
		posicao_objeto:getTile():getGround():transform(objeto)
		posicao_objeto:sendMagicEffect(CONST_ME_WATERSPLASH)
		posicao_objeto:sendMagicEffect(CONST_ME_LOSEENERGY)
	end
	return true
end
function moverTartaruga(player, direcao_y, posicao, passo)
	if(isPlayer(player)) then
		if(passo >= 0) then
			local posicao_player = posicao + {y = direcao_y - passo}
			player:teleportTo(posicao_player, true)
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
	local posicao_player = player:getPosition()
	posicao_player:sendMagicEffect(CONST_ME_POFF)
	local posicao_objeto = posicao_player + {y = -2}
	local checar_tartaruga = posicao_objeto:getTile():getGround():getId()
	local inFight = getCreatureCondition(player, CONDITION_INFIGHT)
	if(inFight == false) then
		if(checar_tartaruga == 5755) then
			if(item.itemid == 1945) then
				Item(item.uid):transform(item.itemid + 1)
			elseif(item.itemid == 1946) then
				Item(item.uid):transform(item.itemid - 1)
			end
			local posicao_player = posicao_player + {y = -3}
			player:teleportTo(posicao_player, true)
			for i = 0, passos, 1 do
				addEvent(moverTartaruga, tempo*i, player, -1, posicao_player, i)
			end
		else
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Aguarde o retorno da tartaruga.")
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você deve sair do combate")
	end
	return true
end