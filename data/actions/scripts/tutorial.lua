function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9895 or item.itemid == 9898 then
		if not dadosTutorial.linkJanela[player:getId()] then
			player:enviarLinkAcessoRapido("janela profissão", "Detalhamento da Janela de Profissões")
			dadosTutorial.linkJanela[player:getId()] = true
		end
		dadosTutorial.mesa[player:getId()] = Item(item.uid)
		player:tutorialJanelaFabricacao()
	elseif target.itemid == 8047 then
		local passoTutorial = player:pegarPassoTutorial()
		if passoTutorial == 11 then
			player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Neutro: A tentativa de coleta falhou (o brilho permanece).")
			target:getPosition():sendMagicEffect(efeitos["poff"])
			player:atualizarPassoTutorial(12)
		elseif passoTutorial == 12 then
			player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Falha: A tentativa de coleta falhou (o brilho some).")
			target:getPosition():sendMagicEffect(efeitos["poff"])
			player:atualizarPassoTutorial(13)
			addEvent(function(posicao)
				Game.createItem(8047, 1, posicao)
			end, 3000, target:getPosition())
			target:remove(1)
		elseif passoTutorial == 13 then
			player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Sucesso: A tentativa de coleta foi bem sucedida (você recebe o item).")
			target:getPosition():sendMagicEffect(efeitos["hit"])
			addEvent(function(playerId)
				player:enviarModalTutorial(14)
			end, 1000, player:getId())
			addEvent(function(posicao)
				Game.createItem(8047, 1, posicao)
			end, 3000, target:getPosition())
			target:remove(1)
		end
	else
		return false
	end
	return true
end