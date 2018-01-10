--[[mytable = {} --普通表
mymetatable = {} --元表
setmetatable(mytable,mymetatable) --把mymetatable 设为mytable 的元表
--]]
--等价于
--[[mytable = setmetatable({},{})
getmetatable(mytable)
]]--

--fail 
--[[
other = {foo = 3}
t = setmetatable({},{__index = other})
t.foo
--]]

mytable = setmetatable({key1 = "value1"}, {
	__index = function(mytable, key)
		if key == "key2" then
			return "metatablevalue"
		else
			return nil
		end
	end
})

print(mytable.key1,mytable.key2)


--[[实例解析：

mytable 表赋值为 {key1 = "value1"}。

mytable 设置了元表，元方法为 __index。

在mytable表中查找 key1，如果找到，返回该元素，找不到则继续。

在mytable表中查找 key2，如果找到，返回 metatablevalue，找不到则继续。

判断元表有没有__index方法，如果__index方法是一个函数，则调用该函数。

元方法中查看是否传入 "key2" 键的参数（mytable.key2已设置），如果传入 "key2" 参数返回 "metatablevalue"，否则返回 mytable 对应的键值。--]]

--代码简写成
youtable = setmetatable({key1 = "value1"},{__index = {key2 = "metatablevalue"}})
print(youtable.key1,youtable.key2)

mymetatable = {}
mytable = setmetatable({key1 = "value1"},{__newindex = mymetatable})

print(mytable.key1)

mytable.newkey = "新值2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)

mytable = setmetatable({key1 = "value1"},{
	__newindex = function(mytable,key,value)
		rawset(mytable,key,"\""..value.."\"")
	end
	})
mytable.key1 = "new value"
mytable.key2 = 4

print(mytable.key1,mytable.key2)

--计算表中的最大值,table.maxn在lua5.2以上版本中已无法使用
--自定义计算表中最大键值函数 table_maxn,即计算标的元素个数
function table_maxn(t)
	local mn = 0
	for k,v in pairs(t) do
		if mn < k then
			mn = k
		end
	end
	return mn
end

--俩表相加操作
mytable = setmetatable({1,2,3},{
	__add = function(mytable,newtable)
	for i = 1, table_maxn(newtable) do
		table.insert(mytable,table_maxn(mytable)+1,newtable[i])
	end
	return mytable
	end
})
secondtable = {4,5,6}
mytable = mytable +secondtable
	for k,v in ipairs(mytable) do
		print(k,v)
	end

-- 定义方法__call
mytable = setmetatable({10},{
	__call = function(mytable, newtable)
		sum = 0
		for i = 1,table_maxn(mytable) do 
			sum = sum + mytable[i]
		end
		for i = 1,table_maxn(newtable) do
			sum = sum + newtable[i]
		end
		return sum
	end
	})
newtable = {10,20,30}
print(mytable(newtable))

--- __tostring元方法是修改表的输出行为
mytable = setmetatable({10,20,30},{
	__tostring = function(mytable)
		sum = 0
		for k,v in pairs(mytable) do
			sum = sum + v
		end
		return "表中所有元素的和为"..sum
	end
	})
print(mytable)