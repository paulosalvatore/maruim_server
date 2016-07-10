function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if not modalWindowId == modalPergaminhoTeleporte or
	not modalWindowId == modalPergaminhoTeleporte + 1 or
	buttonId == 2 then
		return false
	elseif modalWindowId == modalPergaminhoTeleporte then
		if choiceId == 1 then
			player:setStorageValue(Storage.pergaminhoTeleporte, os.time())
			player:teleportarJogador(Town(1):getTemplePosition(), true)
		elseif choiceId == 2 then
			player:teleportarParaGuilda()
		elseif choiceId == 3 then
			player:abrirModalPergaminhoTeleporte(2)
		elseif choiceId == 4 then
			player:abrirModalPergaminhoTeleporte(3)
		elseif choiceId == 5 then
			player:abrirModalSaidaMaruimIsland(1)
		end
	elseif modalWindowId == modalPergaminhoTeleporte + 1 or
	modalWindowId == modalPergaminhoTeleporte + 2 then
		if buttonId == 1 then
			local id = modalWindowId - modalPergaminhoTeleporte + 2
			player:setStorageValue(Storage.pergaminhoTeleporte, os.time())
			player:teleportarJogador(destinosPergaminhoTeleporte[id]["destinos"][choiceId]["posicao"], true)
		elseif buttonId == 3 then
			player:abrirModalPergaminhoTeleporte(1)
		end
	elseif modalWindowId == modalPergaminhoTeleporte + 3 then
		if buttonId == 1 then
			player:abrirModalSaidaMaruimIsland(2)
		elseif buttonId == 3 then
			player:abrirModalPergaminhoTeleporte(1)
		end
	elseif modalWindowId == modalPergaminhoTeleporte + 4 then
		if buttonId == 1 then
			local pergaminhoId, pergaminhoAction = 1948, 3902
			local refilId, refilAction = 1949, 3903

			local pergaminho = player:getAllItemsByAction(pergaminhoId, pergaminhoAction)
			local refil = player:getAllItemsByAction(refilId, refilAction)

			if #pergaminho == 1 and #refil == 1 then
				pergaminho[1]:remove(1)
				refil[1]:remove(1)
				player:teleportarJogador(posicoesDepot[choiceId], false, true)
			else
				player:sendCancelMessage("Ocorreu um erro. Por favor, contate a equipe de suporte através do atalho 'Ctrl + Z'.")
			end
		elseif buttonId == 3 then
			player:abrirModalSaidaMaruimIsland(1)
		end
	end
end