local tempoTeleportCrystal = 60
local tempoRedTeleportCrystal = 10*60
local mensagemTempoTeleportCrystal = "1 minuto"
local mensagemTempoRedTeleportCrystal = "10 minutos"

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemNome = capAll(item:getName())
	if player:verificarFila() > 0 then
		return player:sendCancelMessage("Você não pode usar o '" .. itemNome .. "' enquanto está no localizador de masmorras.")
	end

	if player:verificarMasmorra() > 0 then
		return player:sendCancelMessage("Você não pode usar o '" .. itemNome .. "' enquanto está em uma masmorra.")
	end

	if not player:getGroup():getAccess() and not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		return player:sendCancelMessage("Você precisa estar em uma 'protection zone' para que o '" .. itemNome .. "' funcione.")
	end

	if item.itemid == 18457 then
		local storageTeleportCrystal = Storage.teleportCrystal

		if player:getAccountType() < ACCOUNT_TYPE_GOD and player:getStorageValue(storageTeleportCrystal)+tempoTeleportCrystal > os.time() then
			return player:sendCancelMessage("Você deve aguardar " .. mensagemTempoTeleportCrystal .. " antes de usar o '" .. itemNome .. "' novamente.")
		end

		player:setStorageValue(storageTeleportCrystal, os.time())

		if player:getAccountType() == ACCOUNT_TYPE_GOD or item:remove(1) then
			player:setStorageValue(Storage.redTeleportCrystal, os.time())
			player:teleportarJogador(player:getTown():getTemplePosition(), false, true)
		else
			player:sendCancelMessage("Você precisa ter o item '" .. itemNome .. "' para teleportar.")
		end
	elseif item.itemid == 18509 then
		local storageRedTeleportCrystal = Storage.redTeleportCrystal

		if player:getAccountType() < ACCOUNT_TYPE_GOD and player:getStorageValue(storageRedTeleportCrystal)+tempoTeleportCrystal > os.time() then
			return player:sendCancelMessage("Você deve aguardar " .. mensagemTempoRedTeleportCrystal .. " antes de usar o '" .. itemNome .. "' novamente.")
		end

		local modalTitulo = "Escolha uma Cidade para Teleportar"
		local modalMensagem = "Escolha uma das cidades abaixo e você irá teleportar para seu respectivo Depot.\n\nPara qual cidade deseja ir?\n"
		local modal = ModalWindow(modalTeleportCrystal, modalTitulo, modalMensagem)

		for a, b in pairs(Game.getTowns()) do
			if posicoesDepot[a] ~= nil then
				modal:addChoice(b:getId(), formatarNomeCidade(b:getName()))
			end
		end

		modal:addButton(1, "Escolher")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(player)

		player:registerEvent("TeleportCrystal")
	end

	return true
end