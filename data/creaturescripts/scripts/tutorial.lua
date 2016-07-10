function onLogin(player)
	local passoTutorial = player:pegarPassoTutorial()

	if habilitarTutorial and passoTutorial == 1 then
		local posicaoInicioTutorial = Position({x = 315, y = 2415, z = 7})
		player:teleportarJogador(posicaoInicioTutorial, true)
	end

	addEvent(function(playerId)
		local player = Player(playerId)

		if not player then
			return
		end

		player:registerEvent("TutorialModal")

		if habilitarTutorial and player:checarSemVocacao() then
			player:enviarModalSemVocacao()
		elseif habilitarTutorial and passoTutorial ~= tutorialFinalizado then
			player:enviarModalTutorial(passoTutorial)
		else
			player:unregisterEvent("TutorialModal")
		end
	end, 0, player:getId())

	return true
end

function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if modalWindowId < tutorialId or modalWindowId > tutorialId+tutorialIntervaloMaximo then
		return false
	elseif modalWindowId == tutorialId then
		if buttonId == 1 then
			player:sairTutorial()
			player:teleportarJogador(Town(1):getTemplePosition(), true)
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
					player:teleportarJogador(Town(1):getTemplePosition())
					player:enviarModalTutorial(4)
					player:adicionarMarcasMapa(1)
				elseif modalWindowId == tutorialId+4 then
					player:enviarModalTutorial(5)
				elseif modalWindowId == tutorialId+5 then
					player:enviarModalTutorial(6)
				elseif modalWindowId == tutorialId+6 then
					player:enviarModalTutorial(7)
				elseif modalWindowId == tutorialId+7 then
					player:enviarModalTutorial(8)
				elseif modalWindowId == tutorialId+8 then
					player:enviarModalTutorial(9)
				elseif modalWindowId == tutorialId+9 then
					player:enviarModalTutorial(10)
				elseif modalWindowId == tutorialId+10 then
					player:enviarModalTutorial(11)
				elseif modalWindowId == tutorialId+11 then
					player:teleportarParaGuilda()
					player:enviarModalTutorial(12)
				elseif modalWindowId == tutorialId+12 then
					player:tutorialMestreGuilda()
					player:sairTutorial()
				else
					player:confirmarSairTutorial()
				end
			else
				player:confirmarSairTutorial()
			end
		elseif modalWindowId == tutorialId+tutorialFinalizado+1 then
			if buttonId == 1 then
				player:setVocation(choiceId)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Parabéns! Você se tornou um " .. Vocation(choiceId):getName() .. ".")
				player:getPosition():sendMagicEffect(efeitos["green"])
			else
				player:enviarModalAindaSemVocacao()
			end
		elseif modalWindowId == tutorialId+tutorialFinalizado+2 then
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
