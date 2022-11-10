# Define your methods here. 


def first_letter_vowel_count(sent)
  vowels = 'aeiou'
  sent.split(' ').count { |word| vowels.include?(word[0].downcase) } 
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
  vowels = 'aeiou'

  sent.split(' ').map do |word|
    if vowels.include?(word[0].downcase) || vowels.include?(word[-1].downcase)
      word
    else
      word.reverse
    end
  end.join(' ')
end


def hash_missing_keys(hash, *args)
  args.reject { |arg| hash[arg] }
end