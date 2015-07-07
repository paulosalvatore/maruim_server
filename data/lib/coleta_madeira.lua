if pontosColetaMadeira == nil then
	pontosColetaMadeira = {}
	pontosColetaMadeiraDisponiveis = {}
	pontosColetaMadeiraAtuais = {}
end
function gerarPontosColetaMadeira()
	local inicio = {431, 1182}
	local final = {1530, 2119}
	for i = inicio[1], final[1] do
		for j = inicio[2], final[2] do
			local posicao = Position(i, j, 7)
			local piso = Tile(posicao)
			if piso ~= nil then
				local itens = piso:getItems()
				if itens then
					for a, b in pairs(itens) do
						if isInArray(arvores, b:getId()) then
							posicao = posicao.x .. "," .. posicao.y .. "," .. posicao.z
							table.insert(pontosColetaMadeira, posicao)
							table.insert(pontosColetaMadeiraDisponiveis, posicao)
						end
					end
				end
			end
		end
	end
	while #pontosColetaMadeiraAtuais < math.floor(#pontosColetaMadeira*0.1) do
		gerarPontoColetaMadeira()
	end
end

function gerarPontoColetaMadeira(posicaoAntiga)
	if posicaoAntiga ~= nil then
		for a, b in pairs(pontosColetaMadeiraAtuais) do
			if b == posicaoAntiga then
				table.remove(pontosColetaMadeiraAtuais, a)
			end
		end
	end
	local chavePontoColeta = math.random(1, #pontosColetaMadeiraDisponiveis)
	local pontoColeta = pontosColetaMadeiraDisponiveis[chavePontoColeta]
	table.remove(pontosColetaMadeiraDisponiveis, chavePontoColeta)
	local pontoColeta = pontoColeta:split(",")
	local posicaoPontoColeta = Position(pontoColeta[1], pontoColeta[2], pontoColeta[3])
	Game.createItem(sparkling[math.random(1, #sparkling)], 1, posicaoPontoColeta)
	table.insert(pontosColetaMadeiraAtuais, pontoColeta)
	if posicaoAntiga ~= nil then
		table.insert(pontosColetaMadeiraDisponiveis, posicaoAntiga)
	end
end
