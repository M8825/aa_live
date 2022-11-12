def compress(str)
  c = 1
  newStr = ''

  str.each_char.with_index do |char, i|
    if char == str[i + 1]
      c += 1
    else
      newStr += c > 1 ? char + c.to_s : char
      c = 1
    end
  end

  newStr
end

p compress('aabbbbc') == "a2b4c"
p compress('boot') == "bo2t"
p compress('xxxyxxzzzz') == "x3yx2z4"