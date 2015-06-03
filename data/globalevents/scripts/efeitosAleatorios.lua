function onThink(cid, interval, lastExecution)
	local config = {
		["inicial"] = {x = 732, y = 1529},
		["final"] = {x = 777, y = 1584},
		["z"] = {7, 6, 5},
		["chao"] = {
			["efeitos"] = {CONST_ME_YALAHARIGHOST, CONST_ME_BATS},
			["ids"] = {406, 407, 431, 457, 420}
		},
		["parede_horizontal"] = {
			["efeitos"] = {CONST_ME_SKULLHORIZONTAL},
			["ids"] = {9119, 9121, 9127, 9135, 9136, 9137, 9138, 9139, 9143}
		},
		["parede_vertical"] = {
			["efeitos"] = {CONST_ME_SKULLVERTICAL},
			["ids"] = {9118, 9293, 9125, 9129, 9130, 9131, 9132, 9133, 9142}
		},
		["espelho_horizontal"] = {
			["efeitos"] = {CONST_ME_MIRRORHORIZONTAL},
			["ids"] = {9583}
		},
		["espelho_vertical"] = {
			["efeitos"] = {CONST_ME_MIRRORVERTICAL},
			["ids"] = {9605}
		}
	}
	local posicoes_geradas = {}
	local posicoes_verificadas = {}
	while(table.getn(posicoes_verificadas) < 1) do
		tabela_efeito = 0
		posicao_validada = 0
		while(posicao_validada < 1) do
			x = math.random(config["inicial"]["x"], config["final"]["x"])
			y = math.random(config["inicial"]["y"], config["final"]["y"])
			z = config["z"][math.random(1, table.getn(config["z"]))]
			string_posicao = x.."-"..y.."-"..z
			if not isInArray(posicoes_verificadas, string_posicao) then
				posicao_validada = 1
			end
		end
		posicao = {x = x, y = y, z = z}
		if not isInArray(posicoes_geradas, string_posicao) then
			tile = Tile(posicao)
			local ground = tile:getGround()
			if(ground ~= nil and isInArray(config["chao"]["ids"], ground:getId())) then
				local items = tile:getItems()
				if items then
					if(isWalkable(posicao)) then
						tabela_efeito = "chao"
					elseif(table.getn(items) == 1) then
						if(isInArray(config["parede_horizontal"]["ids"], items[1]:getId())) then
							tabela_efeito = "parede_horizontal"
						elseif(isInArray(config["parede_vertical"]["ids"], items[1]:getId())) then
							tabela_efeito = "parede_vertical"
						end
					elseif(table.getn(items) == 2) then
						if(isInArray(config["espelho_horizontal"]["ids"], items[1]:getId()) or
						isInArray(config["espelho_horizontal"]["ids"], items[2]:getId())) then
							tabela_efeito = "espelho_horizontal"
						elseif(isInArray(config["espelho_vertical"]["ids"], items[1]:getId()) or
						isInArray(config["espelho_vertical"]["ids"], items[2]:getId())) then
							tabela_efeito = "espelho_vertical"
						end
					end
				end
			end	
			if(tabela_efeito ~= 0) then
				local efeitos = config[tabela_efeito]["efeitos"]
				if(table.getn(efeitos) == 1) then
					id_efeito = 1
				else
					id_efeito = math.random(1, table.getn(efeitos))
				end
				efeito = config[tabela_efeito]["efeitos"][id_efeito]
				doSendMagicEffect(posicao, efeito)
				table.insert(posicoes_geradas, string_posicao)
			end
			table.insert(posicoes_verificadas, string_posicao)
		end
	end
	return true
end