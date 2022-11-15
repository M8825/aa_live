 def element_count(arr)
  hash = {}
  arr.each { |ele| hash[ele] = arr.count { |element| ele == element} }

  return hash
 end


 def char_replace!(str, hash)
  str.each_char.with_index { |char, i| hash[char] ? str[i] = hash[char] : str[i] = char}
 end

 
 def product_inject(nums)
  nums.inject(&:*)
 end
