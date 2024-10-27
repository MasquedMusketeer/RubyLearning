avrgTax = (4.29).to_f
conversionRate = (0.038).to_f
totalPay = 0
convertedValue = 0

puts "Insert Desired ammount:"
puts ""

userInput = (gets.chomp).to_f

totalPay = ((avrgTax * userInput)/100) + userInput
convertedValue = totalPay * conversionRate

puts "the Desired value is: " + userInput.to_s
puts "The total ammount to pay is: " + totalPay.to_s
puts "And the converted payment is: " + convertedValue.to_s
puts "That is a rough estimate, note that both the sending tax and the conversion rate can varry."