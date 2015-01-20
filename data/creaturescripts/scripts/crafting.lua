function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if (not isInArray(listaProfissoes, modalWindowId) and
		not isInArray(listaProfissoesInfo, modalWindowId) and
		not isInArray(listaProfissoesLista1, modalWindowId) and
		not isInArray(listaProfissoesLista2, modalWindowId) and
		not isInArray(listaProfissoesLista3, modalWindowId)) or
		buttonId == 2 then
		return false
	elseif isInArray(listaProfissoes, modalWindowId) then
		local profissaoId = modalWindowId
		local profissao = profissoes[profissaoId]
		local profissaoNome = profissao.nome
		local profissaoNivel = player:getProfissaoSkill(profissaoId)
		local profissaoExpPorcentagem = player:getProfissaoSkillPorcentagem(profissaoId)
		local modal_titulo = profissaoNome.." - Nível: "..profissaoNivel.." ("..profissaoExpPorcentagem.."%)"
		local modal_titulo_lista_vazia = "Aviso"
		local modal_mensagem_lista = "Selecione um item na lista e realize uma das ações citadas abaixo:\n\nClique no botão 'Criar', tecle 'Enter' ou dê dois cliques para iniciar o processo de fabricação.\nClique no botão 'Materiais' para verificar os requisitos necessários para criação do item selecionado.\n"
		local modal_mensagem_lista_vazia = "Não há nenhuma receita disponível para ser exibida.\nClique no botão 'Voltar' e selecione outra opção."
		if choiceId == 1 then
			local profissaoExp = player:getProfissaoSkillExp(profissaoId)
			local profissaoExpProximoNivel = player:getProfissaoSkillExpProximoNivel(profissaoId)
			local profissaoPontos = player:getProfissaoPontos(profissaoId)
			local profissaoReceitasFabricadas = player:getProfissaoReceitasFabricadas(profissaoId)
			local profissaoReceitasFalhadas = player:getProfissaoReceitasFalhadas(profissaoId)
			local profissaoBonusAdicional = player:getProfissaoBonusAdicional(profissaoId)
			local profissaoChanceSucessoAdicional = formatarValor(player:getProfissaoChanceSucessoAdicional(profissaoId)).."%"
			local modal_id = profissaoId+configProfissoes.modalInfo
			local modal_titulo = modal_titulo.." - Informações"
			local modal_mensagem = "Nível: "..profissaoNivel.." ("..profissaoExpPorcentagem.."%)\nExperiência: "..profissaoExp.."\nExperiência para o próximo nível: "..profissaoExpProximoNivel.."\nPontos de Profissão: "..profissaoPontos.."\nReceitas fabricadas: "..profissaoReceitasFabricadas.."\nReceitas falhadas: "..profissaoReceitasFalhadas.."\nBônus adicional: +"..profissaoBonusAdicional.."\nChance de sucesso adicional: +"..profissaoChanceSucessoAdicional
			local modal = ModalWindow(modal_id, modal_titulo, modal_mensagem..string.rep(" ", 70))
			modal:addButton(3, "Voltar")
			modal:addButton(2, "Sair")
			modal:addButton(5, "Ok")
			modal:setDefaultEnterButton(5)
			modal:setDefaultEscapeButton(2)
			modal:sendToPlayer(player)
		elseif choiceId == 2 then
			local modal_id = profissaoId+configProfissoes.modalLista1
			local receitas = profissao.receitas
			local modal_titulo = modal_titulo.." - Lista de Receitas - Prontas para Fabricação"
			local modal = ModalWindow(modal_id, modal_titulo, modal_mensagem_lista)
			for receitaId,receita in pairs(receitas) do
				if profissaoNivel >= receita.nivel then
					if player:getLevel() >= receita.nivelJogador then
						if player:getItemCount(receita.ferramenta) > 0 then
							if(receita.aprender == 0) or (receita.aprender == 1 and player:getProfissaoReceitaAprendizado(profissaoId, receitaId) == 1) then
								local validar = 1
								for a,b in pairs(receita.materiais) do
									if b[3] ~= -1 then
										b[3] = -1
									end
									if player:getItemCount(b[1], b[3]) < b[2] then
										validar = 0
										break
									end
								end
								if validar == 1 then
									modal:addChoice(receitaId, capAll(getItemName(receita.item)))
								end
							end
						end
					end
				end
			end
			if modal:getChoiceCount() == 0 then
				local modal = ModalWindow(modal_id, modal_titulo_lista_vazia, modal_mensagem_lista_vazia)
				modal:addButton(3, "Voltar")
				modal:addButton(2, "Sair")
				modal:addButton(5, "Ok")
				modal:setDefaultEnterButton(5)
				modal:setDefaultEscapeButton(2)
				modal:sendToPlayer(player)
			else
				modal:addButton(4, "Materiais")
				modal:setDefaultEnterButton(1)
				modal:addButton(2, "Sair")
				modal:addButton(1, "Criar")
				modal:setDefaultEscapeButton(2)
				modal:addButton(3, "Voltar")
				modal:sendToPlayer(player)
			end
		elseif choiceId == 3 then
			local modal_id = profissaoId+configProfissoes.modalLista2
			local receitas = profissao.receitas
			local modal_titulo = modal_titulo.." - Lista de Receitas - Conhecidas"
			local modal = ModalWindow(modal_id, modal_titulo, modal_mensagem_lista)
			for receitaId,receita in pairs(receitas) do
				if(receita.aprender == 0) or (receita.aprender == 1 and player:getProfissaoReceitaAprendizado(profissaoId, receitaId) == 1) then
					modal:addChoice(receitaId, capAll(getItemName(receita.item)))
				end
			end
			if modal:getChoiceCount() == 0 then
				local modal = ModalWindow(modal_id, modal_titulo_lista_vazia, modal_mensagem_lista_vazia)
				modal:addButton(3, "Voltar")
				modal:addButton(2, "Sair")
				modal:addButton(5, "Ok")
				modal:setDefaultEnterButton(5)
				modal:setDefaultEscapeButton(2)
				modal:sendToPlayer(player)
			else
				modal:addButton(4, "Materiais")
				modal:setDefaultEnterButton(1)
				modal:addButton(2, "Sair")
				modal:addButton(1, "Criar")
				modal:setDefaultEscapeButton(2)
				modal:addButton(3, "Voltar")
				modal:sendToPlayer(player)
			end
		elseif choiceId == 4 then
			local modal_id = profissaoId+configProfissoes.modalLista3
			local receitas = profissao.receitas
			local modal_titulo = modal_titulo.." - Lista de Receitas - Geral"
			local modal = ModalWindow(modal_id, modal_titulo, modal_mensagem_lista)
			for i = 1, #receitas do
				modal:addChoice(i, capAll(getItemName(receitas[i].item)))
			end
			modal:addButton(4, "Materiais")
			modal:setDefaultEnterButton(1)
			modal:addButton(2, "Sair")
			modal:addButton(1, "Criar")
			modal:setDefaultEscapeButton(2)
			modal:addButton(3, "Voltar")
			modal:sendToPlayer(player)
		end
	elseif	isInArray(listaProfissoesInfo, modalWindowId) or
			isInArray(listaProfissoesLista1, modalWindowId) or
			isInArray(listaProfissoesLista2, modalWindowId) or
			isInArray(listaProfissoesLista3, modalWindowId) then
		local profissaoId = verificiarProfissao(modalWindowId)
		if buttonId == 3 then
			local modal = player:getProfissaoModalPrincipal(profissaoId)
			if modal then
				modal:sendToPlayer(player)
			end
		elseif	isInArray(listaProfissoesLista1, modalWindowId) or
				isInArray(listaProfissoesLista2, modalWindowId) or
				isInArray(listaProfissoesLista3, modalWindowId) then
			if choiceId > 0 and buttonId == 1 then
				local receitaId = choiceId
				local iniciarReceita = player:iniciarReceita(profissaoId, receitaId)
				if iniciarReceita == false then
					return false
				end
			elseif buttonId == 4 then
				local receitaId = choiceId
				local receita = profissao.receitas[receitaId]
				local nivel = receita.nivel
				local nivelJogador = receita.nivelJogador
				local item = receita.item
				local ferramenta = receita.ferramenta
				if(player:getItemCount(ferramenta) > 0) then
					ferramenta = capAll(getItemName(ferramenta)).." (ok)"
				else
					ferramenta = capAll(getItemName(ferramenta))
				end
				local tempo = receita.tempo
				if tempo == 0 then
					tempo = "Instantâneo"
				elseif tempo > 1 then
					tempo = tempo.." segundos"
				else
					tempo = tempo.." segundo"
				end
				local aprender = receita.aprender
				local necessarioAprender = "Não"
				if aprender == 1 then
					necessarioAprender = "Sim"
				end
				local experiencia = receita.experiencia
				local pontos = receita.pontos
				local chanceSucesso = formatarValor(receita.chanceSucesso).."%"
				local chanceSucessoAtual = formatarValor(player:getProfissaoChanceSucessoReceita(profissaoId, receitaId)).."%"
				local materiais = receita.materiais
				local mensagemMateriaisNecessarios = capAll(getItemName(item)).."\nNivel de Profissão Necessário: "..nivel.."\nNivel de Jogador Necessário: "..nivelJogador.."\nNecessário Aprender: "..necessarioAprender.."\n\nFerramenta Necessária:\n"..ferramenta.."\n\nTempo de Fabricação: "..tempo.."\nExperiência: "..experiencia.."\nPontos de Profissão: "..pontos.."\nChance de Sucesso Base: "..chanceSucesso.."\nChance de Sucesso Atual: "..chanceSucessoAtual.."\n\nMateriais:"
				for a,b in pairs(materiais) do
					local itemNome = capAll(getItemName(b[1]))
					if b[3] ~= nil and b[3] > 0 then
						itemNome = itemNome.." of "..capAll(getFluidNameByType(b[3]))
					end
					mensagemMateriaisNecessarios = mensagemMateriaisNecessarios.."\n- "..itemNome.." ("..player:getItemCount(b[1], b[3]).."/"..b[2]..")"
				end
				player:showTextDialog(item, mensagemMateriaisNecessarios)
			end
		end
	end
end