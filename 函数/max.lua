function max( num1, num2 )
	if(num1 > num2) then
		result = num1;
	else
		result = num2;
	end

	return result;
end

print("两者最大的为:",max(10,4))

myprint = function(param)
	print("这是打印函数",param,"##");
end

function add( num1, num2, functionPrint )
	result = num1 + num2
	functionPrint(result)
	-- body
end

myprint(10)
add(2,5,myprint)

