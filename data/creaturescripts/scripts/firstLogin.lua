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
	end
	if player:pegarPassoTutorial() == tutorialFinalizado and player:getStorageValue(storageItensKnight) ~= 1 then
		player:enviarModalItensKnight()
	end
	return true
end
