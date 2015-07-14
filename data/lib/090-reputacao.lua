Reputacao = {
	ranks = {
		{
			nome = "Neutro",
			pontos = 0,
			fraseNpc = "Olá jovem aprendiz, eu posso lhe designar uma {tarefa}, caso queira."
		},
		{
			nome = "Amigável",
			pontos = 100,
			fraseNpc = "Olá |PLAYERNAME|, você deseja verificar suas {tarefas} ou por acaso está procurando por uma {promoção}?",
			fraseNpcPromovido = "Olá |PLAYERNAME|, você deseja verificar suas {tarefas} ou visualizar os itens disponíveis para {negociação}?"
		},
		{
			nome = "Respeitado",
			pontos = 1000,
			fraseNpc = "Olá |PLAYERNAME|, você deseja verificar suas {tarefas} ou por acaso está procurando por uma {promoção}?",
			fraseNpcPromovido = "Olá |SENHOR| |PLAYERNAME|, você deseja verificar suas {tarefas} ou visualizar os itens disponíveis para {negociação}?"
		},
		{
			nome = "Reverenciado",
			pontos = 2000,
			fraseNpc = "Olá |PLAYERNAME|, você deseja verificar suas {tarefas} ou por acaso está procurando por uma {promoção}?",
			fraseNpcPromovido = "Olá |MESTRE| |PLAYERNAME|, você deseja verificar suas {tarefas} ou visualizar os itens disponíveis para {negociação}?"
		},
		{
			nome = "Exaltado",
			pontos = 5000,
			fraseNpc = "Olá |PLAYERNAME|, você deseja verificar suas {tarefas} ou por acaso está procurando por uma {promoção}?",
			fraseNpcPromovido = "Olá |VOCATIONNAME| |PLAYERNAME|, você deseja verificar suas {tarefas} ou visualizar os itens disponíveis para {negociação}?"
		}
	},
	loja = {
		[9942] = {preco = 100, reputacao = 1},
		[9941] = {preco = 100, reputacao = 1},
		[9980] = {preco = 100, reputacao = 1},
	},
	promocao = 200
}
function pegarNpcReputacao(vocacaoId)
	if vocacaoId == 1 or vocacaoId == 5 then
		return "Etevi Drayn"
	elseif vocacaoId == 2 or vocacaoId == 6 then
		return "Drorist Suhariux"
	elseif vocacaoId == 3 or vocacaoId == 7 then
		return "Arti Earth"
	elseif vocacaoId == 4 or vocacaoId == 8 then
		return "Gras Fravotroth"
	end
end