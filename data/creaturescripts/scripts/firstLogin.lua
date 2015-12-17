function onLogin(player)
	if player:getLastLoginSaved() == 0 then
		for i = 1, 733 do
			if player:hasOutfit(i) then
				player:addOutfitAddon(i, 1)
				player:addOutfitAddon(i, 2)
			end
		end

		for i = 1, 80 do
			player:addMount(i)
		end

		player:addItem(2461)
		player:addItem(2467)
		player:addItem(2649)

		local vocacaoJogador = player:getVocation():getId()
		if vocacaoJogador == 1 then
			player:addItem(23719, 1)
		elseif vocacaoJogador == 2 then
			player:addItem(23721, 1)
		elseif vocacaoJogador == 3 then
			player:addItem(19390, 10)
		end

		player:addItem(2050, 1)
		player:addItem(1988, 1):addItem(2789, 10)

		local item = player:addItem(3901, 1)
		item:setAttribute(ITEM_ATTRIBUTE_NAME, "rope and shovel kit")
		item:setAttribute(ITEM_ATTRIBUTE_WEIGHT, 100)
		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Use it only when you need a rope or a shovel.")
		item:setActionId(3901)

		player:sendOutfitWindow()
	end

	if player:getVocation():getId() == 4 and player:getStorageValue(Storage.itensKnight) ~= 1 then
		local modalTitulo = "Escolha uma Arma"
		local modalMensagem = "Escolha uma das armas abaixo e clique em 'Escolher', tecle entre ou dê um clique duplo na opção desejada para recebê-la.\n\n"
		local modal = ModalWindow(modalItensKnight, modalTitulo, modalMensagem)
		modal:addChoice(1, "Arma Aleatória")
		modal:addChoice(2, capAll(ItemType(itensKnight[1]):getName()) .. " (Espada)")
		modal:addChoice(3, capAll(ItemType(itensKnight[2]):getName()) .. " (Clava)")
		modal:addChoice(4, capAll(ItemType(itensKnight[3]):getName()) .. " (Machado)")
		modal:addButton(1, "Escolher")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(player)
		player:registerEvent("ItensKnight")
	end

	return true
end
