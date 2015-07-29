local elevadores = {
	{
		[20220] = "em cima",
		[20224] = "embaixo",
		pecas = {20218, 20219, 20222, 20223}
	},
	{
		[23422] = "em cima",
		[23429] = "embaixo",
		pecas = {23432, 23421, 23424, 23428}
	}
}
local function moverElevador(cid, ativadorUid, posicao)
	local ativador = Item(ativadorUid)
	local ativadorId = ativador:getId()
	local localAtivador = nil
	local ativadoresIds = {}
	local config = nil
	for a, b in pairs(elevadores) do
		table.insert(ativadoresIds, {})
		for c, d in pairs(b) do
			if c ~= "pecas" then
				table.insert(ativadoresIds[a], c)
			end
			if c == ativadorId then
				pecas = b.pecas
				localAtivador = d
				config = a
			end
		end
	end
	if config == nil or ativadorId == nil or localAtivador == nil then
		return false
	end
	ativadoresIds = ativadoresIds[config]
	table.sort(ativadoresIds)
	local player = Player(cid)
	local posicaoJogador = player:getPosition()
	local posicaoElevador = posicao + {x = -1}
	local checarElevador = Tile(posicaoElevador):getItemById(pecas[1])
	local acao = ""
	local posicaoAtivador = ativador:getPosition()
	local posicoesAtivadores = {}
	if localAtivador == "embaixo" then
		posicoesAtivadores[1] = posicaoAtivador + {z = -1}
		posicoesAtivadores[2] = posicaoAtivador
		if checarElevador == nil then
			posicaoElevador = posicaoElevador + {z = -1}
			acao = "descer"
		else
			acao = "subir"
		end
	elseif localAtivador == "em cima" then
		posicoesAtivadores[1] = posicaoAtivador
		posicoesAtivadores[2] = posicaoAtivador + {z = 1}
		if checarElevador == nil then
			posicaoElevador = posicaoElevador + {z = 1}
			acao = "subir"
		else
			acao = "descer"
		end
	end
	local elevador = Tile(posicaoElevador):getItemById(pecas[1])
	if elevador == nil then
		return false
	end
	local novaPosicao
	if acao == "subir" then
		novaPosicao = posicaoElevador + {z = -1}
		elevador:remove(1)
		Tile(posicaoElevador):getItemById(pecas[4]):remove(1)
		Tile(novaPosicao):getItemById(pecas[3]):transform(pecas[1], 1)
		Game.createItem(pecas[2], 1, novaPosicao)
	elseif acao == "descer" then
		novaPosicao = posicaoElevador + {z = 1}
		Game.createItem(pecas[1], 1, novaPosicao)
		Game.createItem(pecas[4], 1, novaPosicao)
		Tile(posicaoElevador):getItemById(pecas[1]):transform(pecas[3], 1)
		Tile(posicaoElevador):getItemById(pecas[2]):remove(1)
	end
	local tempoElevadorDesativado = 1000
	if posicaoJogador.x == posicaoElevador.x and posicaoJogador.y == posicaoElevador.y and posicaoJogador.z == posicaoElevador.z then
		player:teleportTo(novaPosicao, true)
		tempoElevadorDesativado = 5000
	end
	Tile(posicoesAtivadores[1]):getItemById(ativadoresIds[1]):setActionId(itemDesativado)
	Tile(posicoesAtivadores[2]):getItemById(ativadoresIds[2]):setActionId(itemDesativado)
	addEvent(function(posicoesAtivadores, ativadoresIds)
		Tile(posicoesAtivadores[1]):getItemById(ativadoresIds[1]):removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
		Tile(posicoesAtivadores[2]):getItemById(ativadoresIds[2]):removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
	end, tempoElevadorDesativado, posicoesAtivadores, ativadoresIds)
	player:say("Zrrrt!", TALKTYPE_ORANGE_1, true, 0, posicaoElevador + {x = 1})
	player:say("Zrrrt!", TALKTYPE_ORANGE_1, true, 0, novaPosicao + {x = 1})
	Position(posicaoElevador + {x = 1}):sendMagicEffect(CONST_ME_BLOCKHIT)
	Position(posicaoElevador + {x = 2}):sendMagicEffect(CONST_ME_BLOCKHIT)
	Position(novaPosicao + {x = 1}):sendMagicEffect(CONST_ME_BLOCKHIT)
	Position(novaPosicao + {x = 2}):sendMagicEffect(CONST_ME_BLOCKHIT)
	return true
end
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
		return player:sendCancelMessage("Você está em batalha.")
	end
	return moverElevador(player.uid, item.uid, fromPosition)
end