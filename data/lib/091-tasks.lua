configTasks = {
	storageBase = 30000,
	progresso = 2000,
	valorIniciada = 1,
	valorCompleta = 2,
	valorFinalizada = 3,
	modalInicio = 10,
	modalTasksDisponiveis = 1,
	modalTasksProgresso = 2,
	modalTasksRealizadas = 3,
	modalTasksDisponiveisInfo = 4,
	modalTasksProgressoInfo = 5,
	modalTasksRealizadasInfo = 6,
	modalTasksRecompensas = 7
}
-- Exemplo de Configuração:
-- [idTarefa] = {
	-- nivelMinimo = int - Opcional,
	-- nivelMaximo = int - Opcional,
	-- reputacao = int - Opcional,
	-- criatura = var - Obrigatório,
	-- recompensa = {
		-- dinheiro = array ou int - Opcional,
		-- experiencia = array ou int - Opcional,
		-- item = array(int, array ou int) - Opcional,
		-- nivel = int,
		-- reputacao = int,
		-- outfit = int,
		-- addon = int,
		-- montaria = int
	-- }
-- }
Tasks = {
	[1] = {
		nivelMinimo = 0,
		nivelMaximo = 0,
		quantidade = 50,
		criatura = "vampire",
		recompensa = {
			reputacao = 100
		}
	},
	[2] = {
		nivelMinimo = 0,
		nivelMaximo = 0,
		quantidade = 50,
		criatura = "fire elemental",
		recompensa = {
			reputacao = 100
		}
	}
}
listaTasks = {}
for a, b in pairs(Tasks) do
	table.insert(listaTasks, configTasks.storageBase+configTasks.modalInicio+a)
end

function Player.iniciarTask(self, taskId)
	local task = Tasks[taskId]
	self:setStorageValue(configTasks.storageBase+taskId, configTasks.valorIniciada)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Nova tarefa iniciada.")
end
function Player.verificarStatusTask(self, taskId)
	return math.max(0, self:getStorageValue(configTasks.storageBase+taskId))
end
function Player.verificarProgressoTask(self, taskId)
	return math.max(0, self:getStorageValue(configTasks.storageBase+configTasks.progresso+taskId))
end
function Player.adicionarProgressoTask(self, taskId)
	local task = Tasks[taskId]
	local progressoTask = self:verificarProgressoTask(taskId)+1
	self:setStorageValue(configTasks.storageBase+configTasks.progresso+taskId, progressoTask)
	local mensagem = "Atualização de Tarefa: " .. progressoTask .. "/" .. task.quantidade .. " - " .. capAll(task.criatura)
	if progressoTask == task.quantidade then
		mensagem = mensagem .. " - Completa"
		self:completarTask(taskId)
	end
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, mensagem)
end
function Player.completarTask(self, taskId)
	local task = Tasks[taskId]
	if task.recompensa ~= nil then
		local recompensa = task.recompensa
		if recompensa.dinheiro ~= nil then
			local valorRecompensa = recompensa.dinheiro
			if type(valorRecompensa) == "table" then
				valorRecompensa = math.random(valorRecompensa[1], valorRecompensa[2])
			end
			self:addMoneyBank(valorRecompensa)
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Recompensa de Tarefa: A quantia de " .. valorRecompensa .. " gp foi depositada em sua conta bancária.")
		end
		if recompensa.nivel ~= nil then
			local valorRecompensa = recompensa.nivel
			local exibirRecompensa = valorRecompensa .. " nív"
			if valorRecompensa == 1 then
				exibirRecompensa = exibirRecompensa .. "el"
			else
				exibirRecompensa = exibirRecompensa .. "eis"
			end
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Recompensa de Tarefa: Você recebeu " .. exibirRecompensa .. ".")
			for a = 1, valorRecompensa do
				self:addLevel()
			end
		end
		if recompensa.experiencia ~= nil then
			local valorRecompensa = recompensa.experiencia
			if type(valorRecompensa) == "table" then
				valorRecompensa = math.random(valorRecompensa[1], valorRecompensa[2])
			end
			local exibirRecompensa = valorRecompensa .. " ponto"
			if valorRecompensa > 1 then
				exibirRecompensa = exibirRecompensa .. "s"
			end
			self:addExperience(valorRecompensa)
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Recompensa de Tarefa: Você recebeu " .. exibirRecompensa .. " de experiência.")
		end
		if recompensa.reputacao ~= nil then
			local valorRecompensa = recompensa.reputacao
			local exibirRecompensa = valorRecompensa .. " ponto"
			if valorRecompensa > 1 then
				exibirRecompensa = exibirRecompensa .. "s"
			end
			self:adicionarReputacao(valorRecompensa)
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Recompensa de Tarefa: Você recebeu " .. exibirRecompensa .. " de reputação.")
		end
		if recompensa.item ~= nil then
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Recompensa de Tarefa: Você recebeu " .. exibirTaskItemRecompensa(recompensa.item) .. ". Vá a algum NPC de Tarefas para retirá-lo.")
		else
			self:finalizarTask(taskId)
			return true
		end
	end

	self:setStorageValue(configTasks.storageBase+taskId, configTasks.valorCompleta)
end
function Player.checarTaskCompleta(self, taskId)
	local statusTask = self:verificarStatusTask(taskId)
	if statusTask == configTasks.valorCompleta or statusTask == configTasks.valorFinalizada then
		return true
	end
	return false
end
function Player.finalizarTask(self, taskId)
	self:setStorageValue(configTasks.storageBase+configTasks.progresso+taskId, 0)
	self:setStorageValue(configTasks.storageBase+taskId, configTasks.valorFinalizada)
end
function Creature.checarTask(self)
	for a, b in pairs(Tasks) do
		if string.lower(self:getName()) == b.criatura then
			return a
		end
	end
	return 0
end
function Player.pegarTasksDisponiveis(self)
	local tasks = {}
	for a, b in pairs(Tasks) do
		local playerLevel = self:getLevel()
		local statusTask = self:verificarStatusTask(a)
		if	(statusTask == 0 or
			statusTask == configTasks.valorFinalizada) and
			((b.nivelMinimo == nil) or (b.nivelMinimo == 0) or (b.nivelMinimo > 0 and playerLevel >= b.nivelMinimo)) and
			((b.nivelMaximo == nil) or (b.nivelMaximo == 0) or (b.nivelMaximo > 0 and playerLevel <= b.nivelMaximo)) and
			((b.reputacao == nil) or (b.reputacao == 0) or (b.reputacao > 0 and self:pegarReputacao() >= b.reputacao)) then
			table.insert(tasks, a)
		end
	end
	return tasks
end
function Player.pegarTasksProgresso(self)
	local tasks = {}
	for a, b in pairs(Tasks) do
		local playerLevel = self:getLevel()
		if self:verificarStatusTask(a) == configTasks.valorIniciada then
			table.insert(tasks, a)
		end
	end
	return tasks
end
function Player.pegarTasksRealizadas(self)
	local tasks = {}
	for a, b in pairs(Tasks) do
		local playerLevel = self:getLevel()
		local statusTask = self:verificarStatusTask(a)
		if statusTask == configTasks.valorCompleta or statusTask == configTasks.valorFinalizada then
			table.insert(tasks, a)
		end
	end
	return tasks
end
function Player.checarTasksRecompensa(self)
	for a, b in pairs(Tasks) do
		local playerLevel = self:getLevel()
		if	self:verificarStatusTask(a) == 2 and
			b.recompensa.item ~= nil then
			return true
		end
	end
	return false
end
function Player.pegarTasksRecompensa(self)
	local tasks = {}
	for a, b in pairs(Tasks) do
		local playerLevel = self:getLevel()
		if	self:verificarStatusTask(a) == 2 and
			b.recompensa.item ~= nil then
			table.insert(tasks, a)
		end
	end
	return tasks
end
function Player.enviarTasksModalPrincipal(self)
	local reputacaoRankId = self:pegarRankReputacao()
	local reputacaoProximoRank = pegarReputacaoRank(reputacaoRankId+1)
	local exibirReputacao = "Pontos de Reputação: " .. self:pegarReputacao()
	if not reputacaoProximoRank == false then
		exibirReputacao = exibirReputacao .. "/" .. reputacaoProximoRank
	end
	local modalTitulo = "Tarefas - " .. pegarNomeRank(reputacaoRankId) .. " - " .. exibirReputacao
	local modalMensagem = "Você pode escolher uma das opções abaixo para verificar as tarefas correspondentes.\n\nO que você deseja fazer?\n"
	local modal = ModalWindow(configTasks.storageBase, modalTitulo, modalMensagem)
	if self:checarTasksRecompensa() then
		modal:addChoice(4, "Pegar Recompensas Disponíveis")
	end
	modal:addChoice(1, "Lista de Tarefas - Disponíveis")
	modal:addChoice(2, "Lista de Tarefas - Em Progresso")
	modal:addChoice(3, "Lista de Tarefas - Realizadas")
	modal:addButton(1, "Ok")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	modal:sendToPlayer(self)
end
function Player.enviarTasksModalDisponiveis(self)
	local modalTitulo = "Lista de Tarefas - Disponíveis"
	local modalMensagem = "Selecione uma tarefa na lista e realize uma das ações citadas abaixo:\n\nClique no botão 'Iniciar', tecle 'Enter' ou dê dois cliques para iniciar a tarefa.\nClique no botão 'Info' para verificar todas as informações da tarefa selecionada.\n"
	local modalId = configTasks.storageBase+configTasks.modalTasksDisponiveis
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	local listaTasks = self:pegarTasksDisponiveis()
	if #listaTasks > 0 then
		for a, b in pairs(listaTasks) do
			modal:addChoice(b, pegarNomeTask(b))
		end
		modal:addButton(4, "Info")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:addButton(1, "Iniciar")
		modal:setDefaultEscapeButton(2)
		modal:addButton(3, "Voltar")
		modal:sendToPlayer(self)
	else
		self:enviarTasksModalVazio(modalId)
	end
end
function Player.enviarTasksModalProgresso(self)
	local modalTitulo = "Lista de Tarefas - Progresso"
	local modalMensagem = "Selecione uma tarefa na lista e clique no botão 'Info', tecle 'Enter' ou dê dois cliques para verificar todas as informações da tarefa selecionada.\n"
	local modalId = configTasks.storageBase+configTasks.modalTasksProgresso
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	local listaTasks = self:pegarTasksProgresso()
	if #listaTasks > 0 then
		for a, b in pairs(listaTasks) do
			modal:addChoice(b, pegarNomeTask(b))
		end
		modal:addButton(1, "Info")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:addButton(3, "Voltar")
		modal:sendToPlayer(self)
	else
		self:enviarTasksModalVazio(modalId)
	end
end
function Player.enviarTasksModalRealizadas(self)
	local modalTitulo = "Lista de Tarefas - Realizadas"
	local modalMensagem = "Selecione uma tarefa na lista e clique no botão 'Info', tecle 'Enter' ou dê dois cliques para verificar todas as informações da tarefa selecionada.\n"
	local modalId = configTasks.storageBase+configTasks.modalTasksRealizadas
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	local listaTasks = self:pegarTasksRealizadas()
	if #listaTasks > 0 then
		for a, b in pairs(listaTasks) do
			modal:addChoice(b, pegarNomeTask(b))
		end
		modal:addButton(1, "Info")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:addButton(3, "Voltar")
		modal:sendToPlayer(self)
	else
		self:enviarTasksModalVazio(modalId)
	end
end
function Player.enviarTasksModalRecompensas(self)
	local modalTitulo = "Tarefas - Recompensas Disponíveis"
	local modalMensagem = "Selecione uma recompensa na lista e clique no botão 'Retirar', tecle 'Enter' ou dê dois cliques para retirar a recompensa da tarefa selecionada.\n"
	local modalId = configTasks.storageBase+configTasks.modalTasksRecompensas
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	local listaTasks = self:pegarTasksRecompensa()
	if #listaTasks > 0 then
		for a, b in pairs(listaTasks) do
			modal:addChoice(b, exibirTaskItemRecompensa(Tasks[b].recompensa.item) .. " - Tarefa: " .. pegarNomeTask(b))
		end
		modal:addButton(1, "Retirar")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:addButton(3, "Voltar")
		modal:sendToPlayer(self)
	else
		self:enviarTasksModalVazio(modalId)
	end
end
function Player.enviarTasksModalVazio(self, modalId)
	local modalTitulo = "Aviso"
	local modalMensagem = "Não há nenhuma tarefa para ser exibida.\nClique no botão 'Voltar' e selecione outra opção."
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	modal:setDefaultEscapeButton(2)
	modal:addButton(5, "Ok")
	modal:addButton(2, "Sair")
	modal:addButton(3, "Voltar")
	modal:setDefaultEnterButton(5)
	modal:sendToPlayer(self)
end
function Player.enviarTasksModalInfo(self, taskId, modalId)
	local task = Tasks[taskId]
	local statusTask = self:verificarStatusTask(taskId)
	local modalTitulo = "Tarefa - " .. task.quantidade .. " " .. capAll(task.criatura) .. " - Informações"
	local modalMensagem = ""
	if statusTask == 0 then
		modalMensagem = "Clique no botão 'Iniciar' ou tecle 'Enter' para iniciar a tarefa.\n\n"
	elseif statusTask == configTasks.valorIniciada then
		modalMensagem = "Confira abaixo as informações da tarefa selecionada que está em progresso.\n\n"
	elseif statusTask == configTasks.valorCompleta or statusTask == configTasks.valorFinalizada then
		modalMensagem = "Confira abaixo as informações da tarefa selecionada que foi realizada com sucesso.\n\n"
	end
	modalMensagem = modalMensagem .. "Objetivo\n"
	modalMensagem = modalMensagem .. "Matar " .. task.quantidade .. " " .. capAll(task.criatura) .. "\n"
	if statusTask == configTasks.valorIniciada then
		modalMensagem = modalMensagem .. "Criaturas Mortas até agora: " .. self:verificarProgressoTask(taskId) .. "\n"
	end
	modalMensagem = modalMensagem .. "\nRequisito\n"
	if	(task.nivelMinimo ~= nil and task.nivelMinimo > 0) or
		(task.nivelMaximo ~= nil and task.nivelMaximo > 0) or
		(task.reputacao ~= nil and task.reputacao > 0) then
		if task.nivelMinimo ~= nil and task.nivelMinimo > 0 then
			modalMensagem = modalMensagem .. "Nível Mínimo: " .. task.nivelMinimo .. "\n"
		end
		if task.nivelMaximo ~= nil and task.nivelMaximo > 0 then
			modalMensagem = modalMensagem .. "Nível Máximo: " .. task.nivelMaximo .. "\n"
		end
		if task.reputacao ~= nil and task.reputacao > 0 then
			modalMensagem = modalMensagem .. "Reputação Necessária: " .. task.reputacao .. "\n"
		end
	else
		modalMensagem = modalMensagem .. "Nenhum\n"
	end
	modalMensagem = modalMensagem .. "\nRecompensa\n"
	local recompensa = task.recompensa
	if recompensa.dinheiro ~= nil then
		local exibirTaskDinheiro = recompensa.dinheiro
		if type(exibirTaskDinheiro) == "table" then
			exibirTaskDinheiro = "Entre " .. exibirTaskDinheiro[1] .. " e " .. exibirTaskDinheiro[2] .. " gp"
		end
		modalMensagem = modalMensagem .. "Dinheiro: " .. exibirTaskDinheiro .. "\n"
	end
	if recompensa.experiencia ~= nil then
		local exibirTaskExperiencia = recompensa.experiencia
		if type(exibirTaskExperiencia) == "table" then
			exibirTaskExperiencia = "Entre " .. exibirTaskExperiencia[1] .. " e " .. exibirTaskExperiencia[2]
		end
		modalMensagem = modalMensagem .. "Experiência: " .. exibirTaskExperiencia .. "\n"
	end
	if recompensa.item ~= nil then
		modalMensagem = modalMensagem .. "Item: " .. exibirTaskItemRecompensa(recompensa.item) .. "\n"
	end
	if recompensa.nivel ~= nil then
		modalMensagem = modalMensagem .. "Nível: " .. recompensa.nivel .. "\n"
	end
	if recompensa.reputacao ~= nil then
		modalMensagem = modalMensagem .. "Reputação: " .. recompensa.reputacao .. "\n"
	end
	local modal = ModalWindow(configTasks.storageBase+modalId, modalTitulo, modalMensagem)
	if statusTask == 0 then
		modal:addButton(1, "Iniciar")
		modal:setDefaultEnterButton(1)
	end
	modal:setDefaultEscapeButton(2)
	modal:addButton(3, "Voltar")
	if statusTask > 0 then
		modal:setDefaultEnterButton(3)
	end
	modal:addButton(2, "Sair")
	modal:sendToPlayer(self)
end
function Player.retirarRecompensa(self, taskId)
	local recompensa = Tasks[taskId].recompensa.item
	local item = recompensa[1]
	local quantidade = recompensa[2]
	if type(quantidade) == "table" then
		quantidade = math.random(quantidade[1], quantidade[2])
	end
	local peso = ItemType(item):getWeight()
	if self:getFreeCapacity() >= peso then
		if self:addItemEx(Game.createItem(item, quantidade)) == 0 then
			self:finalizarTask(taskId)
			self:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve " .. pegarNomeItem(item, quantidade) .. ".")
		else
			self:sendTextMessage(MESSAGE_INFO_DESCR, "Você não possui espaço para receber o item.")
		end
	else
		self:sendTextMessage(MESSAGE_INFO_DESCR, "Essa recompensa pesa " .. peso .. " oz. É muito pesada para você carregar.")
	end
	return true
end
function pegarNomeTask(taskId)
	local task = Tasks[taskId]
	return task.quantidade .. " " .. capAll(task.criatura)
end
function pegarNomeItem(item, quantidade)
	local itemType = ItemType(item)
	local nomeItem = itemType:getName()
	if quantidade > 1 then
		nomeItem = itemType:getPluralName()
	end
	return quantidade .. " '" .. nomeItem .. "'"
end
function exibirTaskItemRecompensa(item)
	local exibirItem = capAll(ItemType(item[1]):getName())
	if type(item[2]) == "table" then
		exibirItem = exibirItem .. " - entre " .. item[2][1] .. " e " .. item[2][2]
	else
		exibirItem = exibirItem .. " - " .. item[2]
	end
	return exibirItem
end