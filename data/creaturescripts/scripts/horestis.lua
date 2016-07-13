function onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)

	if creature:getName() == "Horestis" then
		local playerId = configHorestis.jogadorSala
		local player = Player(playerId)

		if not player then
			return true
		end

		if player:getStorageValue(Storage.Horestis.horestis) == 5 then
			player:setStorageValue(Storage.Horestis.horestis, 6)
		end

		player:setStorageValue(Storage.Horestis.horestisAcessoLiberado, 0)

		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O antigo deus egípicio Horestis foi derrotado. Você tem 3 minutos para deixar essa sala.")

		local teleportUid = doCreateTeleport(1387, configHorestis.destinoTeleporte, configHorestis.posicaoTeleporte)
		local teleport = Item(teleportUid)
		teleport:setActionId(3302)
		configHorestis.teleport = teleport

		addEvent(function(playerId)
			configHorestis.teleport:remove()

			if not configHorestis.jogadorSaiu then
				local player = Player(playerId)
				player:teleportarJogador(configHorestis.destinoTeleporte)
				configHorestis.jogadorSaiu = true
			end

			player:ativarLogout()

			configHorestis.jogadorSala = false
		end, configHorestis.delay.aposMatar, playerId)
	else
		local horestis = Creature("Horestis")
		horestis:remove()
		addEvent(function()
			configHorestis.jogadorSala = false
		end, configHorestis.delay.liberarSalaAposMorte)
		creature:ativarLogout()
	end

	return true
end
