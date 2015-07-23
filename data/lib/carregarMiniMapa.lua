local posicoesMiniMapa = {}

function carregarPosicoesMiniMapa()
	local xInicio = 0
	local xFinal = 3000
	local yInicio = 0
	local yFinal = 3000
	local zInicio = 0
	local zFinal = 15
	for z = zInicio, zFinal do
		for x = xInicio, xFinal, 10 do
			for y = yInicio, yFinal, 10 do
				local posicao = Position(x, y, z)
				local piso = Tile(posicao)
				if piso then
					if piso:getGround() then
						table.insert(posicoesMiniMapa, posicao)
					end
				end
			end
		end
	end
end

function carregarMiniMapa(playerId, posicaoAtual)

	local player = Player(playerId)

	if not player then
		return
	end

	if posicaoAtual == nil then
		posicaoAtual = 1
	end

	player:teleportTo(posicoesMiniMapa[posicaoAtual])

	print(posicaoAtual, #posicoesMiniMapa)

	if posicaoAtual + 1 <= #posicoesMiniMapa then
		addEvent(carregarMiniMapa, 5, playerId, posicaoAtual + 1)
	end
end
