local firstItems = {2461, 2467, 2649}

function onLogin(player)
	if player:getLastLoginSaved() == 0 then
		for i = 1, 80 do
			player:addMount(i)
		end
		for i = 1, #firstItems do
			player:addItem(firstItems[i], 1)
		end
		player:addItem(1988, 1):addItem(2789, 5)
		local vocationId = player:getVocation():getId()
		if vocationId == 1 then
			player:addItem(23719, 1)
		elseif vocationId == 2 then
			player:addItem(23721, 1)
		elseif vocationId == 3 then
			player:addItem(19390, 10)
		elseif vocationId == 4 then
			local modalTitulo = "Escolha uma Arma"
			local modalMensagem = "Escolha uma das armas abaixo e clique em 'Escolher', tecle entre ou dê um clique duplo na opção desejada para recebê-la.\n\n"
			local modal = ModalWindow(modalItensKnight, modalTitulo, modalMensagem)
			modal:addChoice(1, "Arma Aleatória")
			modal:addChoice(2, capAll(ItemType(itensKnight[1]):getName()))
			modal:addChoice(3, capAll(ItemType(itensKnight[2]):getName()))
			modal:addChoice(4, capAll(ItemType(itensKnight[3]):getName()))
			modal:addButton(1, "Escolher")
			modal:setDefaultEnterButton(1)
			modal:addButton(2, "Sair")
			modal:setDefaultEscapeButton(2)
			modal:sendToPlayer(player)
			player:registerEvent("ItensKnight")
		end
	end
	return true
end
