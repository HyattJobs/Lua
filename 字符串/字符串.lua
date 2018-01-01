-- 字符串 或者串是由数字,字母下划线组成的一串字符

string1 = "lua"
print("\"字符串1是\"",string1)

string2 = 'runoob.com'
print("字符串2是",string2)

string3 = [["best"]]
print("字符串3是",string3)
print("\a")

print(string.gsub("test",'t','b',1))

print(string.find("bestliuxingtang.cn","tang",1))

print(string.reverse("bestliuxingtang"))

print(string.format("the value is:%d",4))

print(string.char(97,98,99,100))

print(string.byte("abcd",4))

print(string.byte("abcd"))

print(string.len("bestliuxingtang"))

print(string.rep("bestliuxingtang ",3))

print("runoob"..".com")

for word in string.gmatch("hello lua user","%a+") do
	print(word)
end
print(string.format("%d, %q", string.match("I have 2 questions for you.", "(%d+) (%a+)")))
