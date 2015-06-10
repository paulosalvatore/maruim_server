local vocationDoor = {
	[905] = {1, 5},
	[906] = {2, 6},
	[907] = {3, 7},
	[908] = {4, 8}
}
local config = {
	-- ["action" ou "unique"] = {
		-- [action_id ou unique_id] = {
			-- storage = numero de storage (informar apenas se for diferente da action_id ou unique_id),
			-- valor = valor do storage (informar apenas se for diferente de 1),
		-- }
	-- }
	["action"] = {
		[5500] = {
			storage = 2900,
			valor = 2
		}
	},
	["unique"] = {
	}
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
		local storage = item.actionid
		local valor = 1
		if config["action"][item.actionid] or config["unique"][item.uid] then
			local i
			if config["action"][item.actionid] then
				i = config["action"][item.actionid]
			elseif config["unique"][item.uid] then
				i = config["unique"][item.uid]
			end
			if i.storage ~= nil then
				storage = i.storage
			end
			if i.valor ~= nil then
				valor = i.valor
			end
		end
		if player:getStorageValue(storage) == valor then
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
		if target.actionid > 0 and target.uid > 0 then
			if item.actionid == target.actionid and doors[target.itemid] then
				target:removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
				target:transform(doors[target.itemid])
				return true
			end
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "A chave não corresponde.")
			return true
		elseif target.uid > 0 then
			if item.actionid == target.uid then
				if doors[target.itemid] then
					target:setActionId(target.uid)
					player:sendTextMessage(MESSAGE_INFO_DESCR, "Você trancou a porta.")
					return true
				elseif isInArray(horizontalOpenDoors, target.itemid) then
					target:setActionId(target.uid)
					target:transform(target.itemid - 1)
					player:sendTextMessage(MESSAGE_INFO_DESCR, "Você trancou a porta.")
					return true
				end
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
