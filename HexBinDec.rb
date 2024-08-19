def userInput()                       #getting user input
  usr = (gets.chomp).to_s
  return usr
end

def direct(value,flag)                #conversion selector
  case flag
  when "d"
    decimal(value)
  when "h"
    hex(value)
  when "b"
    bin(value)
  end
end

#_____________Convert any non-decimal value to decimal________________
def valueConver(value)
  hexTable = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
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

puts valueConver("1000")