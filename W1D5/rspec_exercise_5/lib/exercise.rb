def zip(*arrays)
  retArr = []

  arrays[0].each_with_index do |_ele, i|
    temp = []
    arrays.each { |array| temp << array[i] }
    retArr << temp
  end
  retArr
end

def prizz_proc(array, prc1, prc2)
  array.select { |ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)) }
end

def zany_zip(*arrs)
  length = arrs.inject(0) do |acc, arr|
    acc = arr.length if arr.length > acc
    acc
  end
  new_arr = []
  (0...length).each do |i|
    inner_arr = []
    arrs.each do |arr|
      inner_arr << arr[i]
    end
    new_arr << inner_arr
  end
  new_arr
end

def maximum(arr, &blk)
  arr.inject(arr[0]) do |acc, ele|
    acc = ele if blk.call(ele) >= blk.call(acc)
    acc
  end
end

def my_group_by(arr, &blk)
  hash = Hash.new { |k, v| k[v] = [] } # { foo: [1, ] } => hash[:foo]

  arr.each do |ele|
    hash[blk.call(ele)] << ele
  end

  hash
end

# should accept an array, a proc, and a block as args
# should return the element that has the largest result when passed into the block
# when there is a tie should use the proc to break the tie
# when there is still a tie after using the proc should return the element that comes first in the array

def max_tie_breaker(arr, proc, &blk)
  arr.inject(arr.first) do |acc, ele|
    if blk.call(acc) < blk.call(ele)
      acc = ele
    elsif blk.call(acc) == blk.call(ele) && proc.call(ele) > proc.call(acc)
      acc = ele
    end
    acc
  end
end

# hi malkhaz
# hi Joe

# should return a new sentence where all letters before the first vowel and after the last vowel are removed should not remove letters for words that contain less than two vowels

# "cac" => vowel_index(word) => 1
# last_index => vowel_index(word.reversed) => 1
# last_index = 3 - 1 - vowel_index(word.reversed) => 1
# def silly_syllables(sentence)
#   new_sen = []
#   words = sentence.split(' ')

#   words.each do |word|
#     first_index = vowel_index(word)
#     last_index = word.length - 1 - vowel_index(word.reverse)

#     if first_index != last_index
#       new_word = word[first_index..last_index]
#       new_sen << new_word
#     else
#       new_sen << word
#     end
#   end
#   new_sen.join(' ')
# end

# def vowel_index(word)
#   vowels = 'aeiou'
#   word.each_char.with_index do |char, i|
#     return i if vowels.include?(char)
#   end
# end



def silly_syllables(sentence)
    words = sentence.split(' ')
    new_sen = [] 
    words.each do |word|
        first_index = vowels_finder(word)[0]  
        last_index = vowels_finder(word)[-1]
        if first_index == last_index
            new_sen << word
        else 
            new_sen << word[first_index ..last_index]
        end 
    end 
    return new_sen.join(' ')        
end 

    
def vowels_finder(word)
    vowels = 'aeiou'
    arr = [] 
    word.each_char.with_index do |char, i|  
        if vowels.include?(char)
            arr << i
        end 
    end 
    arr 
end 

def silly_talk(sent)
  vowels = 'aeiouAEIOU'
  sentArr = sent.split(' ')

  sentArr.map do |word|
    if vowels.include?(word[-1])
      word + word[-1]
    else
      followed_by_b(word)
    end
  end.join(' ')
end

def followed_by_b(word)
  vowels = 'aeiouAEIOU'
  word.split('').map { |char| vowels.include?(char) ? char + 'b' + char.downcase : char }.join('')
end

puts
p silly_talk('Kids like cats and dogs') == 'Kibids likee cabats aband dobogs'
p silly_talk('Stop that scooter') == 'Stobop thabat scobooboteber'
p silly_talk('They can code') == 'Thebey caban codee'
p silly_talk('He flew to Italy') == 'Hee flebew too Ibitabaly'

