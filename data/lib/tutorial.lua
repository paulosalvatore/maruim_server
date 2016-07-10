tutorialId = 4500
tutorialFinalizado = 50
tutorialIntervaloMaximo = 100

habilitarTutorial = true

function Player:iniciarTutorial()
	self:enviarModalTutorial(2)
end

function Player:sairTutorial()
	self:allowMovement(true)
	local passoTutorial = self:pegarPassoTutorial()
	local vocacaoJogador = self:getVocation():getId()

	if passoTutorial < 4 then
		self:adicionarMarcasMapa(1)
	end

	if passoTutorial < 12 then
		self:teleportarParaGuilda()
	end

	self:atualizarPassoTutorial(tutorialFinalizado)
end

function Player:confirmarSairTutorial()
	local modalTitulo = "Sair do Tutorial"
	local modalMensagem = "Você tem certeza que deseja sair do tutorial?\n"
	local modal = ModalWindow(tutorialId, modalTitulo, modalMensagem)
	modal:addButton(1, "Sim")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Não")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player:enviarModalTutorial(id, atualizarPasso)
	self:allowMovement(false)

	if atualizarPasso == nil or atualizarPasso then
		self:atualizarPassoTutorial(id)
	end

	local modalTitulo = "Tutorial"
	local passo
	local modalMensagem = ""
	local opcoes = {}

	if id == 1 then
		modalMensagem = modalMensagem .. "Seja bem-vindo ao MaruimOT, " .. self:getName() .. "!\n\n"
		modalMensagem = modalMensagem .. "Se você está começando agora e deseja receber algumas dicas para começar, selecione a opção 'Iniciar Tutorial'.\n\n"
		modalMensagem = modalMensagem .. "Caso você seja experiente e já conheça tudo o que pode fazer, selecione a opção 'Pular Tutorial'.\n\n"
		opcoes = {
			"Iniciar Tutorial",
			"Pular Tutorial"
		}
	elseif id == 2 then
		modalMensagem = modalMensagem .. "Vamos começar!\n\n"
		modalMensagem = modalMensagem .. "Para melhor compreensão, o tutorial está dividido nas seguintes partes:\n\n"
		modalMensagem = modalMensagem .. "-> Introdução\n"
		modalMensagem = modalMensagem .. "-> Conhecendo a 'Maruim Island'\n"
		modalMensagem = modalMensagem .. "-> Itens Iniciais\n"
		modalMensagem = modalMensagem .. "-> Recompensas por Criaturas Mortas\n"
		modalMensagem = modalMensagem .. "-> Itens Encontrados em Missões ou Derrubados por Monstros\n"
		modalMensagem = modalMensagem .. "-> Informações Adicionais\n"
		modalMensagem = modalMensagem .. "-> Vocação\n"
		modalMensagem = modalMensagem .. "       - Guilda\n"
		modalMensagem = modalMensagem .. "       - Promoção\n"
	elseif id == 3 then
		passo = "Introdução"
		modalMensagem = modalMensagem .. "Durante o tutorial você receberá diversas informações e dicas que te ajudarão a entender melhor o servidor.\n\n"
		modalMensagem = modalMensagem .. "Fique tranquilo! Caso você desconecte durante o tutorial, quando voltar você "
		modalMensagem = modalMensagem .. "estará exatamente onde parou, para que possa prosseguir com o mesmo.\n\n"
		modalMensagem = modalMensagem .. "Você pode sair do tutorial a qualquer momento, basta escolher a opção 'Sair' "
		modalMensagem = modalMensagem .. "(ou pressionar a tecla 'Esc') e confirmar a saída.\n"
	elseif id == 4 then
		passo = "Conhecendo a 'Maruim Island'"
		modalMensagem = modalMensagem .. "A 'Maruim Island' é a ilha inicial de qualquer jogador. Nela estão localizadas todas as guildas das vocações.\n\n"
		modalMensagem = modalMensagem .. "Foram adicionadas marcas de referência no seu mini mapa, você pode consultá-las para facilitar a sua localização na ilha.\n"
	elseif id == 5 then
		passo = "Itens Iniciais"
		modalMensagem = modalMensagem .. "Enquanto você permanecer na Maruim Island você poderá utilizar alguns itens iniciais que te ajudarão no início da sua jornada. São eles:\n\n"
		modalMensagem = modalMensagem .. "-> Pergaminho de Teleporte\n"
		modalMensagem = modalMensagem .. "-> Pequena Poção de Vida (refil gratuito)\n"
	elseif id == 6 then
		passo = "Itens Iniciais - Pergaminho de Teleporte"
		modalMensagem = modalMensagem .. "O 'Pergaminho de Teleporte' permite que você vá para qualquer área de caça da Maruim Island.\n\n"
		modalMensagem = modalMensagem .. "Além disso, você também consegue se teleportar para certos NPC's e sair da ilha quando quiser.\n\n"
		modalMensagem = modalMensagem .. "Caso você saia da ilha, o pergaminho de teleporte e o refil de poções serão automaticamente removidos.\n\n"
		modalMensagem = modalMensagem .. "OBS.: Você pode usá-lo quantas vezes quiser, desde que esteja fora de combate, seja nível 30 ou inferior e respeitando um intervalo de 30 segundos a cada utilização.\n"
	elseif id == 7 then
		passo = "Itens Iniciais - Pequena Poção de Vida (refil gratuito)"
		modalMensagem = modalMensagem .. "A 'Pequena Poção de Vida' é um item que lhe recuperará uma pequena quantidade de vida.\n\n"
		modalMensagem = modalMensagem .. "Você poderá recarregá-la no 'NPC Flora' localizado no templo da ilha inicial.\n\n"
		modalMensagem = modalMensagem .. "Dica: Para chegar rapidamente ao local de recarregamento da poção, use o 'Pergaminho de Teleporte' e escolha a opção 'NPC Flora (refil de poções)'.\n"
	elseif id == 8 then
		passo = "Recompensas por Criaturas Mortas"
		modalMensagem = modalMensagem .. "Para começar, temos uma ótima notícia: ao matar qualquer criatura, você não tem que abrir seu corpo para recolher 'gold coins'.\n"
		modalMensagem = modalMensagem .. "A recompensa que você recebe por derrotar essas criaturas vão direto para sua conta especial que pode ser acessada a qualquer "
		modalMensagem = modalMensagem .. "momento através do comando: '/saque quantidade desejada'.\n"
		modalMensagem = modalMensagem .. "Exemplo: Para sacar '10 gold coins', você deve digitar: '/saque 10' e pronto, você receberá a quantia!\n\n"
		modalMensagem = modalMensagem .. "Fique atento pois uma vez que você retira valores de sua conta especial não há como retorná-lo para ela.\n\n"
		modalMensagem = modalMensagem .. "Existem também um limite de 'gold coins' que você pode armazenar e esse limite aumenta caso você possua uma 'Conta Premium'."
	elseif id == 9 then
		passo = "Itens Encontrados em Missões ou Derrubados por Monstros"
		modalMensagem = modalMensagem .. "Todos os itens encontrados em missões ou derrubados por monstros possuem valor!\n\n"
		modalMensagem = modalMensagem .. "A maioria deles você poderá vender para NPC's espalhados em todo o mundo, outros poderão ser utilizados em diversas missões disponíveis.\n\n"
		modalMensagem = modalMensagem .. "Caso você tenha dúvida sobre algum item basta acessar o nosso site e pesquisá-lo em nosso exclusivo database de itens!\n"
	elseif id == 10 then
		passo = "Informações Adicionais"
		modalMensagem = modalMensagem .. "Você poderá sair da ilha a qualquer momento, basta utilizar o seu pergaminho de teleporte e escolher a opção 'Sair da Maruim Island' e escolher umas das cidades abaixo:\n\n"
		modalMensagem = modalMensagem .. "Ôttô, a cidade simétrica, Hyalakur, a cidade desértica ou Civitaten, a cidade do vulcão.\n\n"
		modalMensagem = modalMensagem .. "Lembrando que você não é obrigado a deixar a ilha em algum nível específico e poderá voltar quando quiser (basta procurar o navio mais próximo e pedir uma passagem ao capitão).\n\n"
		modalMensagem = modalMensagem .. "É recomendado ficar na ilha pelo menos até o nível 10, porém, não precisa ter pressa para sair, a ilha possui áreas "
		modalMensagem = modalMensagem .. "que lhe proporcionarão uma boa quantidade de pontos de experiência durante o início da sua jornada.\n\n"
		modalMensagem = modalMensagem .. "Lembre-se sempre de consultar o banco de informações em nosso site, lá está listado todo o conteúdo "
		modalMensagem = modalMensagem .. "disponível em nosso servidor: Itens, NPC's, Criaturas, Mapa e muitas informações úteis para auxiliar o seu jogo.\n"
	elseif id == 11 then
		passo = "Vocação - Guilda"
		modalMensagem = modalMensagem .. "Vamos te explicar um pouco sobre as vocações.\n\n"
		modalMensagem = modalMensagem .. "Cada vocação possui uma guilda, onde estão localizados os NPC's específicos que fornecerão "
		modalMensagem = modalMensagem .. "desde equipamentos básicos até itens mais avançados.\n\n"
		modalMensagem = modalMensagem .. "Chegou a hora de conhecer a sua guilda. Vamos lá!\n\n"
	elseif id == 12 then
		modalMensagem = modalMensagem .. "Chegamos! Essa é a 'Guilda dos " .. self:formatarNomeVocacao() .. "'.\n\n"
		modalMensagem = modalMensagem .. "O mestre da guilda irá te fornecer algumas informações importantes!\n\n"
		modalMensagem = modalMensagem .. "Boa sorte em sua jornada e divirta-se!\n"
	elseif isInArray({13}, id) then
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

function Player:checarSemVocacao()
	if self:getVocation():getId() == 0 then
		return true
	end

	return false
end

function Player:enviarModalSemVocacao()
	local modalTitulo = "Escolha uma Vocação"
	local modalMensagem = "O seu personagem não possui nenhuma vocação.\n\n"
	modalMensagem = modalMensagem .. "Selecione uma das opções abaixo e tecle 'enter' ou clique em 'escolher' para mudar sua vocação.\n"
	local modal = ModalWindow(tutorialId+tutorialFinalizado+1, modalTitulo, modalMensagem)
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

function Player:enviarModalAindaSemVocacao()
	if self:getVocation():getId() > 0 then
		local modalTitulo = "Nenhuma Vocação foi Selecionada"
		local modalMensagem = "Você não escolheu nenhuma vocação na janela anterior.\n"
		modalMensagem = modalMensagem .. "É obrigatório a escolha de uma vocação para permanecer conectado ao jogo.\n\n"
		modalMensagem = modalMensagem .. "Clique em 'Voltar' para retornar à janela anterior e selecionar uma vocação.\n"
		modalMensagem = modalMensagem .. "Clique em 'Sair' caso não queira escolher uma vocação agora - essa opção te desconectará do jogo.\n"
		local modal = ModalWindow(tutorialId+tutorialFinalizado+2, modalTitulo, modalMensagem)
		modal:addButton(1, "Voltar")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(self)
	end
end

function Player:pegarPassoTutorial()
	return math.max(1, self:getStorageValue(tutorialId))
end

function Player:atualizarPassoTutorial(passo)
	return self:setStorageValue(tutorialId, passo)
end

function Player:enviarModalItensKnight()
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
	modal:sendToPlayer(self)
	self:registerEvent("ItensKnight")
end

function Player:tutorialMestreGuilda()
	local vocacaoJogador = self:getVocation():getId()
	local npcReputacao = pegarNpcReputacao(vocacaoJogador)
	local npc = Npc(npcReputacao)

	self:desativarInteracaoNpcs()

	local mensagens = {
		"Olá " .. self:getName() .. ". Meu nome é " .. npcReputacao .. " e eu sou o mestre da guilda.",
		"Durante sua jornada é importante ter em mente que você deve mostrar o seu valor para a guilda.",
		"Para isso você deverá realizar algumas tarefas e eu te recompensarei com prêmios e bonificações.",
		"Para você conseguir sua promoção, é necessário realizar pelo menos uma tarefa. Escolha uma tarefa na janela que aparecerá em alguns segundos."
	}

	addEvent(function(playerId)
		self:enviarTasksModalPrincipal()
		self:registerEvent("Tasks")
		self:allowMovement(true)
		self:ativarInteracaoNpcs()
	end, 21150, self:getId())

	addEvent(npcSay, 150, self:getId(), npc:getId(), mensagens[1])
	addEvent(npcSay, 5000, self:getId(), npc:getId(), mensagens[2])
	addEvent(npcSay, 10000, self:getId(), npc:getId(), mensagens[3])
	addEvent(npcSay, 15000, self:getId(), npc:getId(), mensagens[4])
end
