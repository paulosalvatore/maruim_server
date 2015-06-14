function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if	not modalWindowId == modalTeleportCrystal or
		buttonId == 2 then
		return false
	elseif modalWindowId == modalTeleportCrystal then
		local redTeleportCrystal = 18509
		local item = player:getItemById(redTeleportCrystal, -1)
		if player:getAccountType() == ACCOUNT_TYPE_GOD or (item ~= nil and item:remove(1)) then
			player:setStorageValue(Storage.redTeleportCrystal, os.time())
			player:teleportarJogador(posicoesDepot[choiceId], false, true)
		else
			player:sendCancelMessage("Você precisa ter o item '" .. calAll(ItemType(redTeleportCrystal):getName()) .. "' para teleportar.")
		end
	end
end