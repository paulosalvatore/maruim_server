function onLogin(player)
	if player:getName() == "Aman" then
		player:enviarModalTutorial(0)
	end
	return true
end

function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if modalWindowId == tutorialId then
		if choiceId == 1 then
			player:iniciarTutorial()
		else
			player:pularTutorial()
		end
	end
end
