configTasks = {
	storageBase = 30000,
	progresso = 2000,
	valorIniciada = 1,
	valorCompleta = 2
}
-- Criaturas = {
	-- ["rat"] = 1,
	-- ["cave rat"] = 2,
	-- ["bug"] = 3
-- }
Tasks = {
	[1] = {
		levelMinimo = 0,
		levelMaximo = 10,
		quantidade = 10,
		criaturas = {
			"rat"
		},
		recompensa = {
			dinheiro = {0, 100}, -- ou 100
			experiencia = {0, 100}, -- ou 100
			item = {2160, {0, 2}}, -- ou {2160, 1}
			level = 1, -- valor_fixo
			reputacao = 5, -- valor_fixo
			outfit = 5, -- valor_fixo
			addon = 5, -- valor_fixo
			montaria = 5, -- valor_fixo
			reputacao = 5, -- valor_fixo
		}
	},
	[2] = {
		levelMinimo = 0,
		levelMaximo = 10,
		quantidade = 10,
		criaturas = {
			"bug"
		}
	},
	[3] = {
		levelMinimo = 0,
		levelMaximo = 10,
		quantidade = 10,
		criaturas = {
			"cave rat"
		}
	}
}
function Player.iniciarTask(self, task)
	self:setStorageValue(configTasks.storageBase+task, configTasks.valorIniciada)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Nova Task iniciada.")
end
function Player.testRemoverTask(self, task)
	self:setStorageValue(configTasks.storageBase+task, 0)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Teste: Task removida com sucesso.")
end
function Player.verificarStatusTask(self, task)
	return math.max(0, self:getStorageValue(configTasks.storageBase+task))
end
function Player.verificarProgressoTask(self, task)
	return math.max(0, self:getStorageValue(configTasks.storageBase+configTasks.progresso+task))
end
function Player.adicionarProgressoTask(self, task)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Progresso da Task atualizado. Valor antigo: " .. self:verificarProgressoTask(task) .. " - Valor atual: " .. self:verificarProgressoTask(task)+1)
	self:setStorageValue(configTasks.storageBase+configTasks.progresso+task, self:verificarProgressoTask(task)+1)
end
function Player.checarTaskCompleta(self, task)
	if self:verificarStatusTask(task) == configTasks.valorCompleta then
		return true
	end
	return false
end
function Creature.checarTask(self)
	for a, b in pairs(Tasks) do
		for c, d in pairs(b.criaturas) do
			if string.lower(self:getName()) == d then
				return a
			end
		end
	end
	return 0
end