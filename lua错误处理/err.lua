a = 2
for i = 1,10 do
	print(i)
end

--运行错误  assert和error来处理错误
--[[local function add(a,b)
	assert(type(a) == "number","a不是一个数字")
	assert(type(b) == "number","b不是一个数字")
	return a+b
end

add(10)--]]

pcall(function(i) print(i) error('error..') end,33)

function myfunction()
	n = n/nil
end

function myerrorhandler(err)
	print("error: ",err)
end

status = xpcall(myfunction,myerrorhandler)
print(status)