function Party:onJoin(player)
	return true
end

function Party:onLeave(player)
	return true
end

function Party:onDisband()
	self:alterarOuroMonstroCompartilhado(0, true)
	return true
end
