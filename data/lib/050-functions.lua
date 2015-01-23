function capAll(str)
	local strLimpa = str
	local b = string.gmatch(str, "(.*) %[")
	for a in b do
		b = string.gmatch(a, "(.*) %[")
		strLimpa = a
	end
	for a in b do
		strLimpa = a
	end
	local novaStr = ""; palavraSeparada = string.gmatch(strLimpa, "([^%s]+)")
	for v in palavraSeparada do
		v = v:gsub("^%l", string.upper)
		if novaStr ~= "" then
			novaStr = novaStr.." "..v
		else
			novaStr = v
		end
	end
	local formatar = {
		{"Of", "of"}
	}
	for a, b in pairs(formatar) do
		novaStr = novaStr:gsub(b[1], b[2])
	end
	novaStr = str:gsub(strLimpa, novaStr)
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
function getKeysSortedByValue(tbl, sortFunction)
	local keys = {}
	for key in pairs(tbl) do
		table.insert(keys, key)
	end
	table.sort(keys, function(a, b)
		return sortFunction(tbl[a], tbl[b])
	end)
	return keys
end
function getFluidNameByType(type)
	if fluids[type] ~= nil then
		return fluids[type].name
	end
	return nil
end