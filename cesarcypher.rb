def cypher (text, shift)
  encrypted = ''
  lowerAlphabet = ("a".."z").to_a
  upperAlphabet = lowerAlphabet.map(&:upcase)

  text.each_char do |char|
    if lowerAlphabet.include?(char)
      lowerChar = lowerAlphabet.index(char)
      lowerChar += shift
      if lowerChar >= 26
        lowerChar -= 26
      end
      processedChar = lowerAlphabet[lowerChar]
      encrypted << processedChar
    elsif upperAlphabet.include?(char)
      upperChar = upperAlphabet.index(char)
      upperChar += shift
      if upperChar >= 26
        upperChar -= 26
      end
      processedChar = upperAlphabet[upperChar]
      encrypted << processedChar
    else !lowerAlphabet.include?(char) && !upperAlphabet.include?(char)
      encrypted << char
    end
  end
  return encrypted
end

puts cypher("Hello Ruby!",3)