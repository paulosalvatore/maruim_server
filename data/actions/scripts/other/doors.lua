local vocationDoor = {
	[905] = {1, 5},
	[906] = {2, 6},
	[907] = {3, 7},
	[908] = {4, 8}
}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	if vocationDoor[item.actionid] ~= nil then
		if not isInArray(vocationDoor[item.actionid], player:getVocation():getId()) then
			player:sendCancelMessage("Você precisa ser um " .. Vocation(vocationDoor[item.actionid][1]):getName() .. " para abrir essa porta.")
			return true
		end
		item:transform(itemId + 1)
		return true
	end
	if isInArray(questDoors, itemId) then
		if player:getStorageValue(item.actionid) ~= -1 then
			item:transform(itemId + 1)
			player:teleportTo(toPosition, true)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Essa porta parece estar selada contra intrusos indesejados.")
		end
		return true
	elseif isInArray(levelDoors, itemId) then
		if item.actionid > 0 and player:getLevel() >= item.actionid - 1000 then
			item:transform(itemId + 1)
			player:teleportTo(toPosition, true)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Apenas os dignos podem passar.")
		end
		return true
	elseif isInArray(keys, itemId) then
		if target.actionid > 0 then
			if item.actionid == target.actionid and doors[target.itemid] then
				target:transform(doors[target.itemid])
				return true
			end
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "A chave não corresponde.")
			return true
		end
		return false
	end

	if isInArray(horizontalOpenDoors, itemId) or isInArray(verticalOpenDoors, itemId) then
		local doorCreature = Tile(toPosition):getTopCreature()
		if doorCreature ~= nil then
			toPosition.x = toPosition.x + 1
			local query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
			if query ~= RETURNVALUE_NOERROR then
				toPosition.x = toPosition.x - 1
				toPosition.y = toPosition.y + 1
				query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
			end

			if query ~= RETURNVALUE_NOERROR then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, query)
				return true
			end

			doorCreature:teleportTo(toPosition, true)
		end

		if not isInArray(openSpecialDoors, itemId) then
			item:transform(itemId - 1)
		end
		return true
	end

	if doors[itemId] then
		if item.actionid == 0 then
			item:transform(doors[itemId])
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Está trancada.")
		end
		return true
	end
	return false
end
