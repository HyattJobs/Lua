mytable = {"apple","orange","banana"}
print(collectgarbage("count"))

mytable = nil

print(collectgarbage("count"))

print(collectgarbage("collect"))

print(collectgarbage("count"))

print(collectgarbage("restart"))

print(collectgarbage("count"))