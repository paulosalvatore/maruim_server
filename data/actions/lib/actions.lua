function destroyItem(player, target, toPosition)
	if target == nil or not target:isItem() then
		return false
	end

	if target.actionid == 2902 and target.itemid == 3422 then
		target:transform(3421)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		addEvent(function(posicao)
			local tile = Tile(posicao)
			local item = tile:getItems()[1]
			if item:getActionId() == 2902 then
				item:transform(3422)
			end
		end, 60000, toPosition)
		return true
	end

	if target:hasAttribute(ITEM_ATTRIBUTE_UNIQUEID) or target:hasAttribute(ITEM_ATTRIBUTE_ACTIONID) then
		return false
	end

	if toPosition.x == CONTAINER_POSITION then
		player:sendCancelMessage(Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
		return true
	end

	local destroyId = ItemType(target.itemid):getDestroyId()
	if destroyId == 0 then
		return false
	end

	if math.random(100) <= 15 then
		local item = Game.createItem(destroyId, 1, toPosition)
		if item ~= nil then
			item:decay()
		end

		-- Move items outside the container
		if target:isContainer() then
			for i = target:getSize() - 1, 0, -1 do
   				local containerItem = target:getItem(i)
				if containerItem then
					containerItem:moveTo(toPosition)
				end
			end
		end

		target:remove(1)
	end

	toPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end