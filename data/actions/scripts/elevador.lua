function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 20224 then
		local elevador = Tile(player:getPosition()):getItemById(20218)
		if elevador ~= nil then
			local novaPosicao = player:getPosition() + {z = -1}
			elevador:remove(1)
			Tile(novaPosicao):getItemById(20222):transform(20218, 1)
			Tile(player:getPosition()):getItemById(20219):remove(1)
			Game.createItem(20219, 1, novaPosicao)
			player:teleportTo(novaPosicao, true)
			Position(novaPosicao + {x = 1}):sendMagicEffect(CONST_ME_BLOCKHIT)
			Position(novaPosicao + {x = 2}):sendMagicEffect(CONST_ME_BLOCKHIT)
			return true
		end
	elseif item.itemid == 20220 then
		local elevador = Tile(player:getPosition()):getItemById(20218)
		if elevador ~= nil then
			local novaPosicao = player:getPosition() + {z = 1}
			fromPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
			Tile(player:getPosition()):getItemById(20218):transform(20222, 1)
			Tile(player:getPosition()):getItemById(20219):remove(1)
			Game.createItem(20218, 1, novaPosicao)
			Game.createItem(20219, 1, novaPosicao)
			player:teleportTo(novaPosicao, true)
			Position(novaPosicao + {x = 1}):sendMagicEffect(CONST_ME_BLOCKHIT)
			Position(novaPosicao + {x = 2}):sendMagicEffect(CONST_ME_BLOCKHIT)
			return true
		end
	end
	return false
end