def first_letter_vowel_count(sent)
  sent.split(' ').count { |word| 'aeiouAEIOU'.include?(word[0])}
end


def count_true(arr, prc)
  arr.count { |ele| prc.call(ele) }
end


def procformation(arr, prc_1, prc_2, prc_3)
  arr.map { |ele| prc_1.call(ele) ? prc_2.call(ele) : prc_3.call(ele) }
end


def array_of_array_sum(arr)
  arr.flatten.sum
end


def selective_reverse(sent)
  vowels = 'aeiouAEIOU'
  sent.split(' ').map { |word| vowels.include?(word[0]) || vowels.include?(word[-1]) ? word : word.reverse}.join(' ')
end


def hash_missing_keys(hash, *args)
  args.reject { |ele| hash[ele] } 
end