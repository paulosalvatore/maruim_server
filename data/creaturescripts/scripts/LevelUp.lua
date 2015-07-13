function onAdvance(player, skill, oldlevel, newlevel)
	if skill == 8 then
		eventoAdicionado = false
		for a, b in pairs(RecompensasNivel) do
			if b.nivel == newlevel then
				if b.vocacao == nil or (b.vocacao ~= nil and isInArray(b.vocacao, string.lower(player:getVocation():getName()))) then
					player:adicionarRecompensaPendente(a)
					if not eventoAdicionado then
						player:registerEvent("RecompensaNivel")
						eventoAdicionado = true
					end
				end
			end
		end

		if newlevel == 20 then
			local modalPromotion = 5200
			local modalTitulo = "Promova a sua Vocação!"
			local modalMensagem = "Você já possui level para receber uma promoção!\n\nAssim que conseguir " .. Reputacao.promocao .. " pontos de reputação fale com o mestre da sua guilda, '" .. pegarNpcReputacao(player:getVocation():getId()) .. "', e pergunte a ele sobre promoção.\n\nVocê pode conseguir pontos de reputação após concluir algumas tarefas."
			local modal = ModalWindow(modalPromotion, modalTitulo, modalMensagem)
			modal:addButton(1, "Ok")
			modal:setDefaultEnterButton(1)
			modal:addButton(2, "Sair")
			modal:setDefaultEscapeButton(2)
			modal:sendToPlayer(player)
		end
	end
	return true
end
