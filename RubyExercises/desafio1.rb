@my_lambda = -> (name) { name.capitalize }

def capitalize_name(lambda)
  puts "----------------------------"
  puts @my_lambda.call(lambda)
end


x = gets.chomp
capitalize_name(x)
