function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:removeItem(item.itemid, 3) then
		player:addItem(5880)
		player:getPosition():sendMagicEffect(efeitos["green"])
		return true
	end
end