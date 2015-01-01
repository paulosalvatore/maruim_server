function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if(item.itemid == 16016 and itemEx.itemid == 16017) then
		Item(item.uid):transform(itemEx.itemid+2)
	elseif(item.itemid == 16018 and (itemEx.itemid == 16020 or itemEx.itemid == 16021)) then
		Item(itemEx.uid):transform(itemEx.itemid+2)
		Item(item.uid):remove()
	elseif(item.itemid == 16019 and (itemEx.itemid == 16022 or itemEx.itemid == 16023)) then
		local chance = math.random(0, 100)
		local value = 0
		if(chance < 70) then
			value = math.random(1, 2)
		else
			value = math.random(1, 4)
		end
		Item(item.uid):transform(item.itemid-3)
		Item(itemEx.uid):transform(itemEx.itemid+value*2)
	else
		return false
	end
	return true
end