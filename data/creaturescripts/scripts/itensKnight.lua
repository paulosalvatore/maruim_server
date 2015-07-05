function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if modalWindowId == modalItensKnight then
		if choiceId == 1 then
			player:addItem(itensKnight[math.random(1, 3)], 1)
		else
			player:addItem(itensKnight[choiceId-1], 1)
		end
		player:setStorageValue(storageKnightItens, 1)
	else
		return false
	end
end