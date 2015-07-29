function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local posicao = item:getPosition()
	local posicaoTeleportar = posicao
	local direcao
	if posicao.x == 861 or posicao.x == 867 then
		posicaoTeleportar = posicaoTeleportar + {x = 2, y = 1}
		direcao = "leste"
	elseif posicao.x == 863 or posicao.x == 869 then
		posicaoTeleportar = posicaoTeleportar + {x = -2, y = 1}
		direcao = "oeste"
	elseif posicao.y == 1488 then
		posicaoTeleportar = posicaoTeleportar + {x = -1, y = 2}
	elseif posicao.y == 1491 then
		posicaoTeleportar = posicaoTeleportar + {x = -1, y = -3}
		direcao = "norte"
	end
	player:teleportarJogador(posicaoTeleportar, true, false, direcao)
end