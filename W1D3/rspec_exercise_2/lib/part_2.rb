def palindrome?(string)
  string == (string.length - 1).downto(0).map { |i| string[i] }.join('')
end

def substrings(string)
  ret_arr = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      ret_arr << string[i..j]
    end
  end

  ret_arr
end


def palindrome_substrings(string)
  substrings(string).select { |sub| palindrome?(sub) && sub.length > 1 }
end