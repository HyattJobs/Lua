function average(...)
	result = 0
	local  arg = {...}
	for i,v in ipairs(arg) do
		result = result +v
	end
	print("总共传入"..#arg.."个数")
	return result/#arg
end

print("平均值",average(10,2,3,5))