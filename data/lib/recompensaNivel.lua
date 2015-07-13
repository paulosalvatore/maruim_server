recompensaIdBase = 6000
recompensaPendente = 1
recompensasInicio = 10
recompensasMaisTardeInicio = 500
recompensasMaximo = 1000
modalRecompensaAberto = {}

RecompensasNivel = {
	[1] = {
		nivel = 8,
		vocacao = {"sorcerer"},
		recompensa = {2190, 1}
	},
	[2] = {
		nivel = 8,
		vocacao = {"druid"},
		recompensa = {2182, 1}
	}
}

function Player.adicionarRecompensaPendente(self, recompensa)
	self:setStorageValue(recompensaIdBase+recompensasInicio+recompensa, 1)
	self:setStorageValue(recompensaIdBase+recompensaPendente, 1)
end

function Player.checarRecompensaPendente(self)
	if self:getStorageValue(recompensaIdBase+recompensaPendente) == 1 then
		return true
	end
	return false
end

function Player.pegarRecompensaPendente(self)
	for i = 1, #RecompensasNivel do
		if self:getStorageValue(recompensaIdBase+recompensasInicio+i) == 1 then
			return i
		end
	end
	return false
end

function Player.enviarModalRecompensa(self, recompensaId)
	if not recompensaId then
		recompensaId = self:pegarRecompensaPendente()
	end
	if recompensaId then
		local recompensa = RecompensasNivel[recompensaId]
		local item = ItemType(recompensa.recompensa[1])
		local nomeItem = item:getName()
		local quantidadeItem = recompensa.recompensa[2]
		local pesoItem = item:getWeight()*quantidadeItem
		if quantidadeItem > 1 then
			nomeItem = item:getPluralName()
		end
		local exibirItem = quantidadeItem .. " " .. nomeItem
		local modalTitulo = "Recompensa Disponível"
		local modalMensagem = "Você recebeu  '" .. exibirItem .. "' como recompensa por ter atingido o nível " .. recompensa.nivel .. ".\n\n"
		modalMensagem = modalMensagem .. "O peso desse item é " .. formatarPeso(pesoItem) .. ".\n\n"
		modalMensagem = modalMensagem .. "Escolha uma das ações abaixo para receber o item.\n\n"
		local modal = ModalWindow(recompensaIdBase+recompensasInicio+recompensaId, modalTitulo, modalMensagem)
		local tituloPrimeiraEscolha = "Receber agora"
		if self:getFreeCapacity() < pesoItem then
			tituloPrimeiraEscolha = tituloPrimeiraEscolha .. " (capacidade insuficiente, o item cairá no chão)"
		else
			if not self:addItem(recompensa.recompensa[1], recompensa.recompensa[2], false) then
				tituloPrimeiraEscolha = tituloPrimeiraEscolha .. " (espaço insuficiente, o item cairá no chão)"
			else
				self:removeItem(recompensa.recompensa[1], recompensa.recompensa[2])
			end
		end
		modal:addChoice(1, tituloPrimeiraEscolha)
		modal:addChoice(2, "Enviar pelo correio")
		modal:addChoice(3, "Perguntar novamente mais tarde")
		modal:addButton(1, "Escolher")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(self)
		self:registerEvent("RecompensaNivelModal")
		modalRecompensaAberto[self:getId()] = recompensaId
	end
end

function Player.entregarRecompensa(self, recompensaId, correio)
	modalRecompensaAberto[self:getId()] = false
	local recompensa = RecompensasNivel[recompensaId]
	local item = recompensa.recompensa
	local adicionarPara = self
	if correio ~= nil then
		adicionarPara = adicionarPara:getInbox()
	end
	adicionarPara:addItem(item[1], item[2], true, 1)
	self:setStorageValue(recompensaIdBase+recompensasInicio+recompensaId, 0)
	if not self:pegarRecompensaPendente() then
		self:unregisterEvent("RecompensaNivel")
		self:setStorageValue(recompensaIdBase+recompensaPendente, 0)
	end
end

function Player.modalTempoRecompensaMaisTarde(self, recompensaId)
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

function Player.enviarModalRecompensaMaisTarde(self, recompensaId, tempo)
	addEvent(function(playerId, recompensaId)
		local player = Player(playerId)
		if not player then
			return
		end

		if not modalRecompensaAberto[playerId] or modalRecompensaAberto[playerId] == recompensaId then
			player:enviarModalRecompensa(recompensaId)
		end
	end, tempo*1000, self:getId(), recompensaId)
end
