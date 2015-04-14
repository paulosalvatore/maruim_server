local conditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_PARALYZE, CONDITION_DRUNK, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED, CONDITION_BLEEDING}
local outfit = {lookType = 267, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
function onStepIn(player, item, position, fromPosition)
	if not player then
		return false
	end
	if(player:getOutfit().lookType ~= outfit.lookType) then
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
		doSetCreatureOutfit(player, outfit, -1)
	end
	for i, v in ipairs(conditions) do
		if(getCreatureCondition(player, v) == TRUE) then
			doRemoveCondition(player, v)
		end
	end
end
function onStepOut(player, item, position, fromPosition)
	if not player then
		return false
	end
	local ground_id = player:getPosition():getTile():getGround():getId()
	if((ground_id < 4620) or (ground_id > 4625)) then
		player:removeCondition(CONDITION_OUTFIT)
	end
end
