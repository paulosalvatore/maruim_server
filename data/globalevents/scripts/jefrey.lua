local posicaoInicialNpc = Position(625, 1097, 7)
local nomeNpc = "Jefrey"
local cama = {7811, 7812}
local camaDormir = {7787, 7788}
local portaFechada = 1221
local portaAberta = 1222
local itemDormindo = 13562
local walkInterval = 800
local movimentos = 4

function moverNpc(npcId, x, y)
	local npc = Npc(npcId)
	local posicao = npc:getPosition()
	local novaPosicao = posicao+{x = x, y = y}

	if Tile(novaPosicao):getItemById(portaFechada) ~= nil then
		Tile(novaPosicao):getItemById(portaFechada):transform(portaAberta)
	end

	npc:teleportTo(novaPosicao, true)

	if Tile(posicao):getItemById(portaAberta) ~= nil then
		addEvent(function()
			Tile(posicao):getItemById(portaAberta):transform(portaFechada)
		end, 600)
	end
end

function transformarCama(npc, dormir)
	if dormir == true then
		npc = Npc(npc)
		local posicaoNpc = npc:getPosition()
		local posicaoCama = {posicaoNpc+{x = -1, y = -1}, posicaoNpc+{x = -1}}
		Tile(posicaoCama[1]):getItemById(cama[1]):transform(camaDormir[1])
		Tile(posicaoCama[2]):getItemById(cama[2]):transform(camaDormir[2])
		Game.createItem(itemDormindo, 1, posicaoCama[1])
		npc:remove()
	else
		local posicaoCama = {posicaoInicialNpc+{x = -1, y = -1}, posicaoInicialNpc+{x = -1}}
		if Tile(posicaoCama[1]):getItemById(itemDormindo) ~= nil then
			Tile(posicaoCama[1]):getItemById(itemDormindo):remove()
		end
		if Tile(posicaoCama[1]):getItemById(camaDormir[1]) ~= nil then
			Tile(posicaoCama[1]):getItemById(camaDormir[1]):transform(cama[1])
		end
		if Tile(posicaoCama[2]):getItemById(camaDormir[2]) ~= nil then
			Tile(posicaoCama[2]):getItemById(camaDormir[2]):transform(cama[2])
		end
	end
end

function iniciarJefrey()
	local npc = Npc(nomeNpc)
	if npc ~= nil then
		local npcId = npc:getId()
		for i = 0, movimentos do
			addEvent(moverNpc, i*walkInterval, npcId, 0, -1)
		end
		addEvent(transformarCama, (movimentos+1)*walkInterval, npcId, true)
	else
		transformarCama(nomeNpc, false)
		npc = Game.createNpc(nomeNpc, posicaoInicialNpc)
		for i = 0, movimentos do
			addEvent(moverNpc, i*walkInterval, npc:getId(), 0, 1)
		end
		addEvent(function(npcId)
			Npc(npcId):setDirection(direcoes["leste"])
		end, walkInterval*movimentos+300, npc:getId())
	end
end

function onThink(interval, lastExecution)
	-- iniciarJefrey()
    return true
end