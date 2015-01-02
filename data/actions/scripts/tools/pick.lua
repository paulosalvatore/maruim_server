function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid == 354 or itemEx.itemid == 355 then
		local iEx = Item(itemEx.uid)
		iEx:transform(392)
		iEx:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif itemEx.itemid == 8934 then
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
		Item(itemEx.uid):transform(itemEx.itemid+1)
		Item(itemEx.uid):decay()
		toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
	else
		return false
	end
	return true
end
