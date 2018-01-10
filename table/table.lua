--[[-- 初始化表
mytable = {}

-- 指定值
mytable[1]= "Lua"

-- 移除引用
mytable = nil
-- lua 垃圾回收会释放内存
--]]

--简单的table
print("lua")
mytable = {}
print("mytable 的类型是 ",type(mytable))

mytable[1] = "lua"
mytable["wow"] = "修改前"
print("mytable 的索引值为1的元素是 ",mytable[1])
print("mytable 的索引值为wow的元素是 ",mytable["wow"])

-- alternatetable 和 mytable 的是指同一个 table
alternatetable = mytable

print("alternatetable 索引为1的元素是",alternatetable[1])
print("alternatetable 索引为wow的元素是",alternatetable["wow"])

alternatetable["wow"] = "修改后"

print("mytable 索引为wow的元素是",mytable["wow"])

--释放变量
alternatetable = nil
print("alternatetable 是",alternatetable)
--mytable 仍可以访问
print("mytable 索引为wow的元素是",mytable["wow"])

mytable = nil
print("mytable 是",mytable)

--实例

--table连接
fruits = {"banana","orange","apple"}
--返回table连接后的字符串
print("连接后的字符串",table.concat(fruits))

--指定连接字符串
print("连接后的字符串",table.concat(fruits,","))

--指定索引来连接table
print("连接后的字符串",table.concat(fruits,",",2,3))

--插入和移除
table.insert(fruits,"mango")
print("索引为4的元素为",fruits[4])

--在索引为2的建处插入
table.insert(fruits,2,"grapes")
print("索引为2的元素为",fruits[2])

print("最后一个元素为",fruits[5])
table.remove(fruits)  --返回table数组部分位于pos位置的元素. 其后的元素会被前移. pos参数可选, 默认为table长度, 即从最后一个元素删起。

for i,v in ipairs(fruits) do
	print(i,v)
end

print("移除后最后一个元素为",fruits[3])

--排序
print("排序前")
for k,v in ipairs(fruits) do
	print(k,v)
end

table.sort(fruits)
print("排序后")
for k,v in pairs(fruits) do
	print(k,v)
end

function table_maxn(t)
	local mn = nil;
	for k,v in pairs(t) do
		if(mn==nil) then
			mn = v
		end
		if mn<v then
			mn = v
		end
	end
	return mn
end

tb1 = {[1]=2,[2]=6,[3]=34,[5]=5}
print("tb1 的最大值: ",table_maxn(tb1))
print("tb1 长度: ",#tb1)

function table_leng(t)
	local leng = 0
	for k,v in pairs(t) do
		leng = leng+1
	end
	return leng
end

print("tb1 长度: ",table_leng(tb1))

