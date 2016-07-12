local delay = 30

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if item.itemid == 1948 then
		if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
			return player:sendCancelMessage("Você deve sair de combate.")
		end

		if player:getLevel() > 30 then
			return player:sendCancelMessage("Somente jogadores de nível 30 ou inferior podem utilizar esse item.")
		end

		local storagePergaminhoTeleporte = Storage.pergaminhoTeleporte

		if player:getAccountType() < ACCOUNT_TYPE_GOD and player:getStorageValue(storagePergaminhoTeleporte) + delay > os.time() then
			return player:sendCancelMessage("Você deve aguardar " .. formatarTempo(delay) .. " antes de teleportar novamente.")
		end

		player:abrirModalPergaminhoTeleporte(1)

	end

	return true
end