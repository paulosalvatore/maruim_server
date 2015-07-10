function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local chanceFalha = 50
	local items = {
		[5466] = {transformar = 5465},
		[1485] = {transformar = 1484, duracao = 600, decairPara = {{1483, 1}, {1482, 1}, {1481, 1}, {1485, 1}}},
		[7538] = {transformar = 7544},
		[7539] = {transformar = 7545},
		[13757] = {transformar = 21585},
		[5880] = {transformar = 18427}
	}
	local targetId = target.itemid
	if(items[targetId]) then
		if(math.random(100) > chanceFalha) then
			doSendMagicEffect(target:getPosition(), CONST_ME_HITBYFIRE)
			target:transform(items[targetId].transformar)
			target:decay()
			local duracao = items[targetId].duracao
			local decairPara = items[targetId].decairPara
			if duracao ~= nil then
				addEvent(function(targetId, toPosition, decairPara)
					local target = Tile(toPosition):getItemById(targetId)
					if target then
						if decairPara ~= nil then
							for a, b in pairs(decairPara) do
								local transformar = b[1]
								local tempo = a*b[2]*1000
								addEvent(function(targetId, toPosition, transformar)
									local target = Tile(toPosition):getItemById(targetId)
									if target then
										target:transform(transformar)
									end
								end, tempo, targetId, toPosition, transformar)
								targetId = transformar
							end
						else
							target:transform(targetId)
						end
					end
				end, duracao*1000, items[targetId].transformar, toPosition, decairPara)
			end
		else
			item:remove()
			doTargetCombatHealth(0, player, COMBAT_FORMULA_DAMAGE, -5, -5, CONST_ME_FIREAREA)
		end
		return true
	end
	return destroyItem(player, target, toPosition)
end