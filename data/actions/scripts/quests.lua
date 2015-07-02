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
		[2700] = {
			recompensa = {{2465, 1}, {2478, 1}},
			container = 21475
		},
		[2800] = {
			recompensa = {{2152, 5}, {8860, 1}}
		},
		[7000] = {
			recompensa = {{2464, 1}, {2648, 1}}
		}
	},
	containerPadrao = 1987
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if (item.actionid ~= nil and config["action"][item.actionid]) or item.uid ~= nil or (item.uid ~= nil and config["unique"][item.uid]) then
		local i
		local storage
		if config["action"][item.actionid] then
			i = config["action"][item.actionid]
			storage = item.actionid
		elseif config["unique"][item.uid] then
			i = config["unique"][item.uid]
			storage = item.uid
		elseif item.uid ~= nil then
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
			local pesoTotalItens = 0
			for a, b in pairs(i.recompensa) do
				pesoTotalItens = pesoTotalItens + ItemType(b[1]):getWeight()
			end
			if player:getFreeCapacity() >= pesoTotalItens then
				local adicionarItem = player
				local exibirNome
				local container = config.containerPadrao
				if i.container then
					container = i.container
				end
				if #i.recompensa > 1 then
					adicionarItem = adicionarItem:addItem(container, 1)
					exibirNome = ItemType(container):getName()
				elseif #i.recompensa == 1 then
					exibirNome = ItemType(i.recompensa[1][1]):getName()
				end
				for a, b in pairs(i.recompensa) do
					adicionarItem:addItem(b[1], b[2])
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� encontrou o item '" .. exibirNome .. "'.")
				local adicionarValor = 1
				if i.adicionarValor then
					adicionarValor = i.adicionarValor
				end
				player:setStorageValue(storage, adicionarValor)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� encontrou o item '" .. exibirNome .. "' que pesa " .. pesoTotalItens .. " oz. � muito peso para voc� carregar.")
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Est� vazio.")
		end
		return true
	end
end