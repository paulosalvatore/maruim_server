function capAll(str)
	local novaStr = ""; palavraSeparada = string.gmatch(str, "([^%s]+)")
	for v in palavraSeparada do
		v = v:gsub("^%l", string.upper)
		if novaStr ~= "" then
			novaStr = novaStr.." "..v
		else
			novaStr = v
		end
	end
	novaStr = novaStr:gsub("Of", "of")
	return novaStr
end
function formatarValor(valor)
	local decimal = string.sub(tostring(valor),-2)
	while string.sub(tostring(decimal),-1) == "0" do
		decimal = string.sub(tostring(decimal),-2,string.len(tostring(decimal))-1)
	end
	if decimal ~= "" then
		decimal = "."..decimal
	end
	return math.floor(valor/100)..decimal
end
function searchArrayKey(t, value)
	for k,v in pairs(t) do
		if v == value then
			return k
		end
	end
	return nil
end
function getFluidNameByType(type)
	if fluids[type] ~= nil then
		return fluids[type].name
	end
	return nil
end