local delay = 30

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if item.itemid == 1948 then
		if player:pegarPassoTutorial() ~= tutorialFinalizado then
			return player:sendCancelMessage("Você não pode usar o pergaminho de teleporte antes de sair do tutorial.")
		end

		if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
			return player:sendCancelMessage("Você deve sair de combate.")
		end

		local storagePergaminhoTeleporte = Storage.pergaminhoTeleporte

		if player:getAccountType() < ACCOUNT_TYPE_GOD and player:getStorageValue(storagePergaminhoTeleporte) + delay > os.time() then
			return player:sendCancelMessage("Você deve aguardar " .. formatarTempo(delay) .. " antes de teleportar novamente.")
		end

		player:abrirModalPergaminhoTeleporte(1)

	end

	return true
end