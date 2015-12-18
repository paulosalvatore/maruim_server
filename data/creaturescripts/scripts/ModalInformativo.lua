function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if modalWindowId ~= 5201 and modalWindowId ~= 5202 then
		return false
	elseif modalRecompensaAberto[player:getId()] ~= nil then
		modalRecompensaAberto[player:getId()] = false
	end
end
