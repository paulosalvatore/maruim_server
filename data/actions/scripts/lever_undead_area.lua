function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local storages = {6501, 6502, 6503}
	local storage = item:getActionId()
	local storageValue = player:getStorageValue(storage)

	if storageValue == 1 then
		return player:sendCancelMessage("Você já destravou essa alavanca.")
	end

	local storagesValores = 0
	for a, b in pairs(storages) do
		if player:getStorageValue(b) == 1 then
			storagesValores = storagesValores + 1
		end
	end

	if storagesValores == 2 then
		local storagePrincipal = 6500
		player:setStorageValue(storagePrincipal, 1)
	elseif storagesValores == 3 then
		return player:sendCancelMessage("Você já destravou todas as alavancas.")
	end

	player:setStorageValue(storage, 1)

	local mensagem
	if storagesValores == 2 then
		mensagem = "Você destravou a terceira e última alavanca. Agora você poderá acessar toda a caverna."
	else
		mensagem = "Você destravou a " .. (storagesValores == 0 and "primeira" or "segunda") .. " alavanca. Resta" .. (storagesValores < 1 and "m" or "") .. " apenas " .. 2 - storagesValores .. " alavanca" .. (storagesValores < 1 and "s" or "") .. "."
	end

	player:sendTextMessage(MESSAGE_EVENT_DEFAULT, mensagem)

	if item:getId() == 9827 then
		item:transform(item:getId() + 1)
	elseif item:getId() == 9828 then
		item:transform(item:getId() - 1)
	end
	return true
end