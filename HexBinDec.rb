hexTable = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]      # A lookup table for hexadecimal digits. Indexes 10-15 represent hexadecimal letters A-F.

def userInput()                       #getting user input
  usr = (gets.chomp).to_s
  return usr
end

def direct(value,flag,hexTable)                #conversion selector
  case flag
  when "d>h"                          #on both hex and bin straing from dec
    hex(value,hexTable)
  when "d>b"                          #the call is straigh to the conversion functions
    bin(value)
  when "hb>d"                         #on conversion from any to dec, the conversion function already handles both, so only one call is needed
    valueConver(value,hexTable)
  when "h>b"
    bin(valueConver(value,hexTable))  #converts first from hex to dec, then from dec to bin
  when "b>h"
    hex(valueConver(value,hexTable),hexTable)  #converts first from bin to dec,then from dec to hex
  end
end

#_____________Convert any non-decimal value to decimal________________
def valueConver(value,hexTable)
  hexRange = ("A".."F").to_a
  decRange = ("2".."9").to_a
  conversionFlag = ""
  fullValue = 0
  valueUp = value.upcase                #make all characters uppercase to make the conversion uniform
  valueRev = valueUp.reverse            #invert number for processing

  valueUp.each_char do |digit|
    if hexRange.include?(digit)         #check if there is any letter in the value provided to determine if its hexadecimal
      conversionFlag = "hex"
      break
    elsif decRange.include?(digit)      #check if there is any decimal digit in the value provided
      conversionFlag = ""
    else
      conversionFlag = "bin"
    end
  end

  case conversionFlag
  when "hex"                           #conversion hex digit by digit (it uses the index of a lookup table to determine by whitch number the 16^n must be multiplied)
    digitCounter = 0
    valueRev.each_char do |digit|
      digitValue = hexTable.index(digit).to_i
      fullDigitValue = digitValue * (16**digitCounter)
      fullValue += fullDigitValue.to_i
      digitCounter += 1
    end
    return fullValue
  when "bin"                          #conversion bin digit by digit
    digitCounter = 0
    valueRev.each_char do |digit|
      fullDigitValue = digit.to_i * (2** digitCounter)
      fullValue += fullDigitValue
      digitCounter += 1
    end
    return fullValue
  end
end

#____________________Functions of the bin and hex from dec values___________________________________

def hex(value,hexTable)               #function to convert from decimal to hexadecimal
  remainder = 0
  quotient = value.to_i
  hexResult = ""
  until quotient < 16                 #loop that builds the string of the hex value until the second last digit
    remainder = quotient % 16
    quotient = quotient / 16
    remainder = hexTable[remainder]
    hexResult << remainder.to_s
  end
  quotient = hexTable[quotient]      #addition of the last digit of the hex value already converted to hex in case of values > 9
  hexResult << quotient.to_s
  return hexResult.reverse           #reversion of the hex string to a human readable form
end

def bin(value)
  remainder = 0
  quotient = value.to_i
  binResult = ""
  until quotient < 2                 #loop that builds the string of the hex value until the second last digit
    remainder = quotient % 2
    quotient = quotient / 2
    binResult << remainder.to_s
  end
  binResult << quotient.to_s         #addition of the last digit of the bin value
  return binResult.reverse           #reversion of the bin string to a human readable form
end

#_________________________Interface time baby_______________________
interfaceString = [
  "+-------------------------------+",       #no explanation needed, if you have eyes, you know what this is.
  "+---- Hex/Bin/Dec converter ----+",
  "+--- NOW AVAILABLE IN RUBY!! ---+",
  "+-------------------------------+",
  "|                               |",
  "| 1. Hexadecimal to Decimal     |",
  "| 2. Binary to Decimal          |",
  "| 3. Decimal to Hexadecimal     |",
  "| 4. Decimal to Binary          |",
  "| 5. Hexadecimal to Binary      |",
  "| 6. Binary do Hexadecimal      |",
  "| 7. Close App                  |",
  "|                               |",
  "+-------------------------------+"
]

loop do                                     #Main operation loop
  twoBitRange = ["0","1"]
  decimalRange = twoBitRange + ("2".."9").to_a
  fullRange = decimalRange + ("A".."F").to_a
  flag = ""
  interfaceString.each do |line|            #interface printing
    puts line
  end
  input = userInput().to_s                  #sets flag to determine type of conversion
  unless ("1".."7").to_a.include?(input)
    puts "invalid input                            'you fcking blind? read the menu'"
  else
    case input
    when "1" then flag = "hb>d"
    when "2" then flag = "hb>d"
    when "3" then flag = "d>h"
    when "4" then flag = "d>b"
    when "5" then flag = "h>b"
    when "6" then flag = "b>h"
    when "7"
      puts "BYE!"
      break                                   #breaks loop to exit app
    end
    puts "Insert Value:"
    value = userInput().to_s.upcase           #determine user set value
    condition1 = (input == "1" || input == "5") && !value.each_char.any? { |char| fullRange.include?(char) }       #validtion of input for hex operations
    condition2 = (input == "3" || input == "4") && !value.each_char.any? { |char| decimalRange.include?(char) }    #validtion of input for decimal operations
    condition3 = (input == "2" || input == "6") && !value.each_char.any? { |char| twoBitRange.include?(char) }       #validtion of input for bin operations
    if condition1 == true
      puts "Invalid input for this operation."
    elsif condition2 == true
      puts "Invalid input for this operation."           #iteratoin over the conditions to take the apropriate couse of action.
    elsif condition3 == true
      puts "Invalid input for this operation."
    else
      result = direct(value,flag,hexTable)               #recieve the processed value
      puts ""
      puts "The result of the conversion is: #{result}"   #Presents value
      puts "Press enter to continue..."
      wait = gets.chomp
    end
  end
end