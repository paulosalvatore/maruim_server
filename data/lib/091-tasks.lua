configTasks = {
	storageBase = 30000,
	progresso = 2000,
	valorIniciada = 1,
	valorCompleta = 2,
	modalInicio = 10,
	modalTasksDisponiveis = 1,
	modalTasksProgresso = 2,
	modalTasksRealizadas = 3,
	modalTasksDisponiveisInfo = 4,
	modalTasksProgressoInfo = 5,
	modalTasksRealizadasInfo = 6
}
-- Criaturas = {
	-- ["rat"] = 1,
	-- ["cave rat"] = 2,
	-- ["bug"] = 3
-- }
-- Tipos de Recompensas
-- dinheiro = {0, 100}, -- ou 100
-- experiencia = {0, 100}, -- ou 100
-- item = {2160, {1, 2}}, -- ou {2160, 1}
-- nivel = 1, -- valor_fixo
-- reputacao = 5, -- valor_fixo
-- outfit = 5, -- valor_fixo
-- addon = 5, -- valor_fixo
-- montaria = 5 -- valor_fixo
-- Colocar para retirar as recompensas pelo modal
Tasks = {
	[1] = {
		nivelMinimo = 0,
		nivelMaximo = 0,
		reputacao = 1,
		quantidade = 10,
		criatura = "rat",
		recompensa = {
			dinheiro = {0, 100},
			experiencia = {0, 100},
			item = {2160, {1, 2}},
			nivel = 1,
			reputacao = 5
		}
	},
	[2] = {
		nivelMinimo = 0,
		nivelMaximo = 0,
		quantidade = 10,
		criatura = "bug",
		recompensa = {
			reputacao = 4
		}
	},
	[3] = {
		nivelMinimo = 0,
		nivelMaximo = 0,
		quantidade = 10,
		criatura = "cave rat",
		recompensa = {
			reputacao = 3
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
	local mensagem = "Atualização de Tarefa: " .. progressoTask .. "/" .. task.quantidade .. " - " .. capAll(task.criatura)
	if progressoTask == task.quantidade then
		mensagem = mensagem .. " - Completa"
		self:completarTask(taskId)
	end
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, mensagem)
	self:setStorageValue(configTasks.storageBase+configTasks.progresso+taskId, progressoTask)
end
function Player.completarTask(self, taskId)
	self:setStorageValue(configTasks.storageBase+taskId, configTasks.valorCompleta)
end
function Player.checarTaskCompleta(self, taskId)
	if self:verificarStatusTask(taskId) == configTasks.valorCompleta then
		return true
	end
	return false
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
		if	self:verificarStatusTask(a) == 0 and
			playerLevel >= b.nivelMinimo and
			((b.nivelMaximo == nil) or (b.nivelMaximo == 0) or (b.nivelMaximo > 0 and playerLevel <= b.nivelMaximo)) and
			((b.reputacao == nil) or (b.reputacao == 0) or (b.reputacao > 0 and self:verificarReputacao() >= b.reputacao)) then
			table.insert(tasks, a)
		end
	end
	return tasks
end
function Player.pegarTasksProgresso(self)
	local tasks = {}
	for a, b in pairs(Tasks) do
		local playerLevel = self:getLevel()
		if self:verificarStatusTask(a) == 1 then
			table.insert(tasks, a)
		end
	end
	return tasks
end
function Player.pegarTasksRealizadas(self)
	local tasks = {}
	for a, b in pairs(Tasks) do
		local playerLevel = self:getLevel()
		if self:verificarStatusTask(a) == 2 then
			table.insert(tasks, a)
		end
	end
	return tasks
end
function Player.enviarTasksModalPrincipal(self)
	local modalTitulo = "Tarefas - Selecione uma opção"
	local modalMensagem = "Você pode escolher uma das opções abaixo para verificar as tarefas correspondentes.\n\nO que você deseja fazer?\n"
	local modal = ModalWindow(configTasks.storageBase, modalTitulo, modalMensagem)
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
	if table.getn(listaTasks) > 0 then
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
	if table.getn(listaTasks) > 0 then
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
	if table.getn(listaTasks) > 0 then
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
function Player.enviarTasksModalVazio(self, modalId)
	local modalTitulo = "Aviso"
	local modalMensagem = "Não há nenhuma tarefa para ser exibida.\nClique no botão 'Voltar' e selecione outra opção."
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	modal:addButton(3, "Voltar")
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	modal:addButton(5, "Ok")
	modal:setDefaultEnterButton(5)
	modal:sendToPlayer(self)
end
function Player.enviarTasksModalInfo(self, taskId, modalId)
	local task = Tasks[taskId]
	local statusTask = self:verificarStatusTask(taskId)
	local modalTitulo = "Tarefa - " .. task.quantidade .. " " .. capAll(task.criatura) .. " - Informações"
	local modalMensagem
	if statusTask == 0 then
		modalMensagem = "Clique no botão 'Iniciar' ou tecle 'Enter' para iniciar a tarefa.\n\n"
	elseif statusTask == 1 then
		modalMensagem = "Confira abaixo as informações da tarefa selecionada que está em progresso.\n\n"
	elseif statusTask == 2 then
		modalMensagem = "Confira abaixo as informações da tarefa selecionada que foi realizada com sucesso.\n\n"
	end
	modalMensagem = modalMensagem .. "Objetivo\n"
	modalMensagem = modalMensagem .. "Matar " .. task.quantidade .. " " .. capAll(task.criatura) .. "\n"
	if statusTask == 1 then
		modalMensagem = modalMensagem .. self:pegarTaskProgresso(taskId) .. " criaturas mortas até agora\n"
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
		local exibirTaskItem = capAll(ItemType(recompensa.item[1]):getName())
		if type(recompensa.item[2]) == "table" then
			exibirTaskItem = exibirTaskItem .. " - entre " .. recompensa.item[2][1] .. " e " .. recompensa.item[2][2]
		else
			exibirTaskItem = exibirTaskItem .. " - " .. recompensa.item[2]
		end
		modalMensagem = modalMensagem .. "Item: " .. exibirTaskItem .. "\n"
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
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	modal:addButton(3, "Voltar")
	if statusTask > 0 then
		modal:setDefaultEnterButton(3)
	end
	modal:sendToPlayer(self)
end
function Player.pegarTaskProgresso(self, task)
	return math.max(0, self:getStorageValue(configTasks.storageBase+configTasks.progresso+task))
end
function pegarNomeTask(task)
	return Tasks[task].quantidade .. " " .. capAll(Tasks[task].criatura)
end