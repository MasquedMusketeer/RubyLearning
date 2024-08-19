hexTable = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]      # A lookup table for hexadecimal digits. indexes 10-15 represent hexadecimal letters A-F.

def userInput()                       #getting user input
  usr = (gets.chomp).to_s
  return usr
end

def direct(value,flag)                #conversion selector
  case flag
  when "d"
    decimal(value)
  when "h"
    hex(value,hexTable)
  when "b"
    bin(value)
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
    if remainder > 9                  #handling of the characters from A to F
      remainder = hexTable[remainder]
    end
    hexResult << remainder.to_s
  end
  quotient = hexTable[quotient]      #addition of the last digit of the hex value already converted to hex in case of values > 9
  hexResult << quotient.to_s
  return hexResult.reverse           #reversion of the hex string to a human readable form
end