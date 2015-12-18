quests = {
	-- ["action" ou "unique"] = {
		-- [action_id ou unique_id] = {
			-- recompensa = {{id, quantidade}},
			-- recompensaVocacao = {{{id, quantidade}} -- Uma para cada vocação},
			-- recompensaVocacao = {
				-- {{id, quantidade}}, -- Sorcerer
				-- {{id, quantidade}}, -- Druid
				-- {{id, quantidade}}, -- Paladin
				-- {{id, quantidade}}, -- Knight
			-- }
			-- recompensaOpcional = {
				-- {{id, quantidade}} -- Uma para cada opção
			-- },
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
				{{7618, 6}, {7620, 14}}, -- Sorcerer
				{{7618, 6}, {7620, 14}}, -- Druid
				{{7618, 10}, {7620, 10}}, -- Paladin
				{{7618, 14}, {7620, 6}} -- Knight
			}
		},
		[2700] = {
			recompensa = {{2465, 1}, {2478, 1}, {8704, 5}},
			container = 21475
		},
		[2800] = {
			recompensa = {{2152, 5}, {8860, 1}}
		},
		[8800] = {
			recompensa = {{2458, 1}, {2464, 1}, {8704, 3}}
		},
		[8801] = {
			recompensa = {{2482, 1}, {2526, 1}, {2148, 40}}
		},
		[8802] = {
			recompensa = {{2172, 1}, {5878, 1}}
		},
		[8803] = {
			recompensa = {{2648, 1}, {8704, 3}, {2169, 1}}
		},
		[8804] = {
			recompensa = {{2484, 1}, {2148, 50}}
		},
		[8805] = {
			recompensa = {{2468, 1}, {8704, 2}}
		},
		[8806] = {
			recompensa = {{2473, 1}, {2148, 50}, {8704, 4}}
		},
		[8807] = {
			container = 1996,
			recompensa = {{2511, 1}, {12437, 10}}
		},
		[8808] = {
			recompensa = {{12441, 15}, {2148, 30}, {8704, 2}}
		},
		[8809] = {
			recompensa = {{2643, 1}, {2512, 1}, {8704, 2}, {2148, 20}}
		},
		[8810] = {
			recompensa = {{8704, 5}, {2152, 1}, {2287, 30}}
		},
		[12430] = {
			recompensa = {{12430, 1}}
		}
	},
	containerPadrao = 1987
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local quest
	local storage

	if quests["action"][item.actionid] then
		quest = quests["action"][item.actionid]
		storage = item.actionid
	elseif item.uid <= 65535 and quests["unique"][item.uid] then
		quest = quests["unique"][item.uid]
		storage = item.uid
	elseif item.uid <= 65535 then
		quest = {recompensa = {{item.uid, 1}}}
		storage = item.uid
	else
		return false
	end

	if quest.recompensaOpcional then
		local modalTitulo = "Selecione uma Recompensa"
		local modalMensagem = "Você pode escolher uma das recompensas abaixo para recebê-la.\n\n"
		modalMensagem = modalMensagem .. "Qual você deseja obter?\n"
		local modal = ModalWindow(modalQuest+quest.modalId, modalTitulo, modalMensagem)
		for a, b in pairs(quest.recompensaOpcional) do
			modal:addChoice(a, exibirRecompensa(b, container))
		end
		modal:addButton(1, "Escolher")
		modal:setDefaultEnterButton(1)
		modal:addButton(2, "Sair")
		modal:setDefaultEscapeButton(2)
		modal:sendToPlayer(player)
		player:registerEvent("Quests")
		return true
	end

	if quest.storage then
		storage = quest.storage
	end

	player:receberQuest(quest, storage)

	return true
end