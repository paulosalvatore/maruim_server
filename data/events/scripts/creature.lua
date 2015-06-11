function Creature:onChangeOutfit(outfit)
	return true
end

function Creature:onAreaCombat(tile, isAggressive)
	local target = tile:getTopVisibleCreature()
	if target and target:isPlayer() and target:verificarMasmorra() > 0 then
		return RETURNVALUE_NOTPOSSIBLE
	end
	return RETURNVALUE_NOERROR
end

function Creature:onTargetCombat(target)
	if target:isPlayer() and target:verificarMasmorra() > 0 then
		target:sendCancelMessage(configMasmorras.mensagens.pvpBloqueado)
		return false
	end
	return true
end
