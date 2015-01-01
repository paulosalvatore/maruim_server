function onAddItem(moveItem, tileItem, position)
	if moveItem.itemid == 2047 then
		Item(moveItem.uid):transform(6280)
	end
	return true
end
