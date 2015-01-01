local condition = createConditionObject(CONDITION_ENERGY)
addDamageCondition(condition, 8, 8000, -35)
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid == 9802 then
		local chance = math.random(1, 100)
		if chance <= 15 then
			player:addItem(10151, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, '"You have salvaged a golem part."')
			toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
		elseif chance <= 35 then
			doSummonCreature("Rat", fromPosition)
			player:sendTextMessage(MESSAGE_INFO_DESCR, '"Something was stuck in the golem."')
		elseif chance <= 55 then
			player:addCondition(condition)
			player:sendTextMessage(MESSAGE_INFO_DESCR, '"What an eletrifying experience!"')
			toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
		elseif chance <= 75 then
			player:addItem(8309, math.random(1, 8))
			player:sendTextMessage(MESSAGE_INFO_DESCR, '"You salvaged some scrap metal!"')
			toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, '"You ruined the golem remains."')
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
		Item(itemEx.uid):transform(itemEx.itemid+1)
		Item(itemEx.uid):decay()
		return true
	end
	return false
end