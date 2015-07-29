function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target:getId() ~= 1 or target.type ~= THING_TYPE_PLAYER then
		return false
	end
	if configProfissoes.pocoes[item.itemid] then
		if getCreatureCondition(player, CONDITION_ATTRIBUTES, configProfissoes.pocaoCD) then
			return player:sendCancelMessage("Você deve esperar para poder beber essa poção.")
		end
		local pocaoCD = Condition(CONDITION_ATTRIBUTES)
		pocaoCD:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
		pocaoCD:setParameter(CONDITION_PARAM_SUBID, configProfissoes.pocaoCD)
		pocaoCD:setParameter(CONDITION_PARAM_TICKS, configProfissoes.pocoes[item.itemid].duracao*1000)
		player:addCondition(pocaoCD)
		player:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		local pocaoChanceAdicional = string.gsub(item:getName():match("chance adicional: (.-)]"), "%%", "")
		if pocaoChanceAdicional == nil then
			pocaoChanceAdicional = 0
		end
		local pocaoProfissao = verificiarProfissaoPorNome(item:getName():match("profissão: (.-)]"))
		if pocaoProfissao == 0 then
			pocaoProfissao = 1
		end
		player:setStorageValue(configProfissoes.pocaoChanceStorage, pocaoChanceAdicional)
		player:setStorageValue(configProfissoes.pocaoProfissaoStorage, pocaoProfissao)
		item:remove(1)
		player:addItem(item.itemid-1, 1)
		return true
	end
	return false
end