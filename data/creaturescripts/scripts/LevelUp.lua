function onAdvance(player, skill, oldlevel, newlevel)
	if skill == 8 then
		if newlevel == 10 then
			local modalId = 5201
			local modalTitulo = "Parabéns pelo nível 10!"
			local modalMensagem = "Você atingiu o nível mínimo recomendado para sair da ilha!\n\n"
			modalMensagem = modalMensagem .. "Caso você ainda não tenha feito, sugerimos que vá até "
			modalMensagem = modalMensagem .. "o mestre de sua guilda, '" .. pegarNpcReputacao(player:getVocation():getId()) .. "', "
			modalMensagem = modalMensagem .. "e pergunte a ele sobre 'tarefas' para que você possa "
			modalMensagem = modalMensagem .. "juntar " .. Reputacao.promocao .. " pontos de reputação "
			modalMensagem = modalMensagem .. "necessários para a sua promoção no nível 20.\n\nAlgumas "
			modalMensagem = modalMensagem .. "tarefas são bem fáceis de fazer e dão exatamente a "
			modalMensagem = modalMensagem .. "quantidade de pontos que você precisa.\n\nSe quiser "
			modalMensagem = modalMensagem .. "treinar mais aqui, você podecontinuar nessa ilha por "
			modalMensagem = modalMensagem .. "quanto tempo quiser e semprepoderá viajar de volta.\n\n"
			modalMensagem = modalMensagem .. "Fique à vontade para explorar, existem diversas áreas de "
			modalMensagem = modalMensagem .. "caça espalhadas pela ilha. Se quiser sair e viajar para o "
			modalMensagem = modalMensagem .. "continente principal dirija-se ao Navio localizadono leste "
			modalMensagem = modalMensagem .. "da ilha."
			local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
			modal:addButton(1, "Ok")
			modal:setDefaultEnterButton(1)
			modal:addButton(2, "Sair")
			modal:setDefaultEscapeButton(2)
			modal:sendToPlayer(player)
			modalRecompensaAberto[player:getId()] = 0
			player:registerEvent("ModalInformativo")
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
			modalRecompensaAberto[player:getId()] = 0
			player:registerEvent("ModalInformativo")
		end

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
	end
	return true
end
