function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local storageValue = player:getStorageValue(Storage.Horestis.Horestis.horestis)

	if item.actionid == 3302 then
		if item.itemid == 1560 then
			player:teleportarJogador({x = 1425, y = 1595, z = 7})
			return true
		end

		if storageValue < 1 and (item.itemid == 13718 or item.itemid == 13719) then
			doCreatureSayWithRadius(player, "HRSTSSSSSSSSSSSSSSSSS", TALKTYPE_MONSTER_SAY, 2, 2, toPosition)
			toPosition:sendMagicEffect(efeitos["hit"])
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Um som estranho parece ter vindo de dentro do sarcófago. Rumores antigos diziam que essas múmias ainda haviam algo para nos contar.")
			player:setStorageValue(Storage.Horestis.horestis, 1)
			return true
		elseif storageValue == 1 and item.itemid == 13724 then
			doCreatureSayWithRadius(player, "*click*", TALKTYPE_MONSTER_SAY, 2, 2, toPosition)
			toPosition:sendMagicEffect(efeitos["hit"])
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Uma peça se movimentou nessa estátua, parece uma espécie de entrada secreta.")
			player:setStorageValue(Storage.Horestis.horestis, 2)
			return true
		elseif storageValue == 2 and item.itemid == 13722 then
			doCreatureSayWithRadius(player, "*click*", TALKTYPE_MONSTER_SAY, 2, 2, toPosition)
			toPosition:sendMagicEffect(efeitos["hit"])
			player:getPosition():sendMagicEffect(efeitos["rage_skies"])
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Uma gravura apareceu na estátua: 'O portal se abriu'.")
			player:setStorageValue(Storage.Horestis.horestis, 3)
			return true
		elseif storageValue == 3 and item.itemid == 13723 then
			toPosition:sendMagicEffect(efeitos["hit"])
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Você encontrou a sala do portal. Destrua os vasos que representam o deus egípcio adormecido há mil anos nessa tumba.")
			player:setStorageValue(Storage.Horestis.horestis, 4)
		elseif storageValue == 5 or storageValue == 6 then
			if item.itemid == 1945 or item.itemid == 1946 then
				local acessoLiberado = player:getStorageValue(Storage.Horestis.horestisAcessoLiberado)

				if acessoLiberado == 1 then
					local itensNecessarios = configHorestis.itensNecessarios

					local totalItens = 0

					for a, item in pairs(itensNecessarios) do
						if player:getItemCount(item) > 0 then
							totalItens = totalItens + 1
						end
					end

					if totalItens ~= #itensNecessarios then
						player:say("Você não possui os artefatos mágicos!", TALKTYPE_MONSTER_SAY)
						return true
					end

					if not configHorestis.jogadorSala then
						configHorestis.jogadorSala = player:getId()
						configHorestis.jogadorSaiu = false

						player:desativarLogout()
						player:registerEvent("Horestis")
						player:teleportarJogador({x = 1478, y = 1609, z = 8})
						Game.createMonster("Horestis", {x = 1478, y = 1621, z = 8})

						if item.itemid == 1945 then
							item:transform(item.itemid + 1)
						elseif item.itemid == 1946 then
							item:transform(item.itemid - 1)
						end
					else
						player:sendTextMessage(MESSAGE_INFO_DESCR, "Você não pode puxar essa alavanca no momento.")
						return true
					end
				else
					player:say("Você está muito apavorado para puxar essa alavanca!", TALKTYPE_MONSTER_SAY)
					return true
				end
			end
		end

		if storageValue >= 3 and item.itemid == 13723 then
			player:teleportarJogador({x = 1423, y = 1596, z = 8})
			return true
		end
	elseif item.actionid >= 3304 and item.actionid <= 3308 then

		if item.itemid == 13495 then
			player:say("Esse jarro já está quebrado!", TALKTYPE_MONSTER_SAY)
			return true
		end

		if player:getStorageValue(Storage.Horestis.horestisJarrosBloqueados) > os.time() then
			player:say("Você está muito apavorado para destuir esse artefato!", TALKTYPE_MONSTER_SAY)
			return true
		end

		player:setStorageValue(item.actionid, 1)
		item:getPosition():sendMagicEffect(efeitos["hit"])
		item:transform(13495)
		item:decay()

		local totalStorage = 0

		for i = Storage.Horestis.horestisJarro1, Storage.Horestis.horestisJarro5 do
			if player:getStorageValue(i) == 1 then
				totalStorage = totalStorage + 1
			end
		end

		if totalStorage == 5 then
			player:getPosition():sendMagicEffect(efeitos["rage_skies"])
			player:say("HOOOOOOOREEEEEEEEEEEEEEEEESTIIIIIIIIIIISSSSSSSSSSSSSSSSSS", TALKTYPE_MONSTER_SAY)

			if storageValue == 4 then
				player:setStorageValue(Storage.Horestis.horestis, 5)
			end

			for i = Storage.Horestis.horestisJarro1, Storage.Horestis.horestisJarro5 do
				player:setStorageValue(i, 0)
			end

			player:setStorageValue(Storage.Horestis.horestisJarrosBloqueados, os.time() + configHorestis.delay.destruirJarros)
			player:setStorageValue(Storage.Horestis.horestisAcessoLiberado, 1)
		end

		return true
	end

	return false
end