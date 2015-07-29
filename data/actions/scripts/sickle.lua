function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 5464 then
		target:transform(5463)
		target:decay()
		Game.createItem(5467, 1, toPosition)
		return true
	elseif target.itemid == 11043 then
		target:transform(11050)
		target:decay()
		Game.createItem(11245, 1, toPosition)
		return true
	end
	return destroyItem(player, target, toPosition)
end
