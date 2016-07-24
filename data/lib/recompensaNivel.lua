recompensaIdBase = 50000
recompensaPendente = 1
recompensasInicio = 5
recompensasOpcoesInicio = 300
recompensasMaisTardeInicio, recompensasFinalizadasInicio = 600, 600
recompensasMaximo = 900
modalRecompensaAberto = {}
recompensaAguardando = {}
tempoMensagemRecompensaAguardando = 60

RecompensasNivel = {
	{
		nivel = 10,
		vocacao = {"sorcerer"},
		recompensa = {2190, 1}
	},
	{
		nivel = 10,
		vocacao = {"druid"},
		recompensa = {2182, 1}
	},
	{
		nivel = 10,
		vocacao = {"sorcerer", "druid"},
		recompensa = {8820, 1}
	},
	{
		nivel = 10,
		vocacao = {"sorcerer", "druid"},
		recompensa = {8819, 1}
	},
	{
		nivel = 10,
		vocacao = {"sorcerer", "druid"},
		recompensa = {2175, 1}
	},
	{
		nivel = 10,
		vocacao = {"knight"},
		recompensaOpcoes = {{8602, 1}, {2439, 1}, {8601, 1}}
	},
	{
		nivel = 10,
		vocacao = {"knight"},
		recompensa = {2481, 1}
	},
	{
		nivel = 10,
		vocacao = {"knight"},
		recompensa = {2465, 1}
	},
	{
		nivel = 10,
		vocacao = {"knight"},
		recompensa = {2478, 1}
	},
	{
		nivel = 10,
		vocacao = {"knight"},
		recompensa = {2509, 1}
	},
	{
		nivel = 10,
		vocacao = {"paladin"},
		recompensa = {2456, 1}
	},
	{
		nivel = 10,
		vocacao = {"paladin"},
		recompensa = {23839, 100}
	},
	{
		nivel = 10,
		vocacao = {"paladin"},
		recompensa = {2660, 1}
	},
	{
		nivel = 10,
		vocacao = {"paladin"},
		recompensa = {8923, 1}
	}
}

function Player:adicionarRecompensaPendente(recompensa)
	self:setStorageValue(recompensaIdBase+recompensasInicio+recompensa, 1)
	self:setStorageValue(recompensaIdBase+recompensaPendente, 1)
end

function Player:checarRecompensaPendente()
	if self:getStorageValue(recompensaIdBase+recompensaPendente) == 1 then
		return true
	end
	return false
end

function Player:pegarRecompensaPendente()
	for i = 1, #RecompensasNivel do
		if self:getStorageValue(recompensaIdBase+recompensasInicio+i) == 1 then
			return i
		end
	end
	return false
end

function Player:pegarRecompensaOpcaoSelecionada(recompensaId)
	return self:getStorageValue(recompensaIdBase+recompensasOpcoesInicio+recompensasInicio+recompensaId)
end

function Player:enviarModalRecompensa(recompensaId)
	if not recompensaId then
		recompensaId = self:pegarRecompensaPendente()
	end

	if recompensaId then
		local recompensaInfo = RecompensasNivel[recompensaId]
		local adicionarItem = 0
		local recompensaSelecionada = self:pegarRecompensaOpcaoSelecionada(recompensaId)

		if recompensaInfo.recompensa ~= nil then
			adicionarItem = recompensaInfo.recompensa
		elseif recompensaInfo.recompensaOpcoes ~= nil and recompensaSelecionada > 0 then
			adicionarItem = recompensaInfo.recompensaOpcoes[recompensaSelecionada]
		end

		if adicionarItem == 0 then
			local modalTitulo = "Recompensa Disponível"
			local modalMensagem = "Você atingiu o nível " .. recompensaInfo.nivel .. " e recebeu uma recompensa por isso.\n\n"
			modalMensagem = modalMensagem .. "No entanto, essa recompensa possui mais de uma opção e você deve escolher apenas uma delas.\n\n"
			modalMensagem = modalMensagem .. "Selecione um dos itens abaixo e clique em 'Escolher', tecle 'Enter' ou clique duas vezes sobre a opção para marcá-la.\n\n"
			local modal = ModalWindow(recompensaIdBase+recompensasInicio+recompensasOpcoesInicio+recompensaId, modalTitulo, modalMensagem)

			for a, b in pairs(recompensaInfo.recompensaOpcoes) do
				modal:addChoice(a, capAll(ItemType(b[1]):getName()))
			end

			modal:addButton(1, "Escolher")
			modal:setDefaultEnterButton(1)
			modal:addButton(2, "Sair")
			modal:setDefaultEscapeButton(2)
			modal:sendToPlayer(self)
		else
			local exibicaoRecompensa = pegarExibicaoRecompensa(adicionarItem)
			local pesoItem = exibicaoRecompensa[2]
			local modalTitulo = "Recompensa Disponível"
			local modalMensagem = "Você recebeu  '" .. exibicaoRecompensa[1] .. "' como recompensa por ter atingido o nível " .. recompensaInfo.nivel .. ".\n\n"
			modalMensagem = modalMensagem .. "O peso desse item é " .. formatarPeso(pesoItem) .. ".\n\n"
			modalMensagem = modalMensagem .. "Escolha uma das ações abaixo para receber o item.\n"
			local modal = ModalWindow(recompensaIdBase+recompensasInicio+recompensaId, modalTitulo, modalMensagem)
			local tituloPrimeiraEscolha = "Receber agora"
			if self:getFreeCapacity() < pesoItem then
				tituloPrimeiraEscolha = tituloPrimeiraEscolha .. " (capacidade insuficiente, o item cairá no chão)"
			else
				if not self:addItem(adicionarItem[1], adicionarItem[2], false) then
					tituloPrimeiraEscolha = tituloPrimeiraEscolha .. " (espaço insuficiente, o item cairá no chão)"
				else
					self:removeItem(adicionarItem[1], adicionarItem[2])
				end
			end
			modal:addChoice(1, tituloPrimeiraEscolha)
			modal:addChoice(2, "Enviar pelo correio")
			modal:addChoice(3, "Perguntar novamente mais tarde")
			modal:addButton(1, "Escolher")
			modal:setDefaultEnterButton(1)
			modal:addButton(2, "Sair")
			modal:setDefaultEscapeButton(2)
			if recompensaSelecionada > 0 then
				modal:addButton(3, "Voltar")
			end
			modal:sendToPlayer(self)
		end
		self:registerEvent("RecompensaNivelModal")
		modalRecompensaAberto[self:getId()] = recompensaId
	end
end

function pegarExibicaoRecompensa(item)
	local itemType = ItemType(item[1])
	local nomeItem = itemType:getName()
	local quantidadeItem = item[2]
	local pesoItem = itemType:getWeight()*quantidadeItem
	if quantidadeItem > 1 then
		nomeItem = itemType:getPluralName()
	end
	return {quantidadeItem .. " " .. nomeItem, pesoItem}
end

function Player:selecionarRecompensa(recompensaId, opcao)
	self:setStorageValue(recompensaIdBase+recompensasInicio+recompensasOpcoesInicio+recompensaId, opcao)
	self:enviarModalRecompensa(recompensaId)
end

function Player:removerEscolhaRecompensa(recompensaId, correio)
	self:setStorageValue(recompensaIdBase+recompensasInicio+recompensasOpcoesInicio+recompensaId, 0)
	self:enviarModalRecompensa(recompensaId)
end

function Player:entregarRecompensa(recompensaId, correio)
	modalRecompensaAberto[self:getId()] = false

	local recompensaInfo = RecompensasNivel[recompensaId]
	local item = recompensaInfo.recompensa
	if item == nil then
		local recompensaSelecionada = self:pegarRecompensaOpcaoSelecionada(recompensaId)
		item = recompensaInfo.recompensaOpcoes[recompensaSelecionada]
	end

	local adicionarPara = self
	local exibicaoRecompensa = pegarExibicaoRecompensa(item)
	if correio ~= nil then
		self:sendTextMessage(MESSAGE_INFO_DESCR, "O item '" .. exibicaoRecompensa[1] .. "' foi enviado para sua caixa de correio. Vá até o depot mais próximo para resgatá-lo.")
		adicionarPara = adicionarPara:getInbox()
	else
		self:sendTextMessage(MESSAGE_INFO_DESCR, "Você recebeu o item '" .. exibicaoRecompensa[1] .. "'.")
	end

	adicionarPara:addItem(item[1], item[2], true, 1)
	self:setStorageValue(recompensaIdBase+recompensasFinalizadasInicio+recompensaId, 1)
	self:setStorageValue(recompensaIdBase+recompensasInicio+recompensaId, 0)

	if not self:pegarRecompensaPendente() then
		self:unregisterEvent("RecompensaNivel")
		self:setStorageValue(recompensaIdBase+recompensaPendente, 0)
	end
end

function Player:modalTempoRecompensaMaisTarde(recompensaId)
	local modalTitulo = "Perguntar novamente mais tarde"
	local modalMensagem = "Você selecionou a opção 'perguntar novamente mais tarde'.\n\n"
	modalMensagem = modalMensagem .. "Escolha daqui a quanto tempo você deseja receber uma nova notificação para recebimento da recompensa.\n\n"
	modalMensagem = modalMensagem .. "Caso você queira escolher receber a recompensa agora, clique no botão 'Voltar' e selecione uma das opções de recebimento.\n\n"
	local modal = ModalWindow(recompensaIdBase+recompensasMaisTardeInicio+recompensasInicio+recompensaId, modalTitulo, modalMensagem)
	modal:addChoice(1, "10 segundos")
	modal:addChoice(2, "30 segundos")
	modal:addChoice(3, "1 minuto")
	modal:addChoice(4, "5 minutos")
	modal:addButton(3, "Voltar")
	modal:addButton(2, "Sair")
	modal:addButton(1, "Escolher")
	modal:setDefaultEnterButton(1)
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end

function Player:checarRecompensaFinalizada(recompensaId)
	if self:getStorageValue(recompensaIdBase+recompensasFinalizadasInicio+recompensaId) == 1 then
		return true
	end

	return false
end

function Player:enviarModalRecompensaMaisTarde(recompensaId, tempo)
	recompensaAguardando[self:getId()] = os.time() + tempo - tempoMensagemRecompensaAguardando
	addEvent(function(playerId, recompensaId)
		local player = Player(playerId)
		if not player then
			return
		end

		if not modalRecompensaAberto[playerId] or modalRecompensaAberto[playerId] == recompensaId then
			modalRecompensaAberto[playerId] = nil
		end
	end, tempo*1000, self:getId(), recompensaId)
end
