configMasmorras = {
	mensagens = {
		possuiParty = "Você deve estar fora de qualquer 'party' para abrir o localizador de masmorras.",
		pz = "Você precisa estar em uma 'protection zone' para abrir o localizador de masmorras.",
		adicionadoFila = "Você foi adicionado à fila. Assim que uma masmorra for localizada você será notificado.",
		removidoFila = "Você foi removido da fila com sucesso.",
		aguarde = "Você deve aguardar alguns segundos para acessar o localizador de masmorras novamente.",
		logoutBloqueado = "Você deve aguardar o término da masmorra para desconectar-se.",
		entrarPartyBloqueado = "Você não pode entrar em uma 'party' enquanto está no localizador de masmorras.",
		sairPartyBloqueado = "Você deve aguardar o término da masmorra para sair da 'party'.",
		comandoBloqueado = "Você não pode utilizar esse comando enquanto está em uma masmorra."
	},
	storageBase = 40000,
	storageMasmorras = 2000,
	tempoLocalizador = 1,
	tempoAceitar = 30,
	tempoRecusar = 5,
	tempoEspera = 15,
	tempoRetorno = 1,
	tempoFinalizar = 5,
	-- tempoLocalizador = 15,
	-- tempoAceitar = 10,
	-- tempoRecusar = 20,
	-- tempoEspera = 30,
	-- tempoRetorno = 20,
	-- tempoFinalizar = 20,
	janelasModal = {
		modalPrincipal = 1,
		modalMasmorraVazia = 2,
		modalMasmorraEncontrada = 3,
		modalMasmorraAceitada = 4,
		modalMasmorraRecusada = 5,
		modalMasmorraVoltarFila = 6,
		modalMasmorraFinalizada = 7
	}
}

Masmorras = {
	[1] = {
		nome = "Masmorra 1",
		nivelMinimo = 0,
		nivelMaximo = 0,
		reputacao = 0,
		jogadoresNecessarios = 2,
		tempo = 30,
		delay = 1,
		posicaoSala = {x = 1703, y = 1552, z = 6},
		posicao = {x = 1703, y = 1550, z = 7},
		criaturas = {
			-- {"Demon", {x = 1695, y = 1562, z = 7}},
			-- {"Demon", {x = 1714, y = 1560, z = 7}},
			-- {"Demon", {x = 1722, y = 1555, z = 7}}
			{"Rat", {x = 1703, y = 1551, z = 7}},
			{"Rat", {x = 1704, y = 1551, z = 7}}
		},
		emUso = false,
		iniciada = false,
		masmorraAtual = 0,
		finalizada = false,
		data = {
			fila = {},
			jogadores = {},
			informacaoJogadores = {},
			-- posicaoJogadores = {},
			criaturas = {}
		}
	}
}

function Player.pegarDelayMasmorra(self, masmorraId)
	return math.max(0, self:getStorageValue(configMasmorras.storageBase+configMasmorras.storageMasmorras+masmorraId))
end

function Player.pegarMasmorrasDisponiveis(self)
	local masmorras = {}
	for a, b in pairs(Masmorras) do
		local playerLevel = self:getLevel()
		if	playerLevel >= b.nivelMinimo and
			((b.nivelMaximo == nil) or (b.nivelMaximo == 0) or (b.nivelMaximo > 0 and playerLevel <= b.nivelMaximo)) and
			((b.reputacao == nil) or (b.reputacao == 0) or (b.reputacao > 0 and self:pegarReputacao() >= b.reputacao)) then
			table.insert(masmorras, a)
		end
	end
	table.sort(masmorras)
	return masmorras
end

function Player.enviarModalMasmorra(self)
	local modalTitulo, modalMensagem, modal
	local modalId = configMasmorras.storageBase+configMasmorras.janelasModal.modalPrincipal
	if self:verificarFila() > 0 then
		modalTitulo = "Localizador de Masmorra"
		modalMensagem = "Atualmente você está em uma fila de masmorra.\n\nSe quiser sair da fila basta clicar no botão 'Sair' ou apertar a tecla 'Enter'.\n"
		modal = ModalWindow(modalId, modalTitulo, modalMensagem)
		modal:addButton(1, "Sair")
		modal:addButton(2, "Fechar")
		modal:setDefaultEnterButton(1)
	else
		local listaMasmorras = self:pegarMasmorrasDisponiveis()
		if table.getn(listaMasmorras) > 0 then
			modalTitulo = "Escolha uma Masmorra para entrar"
			modalMensagem = "Escolha uma masmorra na lista abaixo e clique em 'Escolher', dê um clique duplo ou tecle 'Enter' para entrar na fila do localizador de masmorras.\n\n"
			modal = ModalWindow(modalId, modalTitulo, modalMensagem)
			for a, b in pairs(listaMasmorras) do
				modal:addChoice(b, pegarNomeMasmorra(b))
			end
			modal:addButton(1, "Escolher")
			modal:addButton(2, "Sair")
			modal:setDefaultEnterButton(1)
		else
			modalId = configMasmorras.storageBase+configMasmorras.janelasModal.modalMasmorraVazia
			modalTitulo = "Nenhuma masmorra disponível"
			modalMensagem = "No momento infelizmente não existe nenhuma masmorra disponível para exibir.\n"
			modal = ModalWindow(modalId, modalTitulo, modalMensagem)
			modal:addButton(2, "Fechar")
			modal:setDefaultEnterButton(2)
		end
	end
	if modal ~= nil then
		modal:setDefaultEscapeButton(2)
		addEvent(enviarModal, 100, self:getId(), modal)
		self:registerEvent("LocalizadorMasmorra")
	end
end

function pegarNomeMasmorra(masmorraId)
	return capAll(Masmorras[masmorraId].nome)
end

function Player.verificarInicializacaoLocalizadorMasmorra(self, masmorraId)
	if self:getParty() then
		return configMasmorras.mensagens.possuiParty
	elseif self:pegarDelayMasmorra(masmorraId) > os.time() then
		return "Você deve aguardar mais " .. formatarTempo(self:pegarDelayMasmorra(masmorraId) - os.time()) .. " segundos para entrar novamente nessa masmorra."
	end
	return true
end

function Player.iniciarLocalizadorMasmorra(self, masmorraId)
	local verificarInicializacaoLocalizadorMasmorra = self:verificarInicializacaoLocalizadorMasmorra(masmorraId)
	if verificarInicializacaoLocalizadorMasmorra == true then
		table.insert(Masmorras[masmorraId].data.fila, self:getId())
		processarFilaLocalizadorMasmorra(masmorraId)
		self:sendTextMessage(MESSAGE_INFO_DESCR, configMasmorras.mensagens.adicionadoFila)
		return
	end
	self:sendCancelMessage(verificarInicializacaoLocalizadorMasmorra)
end

function Player.removerLocalizadorMasmorra(self)
	self:sendTextMessage(MESSAGE_INFO_DESCR, configMasmorras.mensagens.removidoFila)
	self:setStorageValue(configMasmorras.storageBase, os.time()+configMasmorras.tempoLocalizador)
	self:removerFila()
end

function Player.removerFila(self)
	local masmorraId = self:verificarFila()
	local fila = Masmorras[masmorraId].data.fila
	table.remove(Masmorras[masmorraId].data.fila, searchArrayKey(fila, self:getId()))
end

function removerJogadoresMasmorra(masmorraId)
	Masmorras[masmorraId].emUso = false
	Masmorras[masmorraId].data.jogadores = {}
end

function Player.verificarFila(self)
	for a, b in pairs(Masmorras) do
		if isInArray(b.data.fila, self:getId()) then
			return a
		end
	end
	return 0
end

function Player.verificarMasmorra(self)
	for a, b in pairs(Masmorras) do
		if isInArray(b.data.jogadores, self:getId()) then
			return a
		end
	end
	return 0
end

function processarFilaLocalizadorMasmorra(masmorraId)
	local masmorra = Masmorras[masmorraId]
	local emUso = masmorra.emUso
	if not emUso then
		local jogadoresNecessarios = masmorra.jogadoresNecessarios
		local fila = masmorra.data.fila
		if table.getn(fila) >= jogadoresNecessarios then
			Masmorras[masmorraId].emUso = true
			local jogadores = {}
			for i = 1, jogadoresNecessarios do
				table.insert(jogadores, fila[i])
			end
			masmorraEncontrada(masmorraId, jogadores)
		end
	end
end

function Player.fecharJanelasModalMasmorra(self)
	local idBase = configMasmorras.storageBase
	for a, b in pairs(configMasmorras.janelasModal) do
		self:closeModalId(idBase+b)
	end
end

function enviarModal(playerId, modal)
	local player = Player(playerId)
	player:fecharJanelasModalMasmorra()
	modal:sendToPlayer(player)
end

function masmorraEncontrada(masmorraId, jogadores)
	local modalId = configMasmorras.storageBase+configMasmorras.janelasModal.modalMasmorraEncontrada
	local modalTitulo = "Masmorra Encontrada!"
	local tempoAceitar = configMasmorras.tempoAceitar
	local tempoRecusar = configMasmorras.tempoRecusar
	local modalMensagem = "Um grupo para a masmorra que você solicitou foi encontrado!\n\nPara entrar na masmorra clique em 'Aceitar' ou tecle 'Enter'.\n\nOBS.: Caso você não aceite em " .. tempoAceitar .. " segundos você será removido da fila e terá que esperar " .. tempoRecusar .. " segundos para entrar novamente.\n"
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	modal:addButton(1, "Aceitar")
	modal:addButton(2, "Fechar")
	modal:setDefaultEnterButton(1)
	modal:setDefaultEscapeButton(2)
	for a, b in pairs(jogadores) do
		addEvent(enviarModal, 100, b, modal)
	end
	addEvent(verificarInicioMasmorra, configMasmorras.tempoAceitar*1000, masmorraId, jogadores)
end

function Player.aceitarConviteMasmorra(self)
	local playerId = self:getId()
	local masmorraId = self:verificarFila()
	local masmorra = Masmorras[masmorraId]
	table.insert(Masmorras[masmorraId].data.jogadores, playerId)
	local jogadores = masmorra.data.jogadores
	if table.getn(jogadores) == masmorra.jogadoresNecessarios then
		verificarInicioMasmorra(masmorraId, jogadores)
	else
		local modalId = configMasmorras.storageBase+configMasmorras.janelasModal.modalMasmorraAceitada
		local modalTitulo = "Convite para Masmorra Aceito!"
		local modalMensagem = "O convite para a masmorra foi aceito!\n\nAguardando os outros jogadores aceitarem.\n"
		local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
		modal:addButton(2, "Fechar")
		modal:setDefaultEnterButton(2)
		modal:setDefaultEscapeButton(2)
		addEvent(enviarModal, 100, playerId, modal)
	end
end

function verificarInicioMasmorra(masmorraId, jogadores)
	local masmorra = Masmorras[masmorraId]
	if masmorra.iniciada then
		return false
	end
	local jogadoresAceitaram = masmorra.data.jogadores
	if table.getn(jogadores) == table.getn(jogadoresAceitaram) then
		iniciarMasmorra(masmorraId, jogadores)
	else
		for a, b in pairs(jogadores) do
			local player = Player(b)
			if player then
				if not isInArray(jogadoresAceitaram, b) then
					player:setStorageValue(configMasmorras.storageBase, os.time()+configMasmorras.tempoRecusar)
					player:removerFila()
					local modalId = configMasmorras.storageBase+configMasmorras.janelasModal.modalMasmorraRecusada
					local modalTitulo = "Masmorra Recusada!"
					local modalMensagem = "Você não aceitou o convite para a masmorra.\n\nPara entrar no localizador de masmorras novamente você deverá esperar " .. configMasmorras.tempoRecusar .. " segundos.\n"
					local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
					modal:addButton(1, "Ok")
					modal:addButton(2, "Fechar")
					modal:setDefaultEnterButton(1)
					modal:setDefaultEscapeButton(2)
					addEvent(enviarModal, 100, b, modal)
				else
					local modalId = configMasmorras.storageBase+configMasmorras.janelasModal.modalMasmorraVoltarFila
					local modalTitulo = "Masmorra Recusada!"
					local modalMensagem = "Você voltou para a fila pois algum jogador não aceitou o convite para a masmorra.\n\nAssim que uma masmorra for encontrada novamente, você será notificado.\n"
					local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
					modal:addButton(1, "Ok")
					modal:addButton(2, "Fechar")
					modal:setDefaultEnterButton(1)
					modal:setDefaultEscapeButton(2)
					addEvent(enviarModal, 100, b, modal)
				end
			end
		end
		removerJogadoresMasmorra(masmorraId)
	end
end

function iniciarMasmorra(masmorraId, jogadores)
	Masmorras[masmorraId].iniciada = true
	Masmorras[masmorraId].finalizada = false
	local masmorra = Masmorras[masmorraId]
	local tempo = masmorra.tempo
	local posicao = masmorra.posicao
	local posicaoSala = Position(masmorra.posicaoSala)
	local criaturas = masmorra.criaturas
	local masmorraAtual = masmorra.masmorraAtual
	local jogador1 = Player(jogadores[1])
	local jogador2 = Player(jogadores[2])
	jogador1:removerFila()
	jogador2:removerFila()
	local party = jogador1:createParty(jogador2, true)
	local tempoEspera = configMasmorras.tempoEspera
	local tempoMasmorra = tempo+tempoEspera
	local modalId = configMasmorras.storageBase+configMasmorras.janelasModal.modalMasmorraAceitada
	local modalTitulo = "A Masmorra será Iniciada!"
	local modalMensagem = "A masmorra será iniciada em " .. tempoEspera .. " segundos. Após isso, seu grupo terá " .. tempo .. " segundos para finalizá-la.\n"
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	modal:addButton(2, "Fechar")
	modal:setDefaultEnterButton(2)
	modal:setDefaultEscapeButton(2)
	for a, b in pairs(jogadores) do
		local player = Player(b)
		if a > 2 then
			player:removerFila()
			party:addMember(player)
		end
		local informacaoJogador = {posicao = player:getPosition(), localizacao = "sala"}
		table.insert(Masmorras[masmorraId].data.informacaoJogadores, b, informacaoJogador)
		player:teleportarJogador(posicaoSala)
		posicaoSala = posicaoSala + {x = 1}
		addEvent(enviarModal, 100, b, modal)
		addEvent(function(playerId, posicao)
			player:teleportarJogador(posicao)
			Masmorras[masmorraId].data.informacaoJogadores[playerId].localizacao = "masmorra"
		end, tempoEspera*1000, player:getId(), posicao)
	end
	for a, b in pairs(criaturas) do
		local criatura = Game.createMonster(b[1], b[2])
		table.insert(Masmorras[masmorraId].data.criaturas, criatura:getId())
	end
	addEvent(finalizarMasmorra, tempoMasmorra*1000, masmorraId, masmorraAtual, true)
end

function enviarProgressoMasmorra(masmorraId)
	local jogadores = Masmorras[masmorraId].data.jogadores
	local criaturas = Masmorras[masmorraId].data.criaturas
	local quantidadeCriaturas = table.getn(criaturas)
	local mensagem
	if quantidadeCriaturas == 1 then
		mensagem = "Resta " .. quantidadeCriaturas .. " monstro na masmorra."
	else
		mensagem = "Restam " .. quantidadeCriaturas .. " monstros na masmorra."
	end
	for a, b in pairs(jogadores) do
		Player(b):sendTextMessage(MESSAGE_EVENT_ADVANCE, mensagem)
	end
end

function finalizarMasmorra(masmorraId, checarMasmorraAtual, evento)
	local masmorra = Masmorras[masmorraId]
	local masmorraAtual = masmorra.masmorraAtual
	if checarMasmorraAtual ~= masmorraAtual then
		return
	end
	local masmorraFinalizada = masmorra.finalizada
	if evento and masmorraFinalizada then
		return
	end
	Masmorras[masmorraId].masmorraAtual = masmorraAtual+1
	local delay = masmorra.delay
	local jogadores = masmorra.data.jogadores
	local criaturas = masmorra.data.criaturas
	local party = Player(jogadores[1]):getParty()
	for a, b in pairs(jogadores) do
		local informacaoJogador = masmorra.data.informacaoJogadores[b]
		local player = Player(b)
		player:curarJogador()
		player:removerDebuffs()
		player:setStorageValue(configMasmorras.storageBase+configMasmorras.storageMasmorras+masmorraId, os.time()+delay)
		player:teleportarJogador(informacaoJogador.posicao)
	end
	party:disband()
	for a, b in pairs(criaturas) do
		local criatura = Creature(b)
		if criatura then
			criatura:remove(1)
		end
	end
	removerJogadoresMasmorra(masmorraId)
	Masmorras[masmorraId].iniciada = false
	processarFilaLocalizadorMasmorra(masmorraId)
	return true
end

function Player.teleportarJogadorSalaMasmorra(self, masmorraId)
	local masmorra = Masmorras[masmorraId]
	local posicaoSala = Position(masmorra.posicaoSala) + {x = searchArrayKey(masmorra.jogadores, player:getId())}
	player:teleportarJogador(posicaoSala)
	Masmorras[masmorraId].data.informacaoJogadores[b].localizacao = "sala"
end

function ressuscitarJogadoresMasmorra(masmorraId)
	-- Verificar se todos os jogadores estão na Sala de Espera
	-- Caso estejam, ressuscitar imediatamente
	-- Caso não estejam, verificar se existem jogadores em batalha - Apenas permitir o comando se todos estiverem fora de batalha
	-- /\ Verificar se a mensagem "em batalha" será enviada para quem solicitou o comando ou para todos
	-- Se for para quem solicitou, ela deverá ser executada no script da talkaction
	-- A verificação deverá ser feita em ambos scripts, porém, na função, apenas retornará falso.
end
