function onLogin(player)
	if player:getLastLoginSaved() == 0 then
		for i = 1, 733 do
			if player:hasOutfit(i) then
				player:addOutfitAddon(i, 1)
				player:addOutfitAddon(i, 2)
			end
		end
		for i = 1, 80 do
			player:addMount(i)
		end
		player:addItem(2050, 1)
		player:addItem(1988, 1):addItem(2789, 10)
		local item = player:addItem(3901, 1)
		item:setAttribute(ITEM_ATTRIBUTE_NAME, "rope and shovel kit")
		item:setAttribute(ITEM_ATTRIBUTE_WEIGHT, 100)
		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Use it only when you need a rope or a shovel.")
		item:setActionId(3901)
		player:sendOutfitWindow()
	end
	if player:getVocation():getId() == 4 and player:pegarPassoTutorial() == tutorialFinalizado and player:getStorageValue(Storage.itensKnight) ~= 1 then
		player:enviarModalItensKnight()
	end
	return true
end
