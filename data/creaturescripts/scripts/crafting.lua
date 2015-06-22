function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if (not isInArray(listaProfissoes, modalWindowId) and
		not isInArray(listaProfissoesInfo, modalWindowId) and
		not isInArray(listaProfissoesLista1, modalWindowId) and
		not isInArray(listaProfissoesLista2, modalWindowId) and
		not isInArray(listaProfissoesLista3, modalWindowId) and
		not isInArray(listaProfissoesReceitas, modalWindowId)) or
		buttonId == 2 then
		return false
	elseif isInArray(listaProfissoes, modalWindowId) then
		local profissaoId = modalWindowId
		local profissao = profissoes[profissaoId]
		local modalTitulo = player:getProfissaoModalTitulo(profissaoId)
		local modalTituloListaVazia = "Aviso"
		local modalMensagemLista = "Selecione um item na lista e realize uma das ações citadas abaixo:\n\nClique no botão 'Criar', tecle 'Enter' ou dê dois cliques para iniciar o processo de fabricação.\nClique no botão 'Info' para verificar os requisitos necessários para criação do item selecionado.\n"
		local modalMensagemListaVazia = "Não há nenhuma receita disponível para ser exibida.\nClique no botão 'Voltar' e selecione outra opção."
		local profissaoNivel = player:getProfissaoSkill(profissaoId)
		local profissaoExpPorcentagem = player:getProfissaoSkillPorcentagem(profissaoId)
		if choiceId == 1 then
			local profissaoExp = player:getProfissaoSkillExp(profissaoId)
			local profissaoExpProximoNivel = player:getProfissaoSkillExpProximoNivel(profissaoId)
			local profissaoPontos = player:getProfissaoPontos(profissaoId)
			local profissaoReceitasFabricadas = player:getProfissaoReceitasFabricadas(profissaoId)
			local profissaoReceitasFalhadas = player:getProfissaoReceitasFalhadas(profissaoId)
			local profissaoBonusAdicional = player:getProfissaoBonusAdicional(profissaoId)
			local profissaoChanceSucessoAdicional = formatarValor(player:getProfissaoChanceSucessoAdicional(profissaoId)).."%"
			local modalId = profissaoId+configProfissoes.modalInfo
			local modalTitulo = modalTitulo.." - Informações"
			local modalMensagem = "Nível: "..profissaoNivel.." ("..profissaoExpPorcentagem.."%)\nExperiência: "..profissaoExp.."\nExperiência para o próximo nível: "..profissaoExpProximoNivel.."\nPontos de Profissão: "..profissaoPontos.."\nReceitas fabricadas: "..profissaoReceitasFabricadas.."\nReceitas falhadas: "..profissaoReceitasFalhadas.."\nBônus adicional: +"..profissaoBonusAdicional.."\nChance de sucesso adicional: +"..profissaoChanceSucessoAdicional
			local modal = ModalWindow(modalId, modalTitulo, modalMensagem..string.rep(" ", 70))
			modal:addButton(3, "Voltar")
			modal:addButton(2, "Sair")
			modal:addButton(5, "Ok")
			modal:setDefaultEnterButton(5)
			modal:setDefaultEscapeButton(2)
			modal:sendToPlayer(player)
		elseif choiceId == 2 then
			local modalId = profissaoId+configProfissoes.modalLista1
			local receitas = profissao.receitas
			local modalTitulo = modalTitulo.." - Lista de Receitas - Prontas para Fabricação"
			local modal = ModalWindow(modalId, modalTitulo, modalMensagemLista)
			local exibirReceitas = ordenarReceitasPorNome(receitas)
			for a, b in pairs(exibirReceitas) do
				receitaId = b[1]
				receita = receitas[receitaId]
				if profissaoNivel >= receita.nivel then
					if player:getLevel() >= receita.nivelJogador then
						if player:getItemCount(receita.ferramenta) > 0 then
							if(receita.aprender == 0) or (receita.aprender == 1 and player:getProfissaoReceitaAprendizado(profissaoId, receitaId) == 1) then
								local validar = 1
								for c, d in pairs(receita.materiais) do
									if d[3] ~= -1 then
										d[3] = -1
									end
									if player:getItemCount(d[1], d[3]) < d[2] then
										validar = 0
										break
									end
								end
								if validar == 1 then
									if modal:getChoiceCount() < 255 then
										modal:addChoice(receitaId, b[2])
									end
								end
							end
						end
					end
				end
			end
			if modal:getChoiceCount() == 0 then
				local modal = ModalWindow(modalId, modalTituloListaVazia, modalMensagemListaVazia)
				modal:addButton(3, "Voltar")
				modal:addButton(2, "Sair")
				modal:addButton(5, "Ok")
				modal:setDefaultEnterButton(5)
				modal:setDefaultEscapeButton(2)
				modal:sendToPlayer(player)
			else
				modal:addButton(4, "Info")
				modal:setDefaultEnterButton(1)
				modal:addButton(2, "Sair")
				modal:addButton(1, "Criar")
				modal:setDefaultEscapeButton(2)
				modal:addButton(3, "Voltar")
				modal:sendToPlayer(player)
			end
		elseif choiceId == 3 then
			local modalId = profissaoId+configProfissoes.modalLista2
			local receitas = profissao.receitas
			local modalTitulo = modalTitulo.." - Lista de Receitas - Conhecidas"
			local modal = ModalWindow(modalId, modalTitulo, modalMensagemLista)
			local exibirReceitas = ordenarReceitasPorNome(receitas)
			for a, b in pairs(exibirReceitas) do
				receitaId = b[1]
				receita = receitas[receitaId]
				if(receita.aprender == 0) or (receita.aprender == 1 and player:getProfissaoReceitaAprendizado(profissaoId, receitaId) == 1) then
					if modal:getChoiceCount() < 255 then
						modal:addChoice(receitaId, b[2])
					end
				end
			end
			if modal:getChoiceCount() == 0 then
				local modal = ModalWindow(modalId, modalTituloListaVazia, modalMensagemListaVazia)
				modal:addButton(3, "Voltar")
				modal:addButton(2, "Sair")
				modal:addButton(5, "Ok")
				modal:setDefaultEnterButton(5)
				modal:setDefaultEscapeButton(2)
				modal:sendToPlayer(player)
			else
				modal:addButton(4, "Info")
				modal:setDefaultEnterButton(1)
				modal:addButton(2, "Sair")
				modal:addButton(1, "Criar")
				modal:setDefaultEscapeButton(2)
				modal:addButton(3, "Voltar")
				modal:sendToPlayer(player)
			end
		elseif choiceId == 4 then
			local modalId = profissaoId+configProfissoes.modalLista3
			local receitas = profissao.receitas
			local modalTitulo = modalTitulo.." - Lista de Receitas - Geral"
			local modal = ModalWindow(modalId, modalTitulo, modalMensagemLista)
			local exibirReceitas = ordenarReceitasPorNome(receitas)
			for a, b in pairs(exibirReceitas) do
				local receita = receitas[b[1]]
				if receita.ocultar == nil or (receita.ocultar ~= nil and receita.ocultar == 0) or (receita.ocultar ~= nil and receita.ocultar == 1 and player:getProfissaoReceitaAprendizado(profissaoId, receitaId) == 1) then
					if modal:getChoiceCount() < 255 then
						modal:addChoice(b[1], b[2])
					end
				end
			end
			if modal:getChoiceCount() == 0 then
				local modal = ModalWindow(modalId, modalTituloListaVazia, modalMensagemListaVazia)
				modal:addButton(3, "Voltar")
				modal:addButton(2, "Sair")
				modal:addButton(5, "Ok")
				modal:setDefaultEnterButton(5)
				modal:setDefaultEscapeButton(2)
				modal:sendToPlayer(player)
			else
				modal:addButton(4, "Info")
				modal:setDefaultEnterButton(1)
				modal:addButton(2, "Sair")
				modal:addButton(1, "Criar")
				modal:setDefaultEscapeButton(2)
				modal:addButton(3, "Voltar")
				modal:sendToPlayer(player)
			end
		elseif choiceId == 5 then
			local receitaId = player:getProfissaoUltimaReceita(profissaoId)
			if receitaId > 0 then
				local iniciarReceita = player:iniciarReceita(profissaoId, receitaId)
				if not iniciarReceita then
					return false
				end
			end
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
			local profissao = profissoes[profissaoId]
			local receitaId = choiceId
			local receita = profissao.receitas[receitaId]
			if choiceId > 0 and buttonId == 1 then
				local ingredientesMelhoria = profissao.ingredientesMelhoria
				local ingredientesMelhoriaDisponiveis = player:getIngredientesMelhoria(profissaoId)
				if ingredientesMelhoria ~= nil and table.getn(ingredientesMelhoriaDisponiveis) > 0 then
					local modalId = profissaoId+configProfissoes.receitasInicio+receitaId
					local modalTitulo = player:getProfissaoModalTitulo(profissaoId).." - Selecione o Ingrediente de Melhoria"
					local modalMensagem = "Selecione o ingrediente de melhoria para aumentar a sua chance de sucesso na produção dessa receita.\n\nClique no botão 'Criar', tecle 'Enter' ou dê dois cliques para iniciar o processo de fabricação.\n\n"
					local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
					for i = 1, #ingredientesMelhoriaDisponiveis do
						local ingredienteMelhoria = profissao.ingredientesMelhoria[ingredientesMelhoriaDisponiveis[i]-configProfissoes.receitasInicio]
						local ingredienteMelhoriaNome = capAll(getItemName(ingredienteMelhoria.item)).." ("..formatarValor(ingredienteMelhoria.chance).."%)"
						modal:addChoice(ingredientesMelhoriaDisponiveis[i], ingredienteMelhoriaNome)
					end
					modal:setDefaultEnterButton(1)
					modal:addButton(1, "Criar")
					modal:addButton(2, "Sair")
					modal:setDefaultEscapeButton(2)
					modal:sendToPlayer(player)
				else
					player:resetProfissaoIngredienteMelhoria(profissaoId)
					if receita.fabricarQuantidade == nil or receita.fabricarQuantidade == 0 then
						local iniciarReceita = player:iniciarReceita(profissaoId, receitaId)
						if not iniciarReceita then
							return false
						end
					else
						local quantidadePossivel = player:verificarJogadorItensReceita(profissaoId, receitaId, configProfissoes.maxQuantidadeFabricacao)
						if quantidadePossivel == 1 then
							local iniciarReceita = player:iniciarReceita(profissaoId, receitaId)
							if not iniciarReceita then
								return false
							end
						elseif quantidadePossivel > 1 then
							local modalQuantidade = player:getProfissaoModalQuantidade(profissaoId, receitaId)
							modalQuantidade:sendToPlayer(player)
						end
					end
				end
			elseif buttonId == 4 then
				local profissao = profissoes[profissaoId]
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
				local maxChanceSucesso = receita.maxChanceSucesso
				if maxChanceSucesso == nil then
					maxChanceSucesso = 10000
				end
				maxChanceSucesso = formatarValor(maxChanceSucesso).."%"
				local chanceSucessoAtual = formatarValor(player:getProfissaoChanceSucessoReceita(profissaoId, receitaId)).."%"
				local materiais = receita.materiais
				local mensagemMateriaisNecessarios = capAll(getItemName(item)).."\nNivel de Profissão Necessário: "..nivel.."\nNivel de Jogador Necessário: "..nivelJogador.."\nNecessário Aprender: "..necessarioAprender.."\n\nFerramenta Necessária:\n"..ferramenta.."\n\nTempo de Fabricação: "..tempo.."\nExperiência: "..experiencia.."\nPontos de Profissão: "..pontos.."\n\nChance de Sucesso Base: "..chanceSucesso.."\nChance de Sucesso Atual: "..chanceSucessoAtual.."\nChance de Sucesso Máxima: "..maxChanceSucesso.."\n\nMateriais:"
				for a,b in pairs(materiais) do
					local itemNome = capAll(getItemName(b[1]))
					if b[3] ~= nil and b[3] > 0 then
						itemNome = itemNome.." of "..capAll(getFluidNameByType(b[3]))
					end
					mensagemMateriaisNecessarios = mensagemMateriaisNecessarios.."\n- "..itemNome.." ("..player:getItemCount(b[1], b[3]).."/"..b[2]..")"
				end
				local ingredienteSecreto = receita.ingredienteSecreto
				if ingredienteSecreto ~= nil then
					local ingredienteSecretoNome = capAll(getItemName(ingredienteSecreto[1]))
					mensagemMateriaisNecessarios = mensagemMateriaisNecessarios.."\n\n- Ingrediente Secreto:\n"..ingredienteSecretoNome.." ("..player:getItemCount(ingredienteSecreto[1]).."/"..ingredienteSecreto[2]..")\nChance de Sucesso Adicional: +"..formatarValor(ingredienteSecreto[3]).."%"
				end
				player:showTextDialog(item, mensagemMateriaisNecessarios)
			end
		end
	elseif isInArray(listaProfissoesReceitas, modalWindowId) then
		local verificiarProfissao = verificiarProfissao(modalWindowId, 1)
		local profissaoId = verificiarProfissao[1]
		local receitaId = verificiarProfissao[2]
		local profissao = profissoes[profissaoId]
		local receita = profissao.receitas[receitaId]
		if choiceId > 0 and choiceId <= configProfissoes.maxQuantidadeFabricacao then
			local quantidade = choiceId
			local tempo = receita.tempo
			player:iniciarReceitaQuantidade(profissaoId, receitaId, quantidade, 0, tempo)
		elseif choiceId >= configProfissoes.maxQuantidadeFabricacao then
			local ingredienteMelhoria = choiceId
			player:addProfissaoIngredienteMelhoria(profissaoId, ingredienteMelhoria-configProfissoes.receitasInicio)
			if receita.fabricarQuantidade == nil or receita.fabricarQuantidade == 0 then
				local iniciarReceita = player:iniciarReceita(profissaoId, receitaId, 0)
				if not iniciarReceita then
					return false
				end
			else
				local quantidadePossivel = player:verificarJogadorItensReceita(profissaoId, receitaId, configProfissoes.maxQuantidadeFabricacao)
				if quantidadePossivel == 1 then
					local iniciarReceita = player:iniciarReceita(profissaoId, receitaId)
					if not iniciarReceita then
						return false
					end
				elseif quantidadePossivel > 1 then
					local modalQuantidade = player:getProfissaoModalQuantidade(profissaoId, receitaId, 1)
					modalQuantidade:sendToPlayer(player)
				end
			end
		end
	end
end