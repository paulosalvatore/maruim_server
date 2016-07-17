function onStepOut(creature, item, position, fromPosition)
	if creature:isPlayer() and creature:isInGhostMode() then
		return true
	end

	local itemId = item:getId()
	if itemId == 670 then
		item:transform(6594)
	else
		item:transform(itemId + 15)
	end

	item:decay()
	return true
end
