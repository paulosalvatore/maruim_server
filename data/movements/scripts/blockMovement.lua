function onStepIn(player, item, position, fromPosition)

	if position.x == fromPosition.x and position.y == fromPosition.y and fromPosition.z == position.z then
		player:teleportarJogador(player:getTown():getTemplePosition(), true)
		return false
	end

	player:teleportTo(fromPosition)
	return true
end
