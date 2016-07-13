local montariaIds = {22, 25, 26}

function onThink(interval)
	local players = Game.getPlayers()
	if #players == 0 then
		return true
	end

	local player, outfit

	for i = 1, #players do
		player = players[i]
		if player:getStorageValue(Storage.aluguelMontaria) < 1 or player:getStorageValue(Storage.aluguelMontaria) >= os.time() then
			break
		end

		outfit = player:getOutfit()
		if isInArray(montariaIds, outfit.lookMount) then
			outfit.lookMount = nil
			player:setOutfit(outfit)
		end

		for m = 1, #montariaIds do
			player:removeMount(montariaIds[m])
		end

		player:setStorageValue(Storage.aluguelMontaria, -1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O seu contrato com o aluguel do cavalo expirou e ele retornou ao estábulo.")
	end

	return true
end
