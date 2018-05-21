function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then
		return false
	end
	
	local ignorar = {3303}

	if not isInArray(ignorar, item.actionid) and player:getStorageValue(item.actionid) == -1 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		player:teleportTo(fromPosition, true)
		return false
	end
	return true
end
