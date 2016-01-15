function onSay(player, words, param)

	local quantidade = (param == "tudo" and player:pegarOuroMonstros()) or tonumber(param)

	if quantidade ~= nil and quantidade > 0 then
		local ouroMonstros = player:pegarOuroMonstros()

		if ouroMonstros < quantidade then
			player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Você não possui quantidade suficiente disponível em sua conta especial.")
		else
			player:removerOuroMonstros(quantidade)
			player:addMoney(quantidade)
			player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Aqui está! O balanço de sua conta especial é " .. ouroMonstros - quantidade .. " gold coin" .. formatarPlural(ouroMonstros - quantidade) .. ".")
		end
	end
	return false
end
