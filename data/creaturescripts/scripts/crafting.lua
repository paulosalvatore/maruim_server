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
			local profissao = profissoes[profissaoId]
			if choiceId > 0 and buttonId == 1 then
				local mesaTrabalho = profissoes[profissaoId].extraData[player:getId()].mesaTrabalho
				local actionItemDesativado = configProfissoes.actionItemDesativado
				if mesaTrabalho:getActionId() == actionItemDesativado then
					return false
				end
				local profissaoNivel = player:getProfissaoSkill(profissaoId)
				local efeitoTrabalhando = profissao.efeitoTrabalhando
				local efeitoSucesso = profissao.efeitoSucesso
				local efeitoFalha = profissao.efeitoFalha
				local mesaTrabalhoKey = searchArrayKey(profissao.mesaTrabalho, mesaTrabalho:getType():getId())
				local mesaTrabalhando = profissao.mesaTrabalhando[mesaTrabalhoKey]
				local receitaId = choiceId
				local receita = profissao.receitas[receitaId]
				local ferramenta = receita.ferramenta
				local materiais = receita.materiais
				if	player:getItemCount(ferramenta) == 0 or
					profissaoNivel < receita.nivel or
					player:getLevel() < receita.nivelJogador or
					(receita.aprender == 1 and player:getProfissaoReceitaAprendizado(profissaoId, receitaId) == 1) then
					return false
				end
				for a,b in pairs(materiais) do
					print(b[3])
					if b[3] ~= -1 then
						b[3] = -1
					end
					if player:getItemCount(b[1], b[3]) < b[2] then
						return false
					end
				end
				mesaTrabalho:setActionId(actionItemDesativado)
				if mesaTrabalhando ~= nil then
					mesaTrabalho:transform(mesaTrabalhando)
					mesaTrabalhando = profissao.mesaTrabalho[mesaTrabalhoKey]
				end
				local tempo = receita.tempo
				local craftCD = Condition(CONDITION_SPELLCOOLDOWN)
				craftCD:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
				craftCD:setParameter(CONDITION_PARAM_SUBID, 160)
				craftCD:setParameter(CONDITION_PARAM_TICKS, tempo*1000)
				player:addCondition(craftCD)
				player:allowMovement(false)
				player:say("Trabalhando...", TALKTYPE_MONSTER_SAY)
				local posicaoMesaTrabalho = player:getPosicaoMesaTrabalho(profissaoId)
				function enviarAnimacao(tempo, posicao, efeito)
					if tempo > 0 then
						posicao:sendMagicEffect(efeito)
						addEvent(enviarAnimacao, 1000, tempo-1, posicao, efeito)
					end
				end
				enviarAnimacao(tempo, posicaoMesaTrabalho.efeito, efeitoTrabalhando)
				for i = 1, #materiais do
					if materiais[i][3] == nil then
						materiais[i][3] = -1
					end
					player:removeItem(materiais[i][1], materiais[i][2], materiais[i][3])
				end
				addEvent(function(player, receitaId, receita, efeitoSucesso, efeitoFalha, posicaoMesaTrabalho, mesaTrabalho, mesaTrabalhando)
					local nivel = receita.nivel
					local chanceSucesso = player:getProfissaoChanceSucessoReceita(profissaoId, receitaId)
					local experiencia = receita.experiencia
					local pontos = receita.pontos
					local chance = math.random(1, 10000)
					if chance <= chanceSucesso then
						local itemCriado = receita.item
						local atributos = receita.atributos
						local itemCriado = player:addItem(itemCriado, 1)
						if itemCriado:getType():getDescription() ~= "" then
							itemCriado:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, itemCriado:getType():getDescription().."\nCriado por "..player:getName()..".")
						else
							itemCriado:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Criado por "..player:getName()..".")
						end
						if receita.atributos ~= nil then
							local bonusAdicional = player:getProfissaoBonusAdicional(profissaoId)
							if itemCriado:getType():getAttack() > 0 and receita.atributos.ataque ~= nil then
								if type(receita.atributos.ataque) == "table" then
									ataqueAdicional = math.random(receita.atributos.ataque[1], receita.atributos.ataque[2])
								else
									ataqueAdicional = receita.atributos.ataque
								end
								itemCriado:setAttribute(ITEM_ATTRIBUTE_ATTACK, itemCriado:getType():getAttack()+ataqueAdicional+bonusAdicional)
							end
							if itemCriado:getType():getDefense() > 0 and receita.atributos.defesa ~= nil then
								if type(receita.atributos.defesa) == "table" then
									defesaAdicional = math.random(receita.atributos.defesa[1], receita.atributos.defesa[2])
								else
									defesaAdicional = receita.atributos.defesa
								end
								itemCriado:setAttribute(ITEM_ATTRIBUTE_DEFENSE, itemCriado:getType():getDefense()+defesaAdicional+bonusAdicional)
							end
							if itemCriado:getType():getExtraDefense() > 0 and receita.atributos.defesaExtra ~= nil then
								itemCriado:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, itemCriado:getType():getExtraDefense()+receita.atributos.defesaExtra)
							end
							if itemCriado:getType():getArmor() > 0 and receita.atributos.armadura ~= nil then
								if type(receita.atributos.armadura) == "table" then
									armaduraAdicional = math.random(receita.atributos.armadura[1], receita.atributos.armadura[2])
								else
									armaduraAdicional = receita.atributos.armadura
								end
								itemCriado:setAttribute(ITEM_ATTRIBUTE_ARMOR, itemCriado:getType():getArmor()+armaduraAdicional+bonusAdicional)
							end
							if itemCriado:getType():getShootRange() > 0 then
								itemCriado:setAttribute(ITEM_ATTRIBUTE_SHOOTRANGE, itemCriado:getType():getShootRange()+math.random(0, 1))
							end
							if receita.atributos.health ~= nil then
								if type(receita.atributos.health) == "table" then
									healthAdicional = math.random(receita.atributos.health[1], receita.atributos.health[2])
								else
									healthAdicional = receita.atributos.health
								end
								itemCriado:setAttribute(ITEM_ATTRIBUTE_NAME, itemCriado:getType():getName().." [health: "..healthAdicional.."]")
							end
							if receita.atributos.mana ~= nil then
								if type(receita.atributos.mana) == "table" then
									manaAdicional = math.random(receita.atributos.mana[1], receita.atributos.mana[2])
								else
									manaAdicional = receita.atributos.mana
								end
								itemCriado:setAttribute(ITEM_ATTRIBUTE_NAME, itemCriado:getType():getName().." [mana: "..manaAdicional.."]")
							end
						end
						player:addProfissaoReceitasFabricadas(profissaoId)
						player:resetProfissaoUltimasReceitasFalhadas(profissaoId, receitaId)
						player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Você fabricou com sucesso o item '"..capAll(itemCriado:getName()).."'.")
						player:addProfissaoPontos(profissaoId, pontos)
						posicaoMesaTrabalho:sendMagicEffect(efeitoSucesso)
					else
						player:addProfissaoReceitasFalhadas(profissaoId)
						player:addProfissaoUltimasReceitasFalhadas(profissaoId, receitaId)
						posicaoMesaTrabalho:sendMagicEffect(efeitoFalha)
						player:sendCancelMessage("O processo de criação falhou.")
					end
					player:addProfissaoSkillExp(profissaoId, experiencia)
					if mesaTrabalhando ~= nil then
						mesaTrabalho:transform(mesaTrabalhando)
					end
					mesaTrabalho:removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
					player:allowMovement(true)
				end,
				tempo*1000, player, receitaId, receita, efeitoSucesso, efeitoFalha, posicaoMesaTrabalho.mesaTrabalho, mesaTrabalho, mesaTrabalhando)
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