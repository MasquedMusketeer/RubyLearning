def userInput()
  usr = (gets.chomp).to_s
  return usr
end

def direct(value,flag)
  case flag
  when "d"
    decimal(value)
  when "h"
    hex(value)
  when "b"
    bin(value)
  end
end

def valueConver(value)
  hexTable = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
  hexRange = ("A".."F").to_a
  decRange = ("2".."9").to_a
  conversionFlag = ""
  fullValue = 0
  valueUp = value.upcase

  valueUp.each_char do |digit|
    if hexRange.include?(digit)
      conversionFlag = "hex"
      break
    elsif decRange.include?(digit)
      conversionFlag = "dec"
    else
      conversionFlag = "bin"
    end
  end

  case conversionFlag
  when "hex"
    digitCounter = 0
    valueRev = valueUp.reverse
    valueRev.each_char do |digit|
      digitValue = hexTable.index(digit).to_i
      fullDigitValue = digitValue * (16**digitCounter)
      fullValue += fullDigitValue.to_i
      digitCounter += 1
    end
    return fullValue
  when "bin"
    digitCounter = 0
    valueRev = valueUp.reverse
    valueRev.each_char do |digit|
      fullDigitValue = digit.to_i * (2** digitCounter)
      fullValue += fullDigitValue
      digitCounter += 1
    end
    return fullValue
  end
end

puts valueConver("1000")