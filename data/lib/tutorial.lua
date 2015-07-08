tutorialId = 4500

function Player.iniciarTutorial(self)
	local posicaoInicioTutorial = Position(304, 2414, 7)
	self:teleportarJogador(posicaoInicioTutorial)
	self:allowMovement(false)
	self:enviarModalTutorial(1)
end

function Player.pularTutorial(self)
	self:teleportarJogador(Town(1):getTemplePosition())
	-- self:setStorageValue(tutorialId, 1)
end

function Player.enviarModalTutorial(self, id)
	local modalTitulo = "Tutorial"
	local modalMensagem = ""
	local opcoes = {}
	if id == 0 then
		modalMensagem = modalMensagem .. "Seja bem-vindo ao MaruimOT, " .. self:getName() .. "!\n\n"
		modalMensagem = modalMensagem .. "Se você é um iniciante por aqui e deseja receber algumas dicas para começar, selecione a opção 'Iniciar Tutorial'.\n\n"
		modalMensagem = modalMensagem .. "Caso você seja experiente e já conheça tudo o que pode fazer, selecione a opção 'Pular Tutorial'.\n\n"
		opcoes = {
			"Iniciar Tutorial",
			"Pular Tutorial"
		}
	elseif id == 1 then
		modalMensagem = modalMensagem .. "Vamos começar!\n\n"
		modalMensagem = modalMensagem .. "Para melhor compreensão, o tutorial será dividido nas seguintes partes:\n\n"
		modalMensagem = modalMensagem .. "-> Introdução\n"
		modalMensagem = modalMensagem .. "-> Explicando o Sistema de Crafting (Fabricação de Itens)\n"
		modalMensagem = modalMensagem .. "       - Profissões\n"
		modalMensagem = modalMensagem .. "       - Fabricação de Receitas\n"
		modalMensagem = modalMensagem .. "       - Obtendo Materiais\n"
		modalMensagem = modalMensagem .. "       - Coleta de Materiais\n"
		modalMensagem = modalMensagem .. "-> Vocação\n"
		modalMensagem = modalMensagem .. "       - Guilda\n"
		modalMensagem = modalMensagem .. "       - Promoção\n"
		modalMensagem = modalMensagem .. "-> Primeiros Passos\n"
		modalMensagem = modalMensagem .. "-> Conhecendo a 'Maruim Island'\n"
		modalMensagem = modalMensagem .. "-> Informações Adicionais\n"
	end
	local modal = ModalWindow(tutorialId+id, modalTitulo, modalMensagem)
	for i = 1, #opcoes do
		modal:addChoice(i, opcoes[i])
	end
	modal:addButton(1, "Próximo")
	modal:setDefaultEnterButton(1)
	modal:sendToPlayer(self)
	self:registerEvent("TutorialModal")
end

function Player.checarSemVocacao(self)
	if self:getVocation():getId() == 0 then
		local modalTitulo = "Login Bloqueado"
		local modalMensagem = "Você deve escolher uma vocação no site antes de conectar seu personagem.\n"
		local modal = ModalWindow(modalNoVocation, modalTitulo, modalMensagem)
		modal:addButton(1, "Ok")
		modal:setDefaultEnterButton(1)
		modal:sendToPlayer(self)
		return false
	end
	return true
end
