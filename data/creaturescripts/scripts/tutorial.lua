function onLogin(player)
	local passoTutorial = player:pegarPassoTutorial()
	if passoTutorial ~= tutorialFinalizado then
		local posicaoJogador = player:getPosition()
		local posicaoTemplo = Town(1):getTemplePosition()
		local posicaoInicioTutorial = Position({x = 315, y = 2415, z = 7})
		if	(posicaoJogador.x == posicaoTemplo.x and
			posicaoJogador.y == posicaoTemplo.y and
			posicaoJogador.z == posicaoTemplo.z) or
			passoTutorial == 1 then
			player:teleportarJogador(posicaoInicioTutorial, true)
		end
	end
	player:registerEvent("TutorialModal")
	if player:checarSemVocacao() then
		player:enviarModalSemVocacao()
	elseif passoTutorial ~= tutorialFinalizado then
		player:enviarModalTutorial(passoTutorial)
	else
		player:unregisterEvent("TutorialModal")
	end
	return true
end

function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if modalWindowId < tutorialId or modalWindowId > tutorialId+tutorialIntervaloMaximo then
		return false
	elseif modalWindowId == tutorialId then
		if buttonId == 1 then
			player:sairTutorial()
		else
			player:enviarModalTutorial(player:pegarPassoTutorial())
		end
	else
		if modalWindowId >= tutorialId+1 and modalWindowId < tutorialId+tutorialFinalizado then
			if buttonId == 1 then
				if modalWindowId == tutorialId+1 and choiceId == 1 then
					player:iniciarTutorial()
				elseif modalWindowId == tutorialId+2 then
					player:enviarModalTutorial(3)
				elseif modalWindowId == tutorialId+3 then
					player:enviarModalTutorial(4)
					player:enviarLinkAcessoRapido("crafting", "Sistema de Crafting")
				elseif modalWindowId == tutorialId+4 then
					player:enviarModalTutorial(5)
					player:enviarLinkAcessoRapido("profissões", "Profissões")
				elseif modalWindowId == tutorialId+5 then
					player:enviarModalTutorial(6)
				elseif modalWindowId == tutorialId+6 then
					player:tutorialFabricarReceita()
				elseif modalWindowId == tutorialId+8 then
					if choiceId == 1 then
						player:addItem(itensKnight[math.random(1, 3)], 1)
					else
						player:addItem(itensKnight[choiceId-1], 1)
					end
					player:enviarModalTutorial(9)
				elseif modalWindowId == tutorialId+9 then
					player:enviarModalTutorial(10)
				elseif modalWindowId == tutorialId+10 then
					player:tutorialAprenderColeta()
				elseif modalWindowId == tutorialId+14 then
					player:enviarModalTutorial(15)
				elseif modalWindowId == tutorialId+15 then
					player:teleportarJogador(Town(1):getTemplePosition())
					player:enviarModalTutorial(16)
				elseif modalWindowId == tutorialId+16 then
					player:enviarModalTutorial(17)
					player:enviarLinkAcessoRapido("itens", "Itens")
				elseif modalWindowId == tutorialId+17 then
					player:enviarModalTutorial(18)
				elseif modalWindowId == tutorialId+18 then
					player:sairTutorial()
				else
					player:confirmarSairTutorial()
				end
			else
				player:confirmarSairTutorial()
			end
		elseif modalWindowId == tutorialId+tutorialFinalizado then
			if buttonId ~= 2 then
				if choiceId == 1 then
					player:tutorialJanelaFabricacaoInformacao()
				elseif choiceId == 2 then
					player:tutorialJanelaFabricacaoLista()
				else
					player:tutorialJanelaFabricacaoIndisponivel()
				end
			end
		elseif modalWindowId == tutorialId+tutorialFinalizado+1 then
			player:tutorialJanelaFabricacao()
		elseif modalWindowId == tutorialId+tutorialFinalizado+2 then
			if buttonId == 1 then
				player:tutorialIniciarFabricacao()
			elseif buttonId == 3 then
				player:tutorialJanelaFabricacaoIndisponivel()
			else
				player:tutorialJanelaFabricacao()
			end
		elseif modalWindowId == tutorialId+tutorialFinalizado+3 then
			player:tutorialJanelaFabricacao()
		elseif modalWindowId == tutorialId+tutorialFinalizado+4 then
			if buttonId == 1 then
				player:setVocation(choiceId)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Parabéns! Você se tornou um " .. Vocation(choiceId):getName() .. ".")
				player:getPosition():sendMagicEffect(efeitos["green"])
			else
				player:enviarModalAindaSemVocacao()
			end
		elseif modalWindowId == tutorialId+tutorialFinalizado+5 then
			if buttonId == 1 then
				player:enviarModalSemVocacao()
			else
				player:remove()
			end
		else
			player:confirmarSairTutorial()
		end
	end
end
