-- 泛型for迭代器
--[[ 
三个数值:迭代函数,状态常量,控制变量
for k,v in pairs(t) do
	print(k,v)
end
--]]

array = {"Lua","Tutorial"}

for key,value in ipairs(array) do
	print(key,value)
end

--迭代函数
--实现数字n的平方
function square(iteratorMaxCount,currentNumber)
	if currentNumber < iteratorMaxCount then
		currentNumber = currentNumber +1;
		return currentNumber, currentNumber*currentNumber
	end
end

for i,n in square,3,0 do 
	print(i,n)
end

--[[
function iter(a,i)
	i = i + 1
	local v = a[i]
	if v then
		return i,v
	end
end

function ipairs(a)
	return iter,a,0
end
--]]

array = {"Lua","Tutorial"}

function elementIterator(collection)
	local index = 0
	local count = #collection
	return function()
	index = index + 1
	
	if index <= count then 
		return collection[index]
	end
end
end

for element in elementIterator(array) do 
	print(element)
end