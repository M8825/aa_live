def my_map!(arr, &blk)
  arr.each_with_index do |ele, i|
    arr[i] = blk.call(ele)
  end

end


def two?(arr, &blk)
  arr.count { |ele| blk.call(ele) } == 2
end


def nor_select(arr, prc_1, prc_2)
  arr.select { |ele| !prc_1.call(ele) && !prc_2.call(ele)}
end


def array_of_hash_sum(hashes)
  sum = 0
  hashes.each do |hash|
    sum += hash.values.sum
  end

  sum
end


def remove_vowel(word)
  vowels = 'aeiouAEIOU'

  word.each_char.with_index do |char, i|
    if vowels.include?(char)
      return word[0...i] + word[i + 1..-1]
    end
  end

  word
end

def slangify(sent)
  sent.split(' ').map { |word| remove_vowel(word) }.join(' ')
end


def char_counter(str, *args)
  hash = Hash.new(0)

  if args.length > 0
    args.each { |char| hash[char] = str.split('').count { |c| char == c}}
  else
    str.each_char { |char| hash[char] = str.split('').count { |c| char == c}}
  end

  hash
end