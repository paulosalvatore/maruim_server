function onStepIn(creature, item, position, fromPosition)
	local mensagem = nil
	if creature:isPlayer() then
		if creature:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
			mensagem = "Você está em batalha."
		elseif item.itemid == 20227 or item.itemid == 23425 then
			if Tile(position):getItemById(20218) ~= nil or Tile(position):getItemById(23432) ~= nil then
				return true
			end
			mensagem = "Desculpe, não é possível."
		end
		if creature:isPlayer() and mensagem then
			creature:sendCancelMessage(mensagem)
		end
	end
	creature:teleportTo(fromPosition)
	return true
end
