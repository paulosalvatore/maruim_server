function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item:getId() == 16016 and target:getId() == 16017) then
		item:transform(target:getId()+2)
	elseif(item:getId() == 16018 and (target:getId() == 16020 or target:getId() == 16021)) then
		target:transform(target:getId()+2)
		item:remove()
	elseif(item:getId() == 16019 and (target:getId() == 16022 or target:getId() == 16023)) then
		local chance = math.random(0, 100)
		local value = math.random(1, 4)
		if(chance < 70) then
			value = math.random(1, 2)
		end
		item:transform(item:getId()-3)
		target:transform(target:getId()+value*2)
	else
		return false
	end
	return true
end