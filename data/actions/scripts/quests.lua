local config = {
	-- ["action" ou "unique"] = {
		-- [action_id ou unique_id] = {
			-- recompensa = {{id, quantidade}},
			-- storage = valor do storage (informar apenas se for diferente da action_id ou unique_id),
			-- checarValor = valor (informar apenas se for diferente de -1),
			-- adicionarValor = valor (informar apenas se for diferente de 1),
			-- container = item_id (informar apenas se tiver mais de uma recompensa e o container for diferente do valor informado no containerPadrao)
		-- },
	-- }
	["action"] = {
	},
	["unique"] = {
		[2600] = {
			recompensaVocacao = {
				{{7735, 1}, {8819, 1}}, -- Sorcerer
				{{7735, 1}, {8819, 1}}, -- Druid
				{{12407, 1}, {2660, 1}}, -- Paladin
				{{2350, 1}, {2509, 1}} -- Knight
			}
		},
		[2700] = {
			recompensa = {{2465, 1}, {2478, 1}},
			container = 21475
		},
		[2800] = {
			recompensa = {{2152, 5}, {8860, 1}}
		},
		[12430] = {
			recompensa = {{12430, 1}}
		}
	},
	containerPadrao = 1987
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (item.actionid ~= nil and config["action"][item.actionid]) or item.uid <= 65535 or (item.uid <= 65535 and config["unique"][item.uid]) then
		local i
		local storage
		if config["action"][item.actionid] then
			i = config["action"][item.actionid]
			storage = item.actionid
		elseif item.uid <= 65535 and config["unique"][item.uid] then
			i = config["unique"][item.uid]
			storage = item.uid
		elseif item.uid <= 65535 then
			i = {recompensa = {{item.uid, 1}}}
			storage = item.uid
		end
		if i.storage then
			storage = i.storage
		end
		local checarValor = -1
		if i.checarValor then
			checarValor = i.checarValor
		end
		if player:getStorageValue(storage) == checarValor then
			if i.recompensaVocacao ~= nil then
				local vocacao = player:getVocation():getId()
				if isInArray(Vocacoes.sorcerer, vocacao) then
					i.recompensa = i.recompensaVocacao[1]
				elseif isInArray(Vocacoes.druid, vocacao) then
					i.recompensa = i.recompensaVocacao[2]
				elseif isInArray(Vocacoes.paladin, vocacao) then
					i.recompensa = i.recompensaVocacao[3]
				elseif isInArray(Vocacoes.knight, vocacao) then
					i.recompensa = i.recompensaVocacao[4]
				end
			end
			local pesoTotalItens = 0
			for a, b in pairs(i.recompensa) do
				pesoTotalItens = pesoTotalItens + ItemType(b[1]):getWeight()
			end
			local exibirNome
			local container = config.containerPadrao
			if i.container then
				container = i.container
			end
			if #i.recompensa > 1 then
				exibirNome = ItemType(container):getName()
			elseif #i.recompensa == 1 then
				exibirNome = ItemType(i.recompensa[1][1]):getName()
			end
			if player:getFreeCapacity() >= pesoTotalItens then
				local adicionarItem = player
				if #i.recompensa > 1 then
					adicionarItem = adicionarItem:addItem(container, 1)
				end
				for a, b in pairs(i.recompensa) do
					adicionarItem:addItem(b[1], b[2])
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Você encontrou o item '" .. exibirNome .. "'.")
				local adicionarValor = 1
				if i.adicionarValor then
					adicionarValor = i.adicionarValor
				end
				player:setStorageValue(storage, adicionarValor)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Você encontrou o item '" .. exibirNome .. "' que pesa " .. pesoTotalItens .. " oz. É muito peso para você carregar.")
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Está vazio.")
		end
		return true
	end
end