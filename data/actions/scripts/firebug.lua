function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local items = {
		[5466] = 5465,
		[1485] = 1484,
		[7538] = 7544,
		[7539] = 7545
	}
	local fail = 5
	local chance = math.random(0, 100)
	if(items[itemEx.itemid]) then
		if(chance > fail) then
			local iEx = Item(itemEx.uid)
			doSendMagicEffect(iEx:getPosition(), CONST_ME_HITBYFIRE)
			iEx:transform(items[itemEx.itemid])
			iEx:decay()
		else
			Item(item.uid):remove()
			doTargetCombatHealth(0, player, COMBAT_FORMULA_DAMAGE, -5, -5, CONST_ME_FIREAREA)
		end
		return true
	end
	return destroyItem(player, itemEx, toPosition)
end
