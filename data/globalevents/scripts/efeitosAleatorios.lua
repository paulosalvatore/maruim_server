function onThink(cid, interval, lastExecution)
	local config = {
		["inicial"] = {x = 732, y = 1529},
		["final"] = {x = 777, y = 1584},
		["z"] = {7, 6, 5},
		["chao"] = {
			["efeitos"] = {CONST_ME_YALAHARIGHOST, CONST_ME_BATS},
			["ids"] = {406, 407, 431, 457, 420}
		},
		["paredeHorizontal"] = {
			["efeitos"] = {CONST_ME_SKULLHORIZONTAL},
			["ids"] = {9119, 9121, 9127, 9135, 9136, 9137, 9138, 9139, 9143, 9295, 9296}
		},
		["paredeVertical"] = {
			["efeitos"] = {CONST_ME_SKULLVERTICAL},
			["ids"] = {9118, 9293, 9125, 9129, 9130, 9131, 9132, 9133, 9142, 9298, 9299}
		},
		["espelhoHorizontal"] = {
			["efeitos"] = {CONST_ME_MIRRORHORIZONTAL},
			["ids"] = {9583}
		},
		["espelhoVertical"] = {
			["efeitos"] = {CONST_ME_MIRRORVERTICAL},
			["ids"] = {9605}
		}
	}
	local posicoesGeradas = {}
	local posicoesVerificadas = {}
	while(table.getn(posicoesVerificadas) < 1) do
		tabelaEfeito = 0
		posicaoValidada = false
		while(posicaoValidada == false) do
			x = math.random(config["inicial"]["x"], config["final"]["x"])
			y = math.random(config["inicial"]["y"], config["final"]["y"])
			z = config["z"][math.random(1, table.getn(config["z"]))]
			stringPosicao = x .. "-" .. y .. "-" .. z
			if not isInArray(posicoesVerificadas, stringPosicao) then
				posicaoValidada = true
			end
		end
		posicao = {x = x, y = y, z = z}
		if not isInArray(posicoesGeradas, stringPosicao) then
			tile = Tile(posicao)
			local ground = tile:getGround()
			if(ground ~= nil and isInArray(config["chao"]["ids"], ground:getId())) then
				local itens = tile:getItems()
				if itens then
					if(isWalkable(posicao)) then
						tabelaEfeito = "chao"
					elseif(table.getn(itens) == 1) then
						if(isInArray(config["paredeHorizontal"]["ids"], itens[1]:getId())) then
							tabelaEfeito = "paredeHorizontal"
						elseif(isInArray(config["paredeVertical"]["ids"], itens[1]:getId())) then
							tabelaEfeito = "paredeVertical"
						end
					elseif(table.getn(itens) == 2) then
						if(isInArray(config["espelhoHorizontal"]["ids"], itens[1]:getId()) or
						isInArray(config["espelhoHorizontal"]["ids"], itens[2]:getId())) then
							tabelaEfeito = "espelhoHorizontal"
						elseif(isInArray(config["espelhoVertical"]["ids"], itens[1]:getId()) or
						isInArray(config["espelhoVertical"]["ids"], itens[2]:getId())) then
							tabelaEfeito = "espelhoVertical"
						end
					end
				end
			end	
			if(tabelaEfeito ~= 0) then
				local efeitos = config[tabelaEfeito]["efeitos"]
				if(table.getn(efeitos) == 1) then
					idEfeito = 1
				else
					idEfeito = math.random(1, table.getn(efeitos))
				end
				efeito = config[tabelaEfeito]["efeitos"][idEfeito]
				doSendMagicEffect(posicao, efeito)
				table.insert(posicoesGeradas, stringPosicao)
			end
			table.insert(posicoesVerificadas, stringPosicao)
		end
	end
	return true
end