function onKill(player, target)
	if isPlayer(target) or isSummon(target) or isNpc(target) then 
		return true 
	end
	local task = target:checarTask()
	if task == 0 then
		return true
	end
	local statusTask = player:verificarStatusTask(task)
	if statusTask == configTasks.valorIniciada then
		player:adicionarProgressoTask(task)
	end
end