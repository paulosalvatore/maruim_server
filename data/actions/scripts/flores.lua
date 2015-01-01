function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
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
	local plantas_regar = {
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
	local plantas_imortais = {
		[7689] = 15445,
		[7691] = 15446,
		[7693] = 15448,
		[7695] = 15447,
		[9989] = 15449,
		[9991] = 15450
	}
	if(item.itemid == 7734) then
		if(itemEx.itemid == 7665) then
			iEx = Item(itemEx.uid)
			iEx:transform(7678)
			iEx:decay()
			doSendMagicEffect(iEx:getPosition(), CONST_ME_BLOCKHIT)
			return true
		elseif(itemEx.itemid == 7670) then
			local valor = math.random(0, 5)
			local planta = plantas[valor]
			iEx = Item(itemEx.uid)
			iEx:transform(planta)
			iEx:decay()
			doSendMagicEffect(iEx:getPosition(), CONST_ME_BLOCKHIT)
			return true
		elseif(isInArray(plantas, itemEx.itemid) or itemEx.itemid == 7678) then
			player:sendTextMessage(MESSAGE_EVENT_ORANGE, "Essa planta não precisa de água.")
			return true
		elseif(plantas_regar[itemEx.itemid]) then
			iEx = Item(itemEx.uid)
			iEx:transform(plantas_regar[itemEx.itemid])
			iEx:decay()
			doSendMagicEffect(iEx:getPosition(), CONST_ME_BLOCKHIT)
			return true
		else
			return false
		end
	elseif(item.itemid == 15271) then
		if(itemEx.itemid == 7679) then
			Item(item.uid):remove(1)
			iEx = Item(itemEx.uid)
			iEx:transform(15443)
			iEx:decay()
			doSendMagicEffect(iEx:getPosition(), CONST_ME_BLOCKHIT)
			return true
		elseif(plantas_imortais[itemEx.itemid]) then
			Item(item.uid):remove(1)
			iEx = Item(itemEx.uid)
			iEx:transform(plantas_imortais[itemEx.itemid])
			iEx:decay()
			doSendMagicEffect(iEx:getPosition(), CONST_ME_BLOCKHIT)
			return true
		else
			return false
		end
	elseif(item.itemid == 15269) then
		local chance = math.random(0, 100)
		if(chance < 20) then
			player:addItem(15271, 1)
		end
		local it = Item(item.uid)
		it:transform(15270)
		it:decay()
		doSendMagicEffect(it:getPosition(), CONST_ME_BLOCKHIT)
		return true
	else
		return false
	end
end