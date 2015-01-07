function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local failChance = 20
	local items = {
		[5466] = {transformar = 5465},
		[1485] = {transformar = 1484, duracao = 600, decairPara = {{1483, 2}, {1482, 2}, {1481, 2}}},
		[7538] = {transformar = 7544},
		[7539] = {transformar = 7545},
		[13757] = {transformar = 21585},
		[5880] = {transformar = 18427}
	}
	local itemExId = itemEx.itemid
	if(items[itemExId]) then
		if(math.random(100) > failChance) then
			doSendMagicEffect(itemEx:getPosition(), CONST_ME_HITBYFIRE)
			itemEx:transform(items[itemExId].transformar)
			itemEx:decay()
			local duracao = items[itemExId].duracao
			local decairPara = items[itemExId].decairPara
			if duracao ~= nil then
				addEvent(function(itemEx, itemExId, decairPara)
					if itemEx:getUniqueId() > 0 then
						if decairPara ~= nil then
							for a, b in pairs(decairPara) do
								local transformar = 0
								local tempo = a*b[2]*1000
								if a < #decairPara then
									transformar = b[1]
								else
									transformar = itemExId
								end
								addEvent(function(itemEx, transformar)
									if itemEx:getUniqueId() > 0 then
										itemEx:transform(transformar)
									end
								end, tempo, itemEx, transformar)
							end
						else
							itemEx:transform(itemExId)
						end
					end
				end, duracao*1000, itemEx, itemExId, decairPara)
			end
		else
			item:remove()
			doTargetCombatHealth(0, player, COMBAT_FORMULA_DAMAGE, -5, -5, CONST_ME_FIREAREA)
		end
		return true
	end
	return destroyItem(player, itemEx, toPosition)
end