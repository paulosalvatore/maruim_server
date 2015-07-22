function carregarMiniMapa(playerId)
	local xInicio = 0
	local xFinal = 3000
	local yInicio = 0
	local yFinal = 3000
	local zInicio = 0
	local zFinal = 15
	local i = 0
	local j = 200
	for z = zInicio, zFinal do
		for x = xInicio, xFinal, 14 do
			for y = yInicio, yFinal, 14 do
				local posicao = Position(x, y, z)
				local piso = Tile(posicao)
				if piso then
					if piso:getGround() then
						addEvent(function(playerId)
							local player = Player(playerId)
							if not player then
								return
							end
							player:teleportTo(posicao)
						end, j*i, playerId)
					end
					i = i+1
					if i == 100 then
						j = 150
					elseif i == 200 then
						j = 100
					elseif i == 300 then
						j = 50
					elseif i == 400 then
						j = 30
					elseif i == 500 then
						j = 10
					end
				end
			end
		end
	end
	addEvent(function(playerId)
		local player = Player(playerId)
		if not player then
			return
		end
		player:teleportTo(Town(1):getTemplePosition())
	end, j*i, playerId)
end