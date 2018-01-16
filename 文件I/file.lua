--以只读方式打开文件
file = io.open("test.txt",r)

--设置默认输入文件为test.lua
io.input(file)

--输出文件第一行
print(io.read())

--关闭打开的文件
io.close(file)

--以附加的方式打开只写软件
file = io.open("test.txt","a")

--设置默认输出文件为test.lua
io.output(file)

--在文件最后一行添加lua注释
io.write("-- test.lua 文件末尾注释")

--关闭打开的文件
io.close(file)

-- -- 完全模式
--以只读方式打开文件
file = io.open("test.txt","r")

--输出文件第一行元素
print(file:read())

--关闭打开的文件
file:close()

--以附加的方式打开只写文件
file = io.open("test.txt","a")

--在文件最后一行添加lua注释
file:write("--test")

--关闭打开的文件
file:close()

for line in io.lines("test.txt") do
	print(line)
end
