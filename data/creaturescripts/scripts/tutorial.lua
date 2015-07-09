function onLogin(player)
	if player:getName() == "Aman" or player:getName() == "Teste" then
		local posicaoInicioTutorial = Position({x = 301, y = 2426, z = 8})
		player:teleportarJogador(posicaoInicioTutorial)
		player:atualizarPassoTutorial(14)
		-- player:addItem(11421):setActionId(4500)
		-- player:addItem(2559):setActionId(4500)
		-- if passoTutorial == tutorialFinalizado then player:atualizarPassoTutorial(2) end -- linhaTeste
		local passoTutorial = player:pegarPassoTutorial()
		-- print(passoTutorial)
		if passoTutorial ~= tutorialFinalizado then
			player:enviarModalTutorial(passoTutorial)
			player:registerEvent("TutorialModal")
		end
	else
		player:atualizarPassoTutorial(tutorialFinalizado)
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
					player:enviarModalTutorial(9)
				elseif modalWindowId == tutorialId+9 then
					player:tutorialAprenderColeta()
				elseif modalWindowId == tutorialId+13 then
					player:enviarModalTutorial(14)
				elseif modalWindowId == tutorialId+14 then
					player:teleportarJogador(Town(1):getTemplePosition())
					player:enviarModalTutorial(15)
				elseif modalWindowId == tutorialId+15 then
					player:enviarModalTutorial(16)
					player:enviarLinkAcessoRapido("itens", "Itens")
				elseif modalWindowId == tutorialId+16 then
					player:enviarModalTutorial(17)
				elseif modalWindowId == tutorialId+17 then
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
		else
			player:confirmarSairTutorial()
		end
	end
end
