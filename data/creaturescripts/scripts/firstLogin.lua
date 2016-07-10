function onLogin(player)
	if player:getLastLoginSaved() == 0 then
		-- for i = 1, 733 do
			-- if player:hasOutfit(i) then
				-- player:addOutfitAddon(i, 1)
				-- player:addOutfitAddon(i, 2)
			-- end
		-- end

		-- for i = 1, 80 do
			-- player:addMount(i)
		-- end

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

		local mochila = player:addItem(1988, 1)
		mochila:addItem(2789, 10)
		mochila:addItem(8704, 5)

		local kit = player:addItem(3901, 1)
		kit:setAttribute(ITEM_ATTRIBUTE_NAME, "rope and shovel kit")
		kit:setAttribute(ITEM_ATTRIBUTE_WEIGHT, 100)
		kit:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Use it only when you need a rope or a shovel.")
		kit:setActionId(3901)

		local pergaminhoTeleporte = player:addItem(1948, 1)
		pergaminhoTeleporte:setAttribute(ITEM_ATTRIBUTE_NAME, "pergaminho de teleporte")
		pergaminhoTeleporte:setAttribute(ITEM_ATTRIBUTE_WEIGHT, 100)
		pergaminhoTeleporte:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Um pergaminho de uso exclusivo na Maruim Island. Ao sair da ilha ou atingir o nível 30 esse item será removido.")
		pergaminhoTeleporte:setActionId(3902)

		local refil = player:addItem(1949, 1)
		refil:setAttribute(ITEM_ATTRIBUTE_NAME, "refil de poções")
		refil:setAttribute(ITEM_ATTRIBUTE_WEIGHT, 100)
		refil:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Mostre para a 'Flora' para receber novas cargas de poções.")
		refil:setActionId(3903)

		player:adicionarMarcasMapa(1)

		player:sendOutfitWindow()
	end

	if player:getVocation():getId() == 4 and player:getStorageValue(Storage.itensKnight) ~= 1 then
		player:enviarModalItensKnight()
	end

	return true
end
