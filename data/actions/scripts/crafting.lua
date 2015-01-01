local function verificiarMesaTrabalho(table, value)
	for a,b in pairs(table) do
		for c,d in pairs(b) do
			if((c == "mesaTrabalho") and (type(d) == "table")) then
				if(isInArray(d, value)) then
					return a
				end
			end
		end
	end
	return 0
end
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local oven = {1787, 1789, 1791, 1793}
	local livros = {2347, 10006, 12497}
	if isInArray(oven, item.itemid) then
		local c = 0
		for i = 1, #livros do
			if(player:getItemCount(livros[i]) > 0) then
				c = c + 1
			end
		end
		if c == 0 then
			Item(item.uid):transform(item.itemid-1, 1)
			return true
		end
	end
	local profissaoId = verificiarMesaTrabalho(profissoes, item.itemid)
	if(profissaoId > 0) then
		if getCreatureCondition(player, CONDITION_SPELLCOOLDOWN, 160) then
			return player:sendCancelMessage("Você está ocupado.")
		end
		local profissao = profissoes[profissaoId]
		profissao.extraData[player:getId()] = {mesaTrabalho = Item(item.uid)}
		local modal = player:getProfissaoModalPrincipal(profissaoId)
		if modal then
			modal:sendToPlayer(player)
			player:registerEvent("Crafting")
		end
		return true
	end
	return false
end