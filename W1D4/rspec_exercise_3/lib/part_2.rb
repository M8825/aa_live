def element_count(arr)
  hash = {}
  arr.each { |ele| hash[ele] = arr.count(ele) }

  hash
end


def char_replace!(str, hash)
  str.each_char.with_index do |char, i|
    str[i] = hash[char] if hash[char]
  end
end


def product_inject(arr)
  arr.inject(&:*)
end