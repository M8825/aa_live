def partition(arr, num)
  ret_arr = Array.new(2) { Array.new }
  arr.each { |ele| ele < num ? ret_arr[0] << ele : ret_arr[1] << ele } 
  ret_arr
end


def merge(hash_1, hash_2)
  new_hash = {}
  hash_1.each { |k, v| new_hash[k] = v}
  hash_2.each { |k, v| new_hash[k] = v}

  new_hash
end


def censor(sent, arr)
  sent.split(' ').map { |word| arr.include?(word.downcase) ? word.gsub(/[aeiouAEIOU]/, '*') : word }.join(' ')
end


def power_of_two?(num)
  (0..num / 2).any? { |i| 2 ** i == num }
end 

