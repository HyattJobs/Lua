function myfunction()
	print(debug.traceback("stack trace"))
	print(debug.getinfo(1))
	print("statck trace end")
		return 10
end

myfunction()
print(debug.getinfo(1))