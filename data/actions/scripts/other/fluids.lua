local drunk = Condition(CONDITION_DRUNK)
drunk:setParameter(CONDITION_PARAM_TICKS, 60000)

local poison = Condition(CONDITION_POISON)
poison:setParameter(CONDITION_PARAM_DELAYED, true)
poison:setParameter(CONDITION_PARAM_MINVALUE, -50)
poison:setParameter(CONDITION_PARAM_MAXVALUE, -120)
poison:setParameter(CONDITION_PARAM_STARTVALUE, -5)
poison:setParameter(CONDITION_PARAM_TICKINTERVAL, 4000)
poison:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetItemType = ItemType(target.itemid)
	if targetItemType and targetItemType:isFluidContainer() then
		if target.type == 0 and item.type ~= 0 then
			target:transform(target.itemid, item.type)
			item:transform(item.itemid, 0)
			return true
		elseif target.type ~= 0 and item.type == 0 then
			target:transform(target.itemid, 0)
			item:transform(item.itemid, target.type)
			return true
		end
	end

	if target:isCreature() then
		if item.type == 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "It is empty.")
		elseif target.uid == player:getId() then
			if item.type == 3 or item.type == 15 then
				player:addCondition(drunk)
			elseif item.type == 4 then
				player:addCondition(poison)
			elseif item.type == 7 then
				player:addMana(math.random(50, 150))
				fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			elseif item.type == 10 then
				player:addHealth(60)
				fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
			if fluids[item.type] ~= nil then
				player:say(fluids[item.type].message, TALKTYPE_MONSTER_SAY)
			else
				player:say("Gulp.", TALKTYPE_MONSTER_SAY)
			end
			item:transform(item.itemid, 0)
		else
			Game.createItem(2016, item.type, toPosition):decay()
			item:transform(item.itemid, 0)
		end
	else
		local fluidSource = targetItemType and targetItemType:getFluidSource() or 0
		if fluidSource ~= 0 then
			item:transform(item.itemid, fluidSource)
		elseif item.type == 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "It is empty.")
		else
			if toPosition.x == CONTAINER_POSITION then
				toPosition = player:getPosition()
			end
			Game.createItem(2016, item.type, toPosition):decay()
			item:transform(item.itemid, 0)
		end
	end
	return true
end
