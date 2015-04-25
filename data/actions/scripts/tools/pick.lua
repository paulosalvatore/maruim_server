function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 354 or target.itemid == 355 then
		target:transform(392)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif target.itemid == 8934 then
		local chance = math.random(1, 100)
		local adicionarItem
		if chance <= 15 then
			adicionarItem = 2145
		elseif chance <= 30 then
			adicionarItem = 10169
		end
		if adicionarItem ~= nil then
			player:addItem(adicionarItem, 1)
		end
		target:transform(target.itemid+1)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
	else
		return false
	end
	return true
end
