function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local plantas = {
		7681,
		7683,
		7685,
		7687,
		9983,
		9987,
		7689,
		7691,
		7693,
		7695,
		9991,
		9989,
		15443
	}

	local plantasRegar = {
		[7674] = 7681,
		[7675] = 7683,
		[7676] = 7685,
		[7677] = 7687,
		[9984] = 7683,
		[9985] = 7687,
		[15444] = 15443,
		[7680] = 7689,
		[7682] = 7691,
		[7684] = 7693,
		[7686] = 7695,
		[9982] = 9991,
		[9986] = 9989,
		[7688] = 7689,
		[7690] = 7691,
		[7692] = 7693,
		[7694] = 7695,
		[9988] = 9989,
		[9990] = 9991,
		[15442] = 15441
	}

	local plantasImortais = {
		[7689] = 15445,
		[7691] = 15446,
		[7693] = 15448,
		[7695] = 15447,
		[9989] = 15449,
		[9991] = 15450
	}

	if item:getId() == 7734 then
		if target:getId() == 7665 then
			target:transform(7678)
			target:decay()
			target:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
		elseif target:getId() == 7670 then
			local valor = math.random(0, 5)
			local planta = plantas[valor]
			target:transform(planta)
			target:decay()
			target:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
		elseif isInArray(plantas, target:getId()) or target:getId() == 7678 then
			player:sendTextMessage(MESSAGE_EVENT_ORANGE, "Essa planta não precisa de água.")
		elseif plantasRegar[target:getId()] then
			target:transform(plantasRegar[target:getId()])
			target:decay()
			target:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
		else
			return false
		end
		return true
	elseif item:getId() == 15271 then
		if target:getId() == 7679 then
			item:remove(1)
			target:transform(15443)
			target:decay()
			target:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
		elseif plantasImortais[target:getId()] then
			item:remove(1)
			target:transform(plantasImortais[target:getId()])
			target:decay()
			target:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
		else
			return false
		end
		return true
	elseif item:getId() == 15269 then
		local chance = math.random(0, 100)
		if chance < 20 then
			player:addItem(15271, 1)
		end
		item:transform(15270)
		item:decay()
		item:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
		return true
	end
	return false
end