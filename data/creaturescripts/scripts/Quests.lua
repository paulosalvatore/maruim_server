function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if	not (modalWindowId >= modalQuest and
		modalWindowId <= modalQuestMaximo) or
		buttonId == 2 then
		return false
	elseif modalWindowId >= modalQuest and modalWindowId <= modalQuestMaximo then
		local quest, storage
		for a, b in pairs(quests) do
			if type(b) == "table" then
				for c, d in pairs(b) do
					if d.modalId and modalWindowId == modalQuest+d.modalId then
						quest = d
						storage = c
						if d.storage then
							storage = d.storage
						end
					end
				end
			end
		end

		if not quest then
			return false
		end

		player:receberQuest(quest, storage, choiceId)
	end
end