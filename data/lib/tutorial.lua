tutorialId = 4500
tutorialFinalizado = 50
tutorialIntervaloMaximo = 100
enviosLinksAcessoRapido = {}
posicoesEfeitos = {
	{x = 301, y = 2421, z = 7},
	{x = 300, y = 2423, z = 7}
}
dataTutorial = {
	linkJanela = {},
	mesa = {}
}

function Player.iniciarTutorial(self)
	self:allowMovement(false)
	self:enviarModalTutorial(2)
end

function Player.sairTutorial(self)
	self:allowMovement(true)
	local posicaoJogador = self:getPosition()
	local posicaoTemplo = Town(1):getTemplePosition()
	if	not (posicaoJogador.x == posicaoTemplo.x and
		posicaoJogador.y == posicaoTemplo.y and
		posicaoJogador.z == posicaoTemplo.z) then
		self:teleportarJogador(posicaoTemplo, true)
	end
	local passoTutorial = self:pegarPassoTutorial()
	local vocacaoJogador = self:getVocation():getId()
	if passoTutorial < 7 then
		self:addItem(2461)
		self:addItem(2467)
		self:addItem(2649)
		if vocacaoJogador == 1 then
			self:addItem(23719, 1)
		elseif vocacaoJogador == 2 then
			self:addItem(23721, 1)
		elseif vocacaoJogador == 3 then
			self:addItem(19390, 10)
		end
		if vocacaoJogador == 4 then
			self:enviarModalItensKnight()
		end
	end
	if passoTutorial < 11 then
		self:addItem(11421, 1)
		self:addItem(2559, 1)
	else
		self:getItemById(11421, -1):removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
		self:getItemById(2559, -1):removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
	end
	if passoTutorial < 16 then
		self:adicionarMarcasMapa(1)
	end
	self:atualizarPassoTutorial(tutorialFinalizado)
end

function Player.confirmarSairTutorial(self)
	local modalTitulo = "Sair do Tutorial"
	local modalMensagem = "Você tem certeza que deseja sair do tutorial?\n"
	local modal = ModalWindow(tutorialId, modalTitulo, modalMensagem)
	modal:addButton(1, "Sim")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Não")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player.enviarModalTutorial(self, id, atualizarPasso)
	if atualizarPasso == nil or atualizarPasso then
		self:atualizarPassoTutorial(id)
	end
	local modalTitulo = "Tutorial"
	local passo
	local modalMensagem = ""
	local opcoes = {}
	if id == 1 then
		modalMensagem = modalMensagem .. "Seja bem-vindo ao MaruimOT, " .. self:getName() .. "!\n\n"
		modalMensagem = modalMensagem .. "Se você é um iniciante por aqui e deseja receber algumas dicas para começar, selecione a opção 'Iniciar Tutorial'.\n\n"
		modalMensagem = modalMensagem .. "Caso você seja experiente e já conheça tudo o que pode fazer, selecione a opção 'Pular Tutorial'.\n\n"
		opcoes = {
			"Iniciar Tutorial",
			"Pular Tutorial"
		}
	elseif id == 2 then
		modalMensagem = modalMensagem .. "Vamos começar!\n\n"
		modalMensagem = modalMensagem .. "Para melhor compreensão, o tutorial está dividido nas seguintes partes:\n\n"
		modalMensagem = modalMensagem .. "-> Introdução\n"
		modalMensagem = modalMensagem .. "-> Explicando o Sistema de Crafting (Fabricação de Itens)\n"
		modalMensagem = modalMensagem .. "       - Profissões\n"
		modalMensagem = modalMensagem .. "       - Fabricação de Receitas\n"
		modalMensagem = modalMensagem .. "       - Obtendo Materiais\n"
		modalMensagem = modalMensagem .. "       - Coleta de Materiais\n"
		modalMensagem = modalMensagem .. "-> Vocação\n"
		modalMensagem = modalMensagem .. "       - Guilda\n"
		modalMensagem = modalMensagem .. "       - Promoção\n"
		modalMensagem = modalMensagem .. "-> Conhecendo a 'Maruim Island'\n"
		modalMensagem = modalMensagem .. "-> Primeiros Passos\n"
		modalMensagem = modalMensagem .. "-> Informações Adicionais\n"
	elseif id == 3 then
		passo = "Introdução"
		modalMensagem = modalMensagem .. "Durante o tutorial, você receberá 'links de acesso rápido' que poderão ser usados no site "
		modalMensagem = modalMensagem .. "para ir diretamente a uma página contendo mais informações sobre o assunto que está sendo "
		modalMensagem = modalMensagem .. "lhe apresentado no momento.\n\n"
		modalMensagem = modalMensagem .. "Fique tranquilo! Caso você desconecte durante o tutorial, quando voltar você "
		modalMensagem = modalMensagem .. "estará exatamente onde parou, para que possa prosseguir com o mesmo.\n\n"
		modalMensagem = modalMensagem .. "Você pode sair do tutorial a qualquer momento, basta esperar o início de qualquer passo, "
		modalMensagem = modalMensagem .. "escolher a opção 'Sair', ou pressionar a tecla 'Esc', e confirmar a saída.\n"
	elseif id == 4 then
		passo = "Sistema de Crafting"
		modalMensagem = modalMensagem .. "O crafting é um sistema que permite ao jogador fabricar diversos itens e equipamentos através de receitas específicas que serão produzidas em uma mesa de trabalho.\n\n"
		modalMensagem = modalMensagem .. "Você pode evoluir dentro de cada profissão, basta produzir receitas e receberá pontos de experiência que aumentarão seu nível.\n\n"
		modalMensagem = modalMensagem .. "Conforme sua evolução, isso habilitará uma quantidade maior de receitas e fará com que a produção delas se torne cada vez mais fácil.\n\n"
		modalMensagem = modalMensagem .. "Link de Acesso Rápido: crafting\n"
	elseif id == 5 then
		passo = "Profissão"
		modalMensagem = modalMensagem .. "Atualmente o sistema está divido entre quatro profissões, são elas:\n"
		modalMensagem = modalMensagem .. "Ferreiro, Alfaiate, Alquimista e Cozinheiro.\n\n"
		modalMensagem = modalMensagem .. "Cada profissão possui uma mesa de trabalho específica, que é onde o jogador terá acesso a todas as informações específicas.\n\n"
		modalMensagem = modalMensagem .. "Além disso, possui diversas receitas que poderão ser fabricadas caso o jogador tenha todos os requisitos necessários.\n\n"
		modalMensagem = modalMensagem .. "Existem também os ingredientes de melhoria das profissões, que aumentam a chance de sucesso de qualquer receita.\n\n"
		modalMensagem = modalMensagem .. "Link de Acesso Rápido: profissões\n"
	elseif id == 6 then
		passo = "Fabricação de Receitas"
		modalMensagem = modalMensagem .. "Para fabricar uma receita você precisa possuir os seguintes requisitos necessários:\n"
		modalMensagem = modalMensagem .. "     - Nível de Profissão;\n"
		modalMensagem = modalMensagem .. "     - Nível de Jogador;\n"
		modalMensagem = modalMensagem .. "     - Ferramenta;\n"
		modalMensagem = modalMensagem .. "     - Material;\n"
		modalMensagem = modalMensagem .. "     - Conhecimento (apenas receitas mais avançadas).\n\n"
		modalMensagem = modalMensagem .. "Com tudo isso em mãos, é hora de ir até a mesa de trabalho específica da produção, "
		modalMensagem = modalMensagem .. "abrir a lista de receitas disponíveis e selecionar a receita desejada.\n"
	elseif id == 8 then
		passo = "Escolha uma Arma"
		modalMensagem = modalMensagem .. "Escolha uma das armas abaixo e clique em 'Escolher', tecle entre ou dê "
		modalMensagem = modalMensagem .. "um clique duplo na opção desejada para recebê-la.\n\n"
		opcoes = {
			"Arma Aleatória",
			capAll(ItemType(itensKnight[1]):getName()),
			capAll(ItemType(itensKnight[2]):getName()),
			capAll(ItemType(itensKnight[3]):getName())
		}
	elseif id == 9 then
		passo = "Obtendo Materiais"
		modalMensagem = modalMensagem .. "Muito bem " .. self:getName() .. "! Agora que você já aprendeu como fabricar um item "
		modalMensagem = modalMensagem .. "chegou a hora de saber um pouco mais sobre como obter os materiais das receitas.\n\n"
		modalMensagem = modalMensagem .. "Existem 5 maneiras de obter materiais:\n"
		modalMensagem = modalMensagem .. "     - Comprando em NPCs;\n"
		modalMensagem = modalMensagem .. "     - Derrubando de criaturas;\n"
		modalMensagem = modalMensagem .. "     - Fabricando;\n"
		modalMensagem = modalMensagem .. "     - Comprando de outros jogadores;\n"
		modalMensagem = modalMensagem .. "     - Coletando na natureza.\n"
	elseif id == 10 then
		passo = "Coleta de Materiais"
		modalMensagem = modalMensagem .. "Existem 3 tipos de materiais que podem ser coletados na natureza:\n"
		modalMensagem = modalMensagem .. "Ferro, Carvão e Madeira.\n\n"
		modalMensagem = modalMensagem .. "Ao tentar coletar qualquer um desses, você receberá pontos de experiência de "
		modalMensagem = modalMensagem .. "profissão (cada material aumenta a experiência de uma profissão específica)\n"
		modalMensagem = modalMensagem .. "Observação: Mesmo que você não obtenha sucesso na coleta, a experiência será adicionada.\n\n"
		modalMensagem = modalMensagem .. "Além disso, quanto maior for o seu nível na profissão específica daquele material, "
		modalMensagem = modalMensagem .. "mais chance de sucesso você terá.\n\n"
		modalMensagem = modalMensagem .. "Agora chegou a hora de você aprender como identificar uma fonte de coleta.\n"
	elseif id == 14 then
		passo = "Vocações"
		modalMensagem = modalMensagem .. "Agora que você aprendeu os primeiros passos no sistema de crafting, chegou a hora "
		modalMensagem = modalMensagem .. "de saber um pouco mais sobre as vocações.\n\n"
		modalMensagem = modalMensagem .. "Cada vocação possui uma guilda, onde estão localizados os NPC's específicos que fornecerão "
		modalMensagem = modalMensagem .. "desde equipamentos básicos até itens mais avançados.\n\n"
		modalMensagem = modalMensagem .. "Além disso, você pode falar com o mestre da guilda, que lhe fornecerá tarefas para que possa "
		modalMensagem = modalMensagem .. "provar seu valor dentro de sua vocação.\n"
	elseif id == 15 then
		passo = "Vocações - Promoção"
		modalMensagem = modalMensagem .. "Para ser promovido dentro de sua vocação, você deve falar com o mestre da guilda "
		modalMensagem = modalMensagem .. "e realizar qualquer uma das tarefas disponíveis.\n\n"
		modalMensagem = modalMensagem .. "Após concluir a tarefa escolhida vá até o mestre e peça por uma promoção.\n\n"
		modalMensagem = modalMensagem .. "A cada tarefa concluída você receberá pontos de reputação.\n\n"
		modalMensagem = modalMensagem .. "Observação: Você precisa ter pelo menos nível 20 para ser promovido e não terá nenhum custo para isso.\n"
	elseif id == 16 then
		passo = "Conhecendo a 'Maruim Island'"
		modalMensagem = modalMensagem .. "A 'Maruim Island' é a ilha inicial de qualquer jogador. Nela estão localizadas as guildas das vocações e das profissões.\n\n"
		modalMensagem = modalMensagem .. "Foram adicionadas marcas de referência no seu mini mapa, você pode consultá-las para facilitar a sua localização na ilha.\n"
	elseif id == 17 then
		passo = "Primeiros Passos"
		modalMensagem = modalMensagem .. "Poucas criaturas derrubam 'gold coins', por isso, você deve recolher seus itens e procurar um NPC específico "
		modalMensagem = modalMensagem .. "para vendê-los. Fique atento pois diversos itens derrubados são usados em receitas, você pode fabricar equipamentos "
		modalMensagem = modalMensagem .. "e vender para um NPC ou para outros jogadores.\n"
		modalMensagem = modalMensagem .. "Observação: As informações detalhadas de cada item você encontra no database de itens, localizado em nosso site.\n\n"
		modalMensagem = modalMensagem .. "A principal forma de você melhorar seus equipamentos é fabricá-los através do sistema de crafting.\n"
		modalMensagem = modalMensagem .. "Procure verificar a lista de receitas disponíveis (no site ou na mesa de trabalho da profissão) para tornar seu personagem cada vez mais forte.\n\n"
		modalMensagem = modalMensagem .. "Dica:\n"
		modalMensagem = modalMensagem .. "Algumas criaturas não derrubam itens para ser vendidos. Nesses casos, você pode coletar o corpo dessa criatura e vender direto no NPC.\n\n"
		modalMensagem = modalMensagem .. "Link de Acesso Rápido: itens\n"
	elseif id == 18 then
		passo = "Informações Adicionais"
		modalMensagem = modalMensagem .. "Você poderá sair da ilha a qualquer momento, basta possuir a quantia necessária para a viagem para uma das três cidades principais:\n"
		modalMensagem = modalMensagem .. "Ôttô, a cidade simétrica, Hyalakur, a cidade desértica e Civitaten, a cidade do vulcão.\n"
		modalMensagem = modalMensagem .. "Lembrando que você não é obrigado a deixar a ilha, e poderá voltar quando quiser (o preço da passagem é reduzido).\n\n"
		modalMensagem = modalMensagem .. "É recomendado ficar na ilha pelo menos até o nível 8, porém, não precisa ter pressa para sair, a ilha possui áreas "
		modalMensagem = modalMensagem .. "que lhe proporcionarão uma boa quantidade de experiência durante o início da sua jornada.\n\n"
		modalMensagem = modalMensagem .. "Lembre-se sempre de consultar o banco de informações em nosso site, lá está listado todo o conteúdo "
		modalMensagem = modalMensagem .. "disponível no MaruimOT: Itens, NPCs, Criaturas, Mapa e muita informação para auxiliar o seu jogo.\n\n"
		modalMensagem = modalMensagem .. "Boa sorte em sua jornada!\n"
	elseif isInArray({7, 11, 12, 13}, id) then
		return
	end
	if passo ~= nil then
		modalTitulo = modalTitulo .. " - " .. passo
	end
	local modal = ModalWindow(tutorialId+id, modalTitulo, modalMensagem)
	for i = 1, #opcoes do
		modal:addChoice(i, opcoes[i])
	end
	modal:addButton(1, "Próximo")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player.checarSemVocacao(self)
	if self:getVocation():getId() == 0 then
		return true
	end
	return false
end

function Player.enviarModalSemVocacao(self)
	local modalTitulo = "Escolha uma Vocação"
	local modalMensagem = "O seu personagem não possui nenhuma vocação.\n\n"
	modalMensagem = modalMensagem .. "Selecione uma das opções abaixo e tecle 'enter' ou clique em 'escolher' para mudar sua vocação.\n"
	local modal = ModalWindow(tutorialId+tutorialFinalizado+4, modalTitulo, modalMensagem)
	modal:addChoice(1, "Sorcerer")
	modal:addChoice(2, "Druid")
	modal:addChoice(3, "Paladin")
	modal:addChoice(4, "Knight")
	modal:addButton(1, "Escolher")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Fechar")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player.enviarModalAindaSemVocacao(self)
	if self:getVocation():getId() > 0 then
		local modalTitulo = "Nenhuma Vocação foi Selecionada"
		local modalMensagem = "Você não escolheu nenhuma vocação na janela anterior.\n"
		modalMensagem = modalMensagem .. "É obrigatório a escolha de uma vocação para permanecer conectado ao jogo.\n\n"
		modalMensagem = modalMensagem .. "Clique em 'Voltar' para retornar à janela anterior e selecionar uma vocação.\n"
		modalMensagem = modalMensagem .. "Clique em 'Sair' caso não queira escolher uma vocação agora - essa opção te desconectará do jogo.\n"
		local modal = ModalWindow(tutorialId+tutorialFinalizado+5, modalTitulo, modalMensagem)
		modal:addButton(1, "Voltar")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(self)
	end
end

function Player.pegarPassoTutorial(self)
	return math.max(1, self:getStorageValue(tutorialId))
end

function Player.atualizarPassoTutorial(self, passo)
	return self:setStorageValue(tutorialId, passo)
end

function Player.enviarLinkAcessoRapido(self, codigo, descricao)
	if not enviosLinksAcessoRapido[self:getId()] then
		enviosLinksAcessoRapido[self:getId()] = 1
		self:sendTextMessage(4, "Para utilizar um Link de Acesso Rápido você deve ir até o site http://maruim.paulosalvatore.com.br/ e digitá-lo no campo que está localizado na barra direita.")
	end
	self:sendTextMessage(1, "Link de Acesso Rápido: \"" .. codigo .. "\" - " .. descricao .. ".")
end

function Player.tutorialFabricarReceita(self)
	self:allowMovement(false)
	local npc = Npc("Duriel")
	local itemArma
	local vocacaoJogador = self:getVocation():getId()
	if vocacaoJogador == 1 or vocacaoJogador == 2 then
		itemArma = 7735
	elseif vocacaoJogador == 3 then
		itemArma = 8860
	elseif vocacaoJogador == 4 then
		itemArma = 5880
	end
	local mensagens = {
		"Olá " .. self:getName() .. ". Para te ensinar como produzir receitas, vamos criar suas roupas e sua arma.",
		"Aqui estão 3 'brown piece of cloth', para seu equipamento, e 1 '" .. ItemType(itemArma):getName() .. "', para sua arma.",
		"Para isso, você deve ir até a alfaiataria e usar a mesa de trabalho."
	}
	addEvent(tutorialAdicionarMateriais, 4150, self:getId(), itemArma)
	addEvent(npcSay, 150, self:getId(), npc:getId(), mensagens[1])
	addEvent(npcSay, 5000, self:getId(), npc:getId(), mensagens[2])
	addEvent(npcSay, 10000, self:getId(), npc:getId(), mensagens[3])
end

function tutorialAdicionarMateriais(playerId, itemArma)
	local player = Player(playerId)
	if not player then
		return
	end
	player:addItem(5913, 3)
	player:addItem(itemArma, 1)
	player:atualizarPassoTutorial(7)
	player:allowMovement(true)
end

function Player.tutorialJanelaFabricacao(self)
	local modalTitulo = self:getProfissaoModalTitulo(22000)
	local modalMensagem = "Este é um exemplo de janela de profissão.\n\n"
	modalMensagem = modalMensagem .. "Todas as profissões possuem as mesmas opções.\n\n"
	modalMensagem = modalMensagem .. "Observação: A opção 'Fabricar Última Receita' só aparecerá caso você tenha todos os requisitos para produzir a última receita fabricada.\n\n"
	modalMensagem = modalMensagem .. "Link de Acesso Rápido: janela profissão\n"
	local modal = ModalWindow(tutorialId+tutorialFinalizado, modalTitulo, modalMensagem)
	modal:addChoice(5, "Fabricar Última Receita")
	modal:addChoice(1, "Informações da Profissão")
	modal:addChoice(2, "Lista de Receitas - Prontas para Fabricação")
	modal:addChoice(3, "Lista de Receitas - Conhecidas")
	modal:addChoice(4, "Lista de Receitas - Geral")
	modal:addButton(1, "Ok")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Fechar")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player.tutorialJanelaFabricacaoInformacao(self)
	local profissaoId = 22000
	local profissaoNivel = self:getProfissaoSkill(profissaoId)
	local profissaoExpPorcentagem = self:getProfissaoSkillPorcentagem(profissaoId)
	local profissaoExp = self:getProfissaoSkillExp(profissaoId)
	local profissaoExpProximoNivel = self:getProfissaoSkillExpProximoNivel(profissaoId)
	local profissaoPontos = self:getProfissaoPontos(profissaoId)
	local profissaoReceitasFabricadas = self:getProfissaoReceitasFabricadas(profissaoId)
	local profissaoReceitasFalhadas = self:getProfissaoReceitasFalhadas(profissaoId)
	local profissaoBonusAdicional = self:getProfissaoBonusAdicional(profissaoId)
	local profissaoChanceSucessoAdicional = formatarValor(self:getProfissaoChanceSucessoAdicional(profissaoId)).."%"
	local modalTitulo = self:getProfissaoModalTitulo(profissaoId) .. " - Informações"
	local modalMensagem = "Nível: " .. profissaoNivel .. " " .. profissaoExpPorcentagem .. "%)\n"
	modalMensagem = modalMensagem .. "Experiência: " .. profissaoExp .. "\n"
	modalMensagem = modalMensagem .. "Experiência para o próximo nível: " .. profissaoExpProximoNivel .. "\n"
	modalMensagem = modalMensagem .. "Pontos de Profissão: " .. profissaoPontos .. "\n"
	modalMensagem = modalMensagem .. "Receitas fabricadas: " .. profissaoReceitasFabricadas .. "\n"
	modalMensagem = modalMensagem .. "Receitas falhadas: " .. profissaoReceitasFalhadas .. "\n"
	modalMensagem = modalMensagem .. "Bônus adicional: +" .. profissaoBonusAdicional .. "\n"
	modalMensagem = modalMensagem .. "Chance de sucesso adicional: +" .. profissaoChanceSucessoAdicional
	local modal = ModalWindow(tutorialId+tutorialFinalizado+1, modalTitulo, modalMensagem)
	modal:addButton(1, "Voltar")
	modal:setDefaultEnterButton(1)
	modal:sendToPlayer(self)
end

function Player.tutorialJanelaFabricacaoLista(self)
	if self:pegarPassoTutorial() ~= 7 then
		local modalTitulo = "Lista Vazia"
		local modalMensagem = "Você já produziu seus equipamentos.\nClique no botão 'Voltar' e selecione outra opção.\n"
		local modal = ModalWindow(tutorialId+tutorialFinalizado+3, modalTitulo, modalMensagem)
		modal:addButton(1, "Voltar")
		modal:setDefaultEnterButton(1)
		modal:sendToPlayer(self)
	else
		local modalTitulo = self:getProfissaoModalTitulo(22000) .. " - Lista de Receitas - Prontas para Fabricação"
		local modalMensagem = "Selecione um item na lista e realize uma das ações citadas abaixo:\n\n"
		modalMensagem = modalMensagem .. "Clique no botão 'Criar', tecle 'Enter' ou dê dois cliques para iniciar o processo de fabricação.\n"
		modalMensagem = modalMensagem .. "Clique no botão 'Info' para verificar os requisitos necessários para criação do item selecionado.\n"
		local modal = ModalWindow(tutorialId+tutorialFinalizado+2, modalTitulo, modalMensagem)
		modal:addChoice(1, "Equipamentos Iniciais")
		modal:addButton(3, "Info")
		modal:addButton(2, "Voltar")
		modal:addButton(1, "Criar")
		modal:setDefaultEnterButton(1)
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(self)
	end
end

function Player.tutorialJanelaFabricacaoIndisponivel(self)
	local modalTitulo = "Janela Indisponível"
	local modalMensagem = "Esta janela está indisponível durante o tutorial.\n"
	local modal = ModalWindow(tutorialId+tutorialFinalizado+3, modalTitulo, modalMensagem)
	modal:addButton(1, "Voltar")
	modal:setDefaultEnterButton(1)
	modal:sendToPlayer(self)
end

function Player.tutorialIniciarFabricacao(self)
	self:allowMovement(false)
	local tempoFabricacao = 4
	self:removeItem(5913, 3)
	local vocacaoJogador = self:getVocation():getId()
	if vocacaoJogador == 1 or vocacaoJogador == 2 then
		self:getItemById(7735, -1):remove()
	elseif vocacaoJogador == 3 then
		self:getItemById(8860, -1):remove()
	elseif vocacaoJogador == 4 then
		self:getItemById(5880, -1):remove()
	end
	local craftCD = Condition(CONDITION_SPELLCOOLDOWN)
	craftCD:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
	craftCD:setParameter(CONDITION_PARAM_SUBID, 160)
	craftCD:setParameter(CONDITION_PARAM_TICKS, (tempoFabricacao+1)*1000)
	self:addCondition(craftCD)
	local mesa = dataTutorial.mesa[self:getId()]
	mesa:transform(mesa.itemid+1)
	for i = 1, tempoFabricacao do
		addEvent(function(playerId)
			local player = Player(playerId)
			if not player then
				return
			end
			local mesa = dataTutorial.mesa[player:getId()]
			if i < 4 then
				mesa:getPosition():sendMagicEffect(efeitos["hit"])
			else
				mesa:transform(mesa.itemid-1)
				player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
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
				if vocacaoJogador ~= 4 then
					player:enviarModalTutorial(9)
				else
					player:enviarModalTutorial(8)
				end
				player:allowMovement(true)
			end
		end, i*1000, self:getId(), i)
	end
end

function Player.enviarModalItensKnight(self)
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
	modal:sendToPlayer(self)
	self:registerEvent("ItensKnight")
end

function Player.tutorialAprenderColeta(self)
	self:allowMovement(false)
	local npc = Npc("Klaus")
	local mensagens = {
		"Olá " .. self:getName() .. ". Para identificar uma fonte de coleta disponível, você deve verificar se ela possui um brilho em cima.",
		"Para tentar coletá-la, você deve usar uma ferramenta específica que vou lhe entregar agora.",
		"Para coletar ferro e carvão, lhe entregarei uma \"blacksmith's pick\" e para coletar madeira, lhe entregarei um \"small axe\".",
		"Caso você perca algum desses, você poderá comprá-los de NPC's.",
		"Agora vá nessa sala abaixo e use uma das ferramentas em alguma fonte de coleta."
	}
	addEvent(tutorialAdicionarFerramenta, 8150, self:getId())
	for i = 1, #mensagens do
		addEvent(npcSay, ((i-1)*4000)+150, self:getId(), npc:getId(), mensagens[i])
	end
end

function tutorialAdicionarFerramenta(playerId)
	local player = Player(playerId)
	if not player then
		return
	end
	player:addItem(11421):setActionId(4500)
	player:addItem(2559):setActionId(4500)
	player:atualizarPassoTutorial(11)
	player:allowMovement(true)
end

function npcSay(playerId, npcId, mensagem)
	local npc = Npc(npcId)
	if not npc then
		return
	end
	local player = Player(playerId)
	if player then
		npc:say(mensagem, TALKTYPE_PRIVATE_NP, false, player, npc:getPosition())
	end
end

function liberarMovimentoJogador(playerId)
	local player = Player(playerId)
	if player then
		player:allowMovement(true)
	end
end

function efeitosTutorial()
	for i = 1, #posicoesEfeitos do
		Position(posicoesEfeitos[i]):sendMagicEffect(CONST_ME_TUTORIALARROW)
		Position(posicoesEfeitos[i]):sendMagicEffect(CONST_ME_TUTORIALSQUARE)
	end
	addEvent(efeitosTutorial, 3100)
end
