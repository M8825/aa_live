require 'byebug'

def duos(str)
  count = 0

  str.each_char.with_index do |char, i|
   count += 1 if str[i] == str[i + 1].to_i
  end

  count 
end

puts
puts 'DUOS:'
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

def sentence_swap(sent, hash)
  sent.split(' ').map { |word| hash[word] ? hash[word] : word}.join(' ')
end

puts
puts 'SENTENCE SWAP:'
p sentence_swap('anything you can do I can do',
                'anything' => 'nothing', 'do' => 'drink', 'can' => 'shall') == 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
                'cat' => 'dog', 'sad' => 'happy', 'what' => 'make') == 'make a happy ad'

p sentence_swap('keep coding okay',
                'coding' => 'running', 'kay' => 'pen') == 'keep running okay'

def hash_mapped(hash, prc, &blk)
  output = {}

  hash.each { |k, v| output[blk.call(k)] = prc.call(v)}
  output
end

puts
puts "HASH MAPPED:"
double = proc { |n| n * 2 }
p hash_mapped({ 'a' => 4, 'x' => 7, 'c' => -3 }, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = proc { |a| a[0] }
p hash_mapped({ -5 => %w[q r s], 6 => %w[w x] }, first) { |n| n * n }
# {25=>"q", 36=>"w"}

def counted_characters(str)
  output = []

  str.each_char { |char| output << char if str.split('').count { |c| c == char } > 2 && !output.include?(char)}

  return output
end

puts
puts "COUNTED CHARACTERS"
p counted_characters("that's alright folks") # ["t"]
p counted_characters('mississippi') # ["i", "s"]
p counted_characters('hot potato soup please') # ["o", "t", " ", "p"]
p counted_characters('runtime') # []

def triplet_true(str) # 'aaabccz' => 'a3bc2z'
  count = 1

  str.each_char.with_index do |char, i|
    if char == str[i + 1]
      count += 1
      return true if count == 3
    else
      count = 1
    end
  end

  return false
end

puts

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

def energetic_encoding(str, hash)
  str.split('').map { |char| hash[char] ? hash[char] : char == ' ' ? char : '?' }.join('')
end

puts
puts 'ENERGETIC ENCODING:'
p energetic_encoding('sent sea',
                     'e' => 'i', 's' => 'z', 'n' => 'm', 't' => 'p', 'a' => 'u') # 'zimp ziu'

p energetic_encoding('cat',
                     'a' => 'o', 'c' => 'k') # 'ko?'

p energetic_encoding('hello world',
                     'o' => 'i', 'l' => 'r', 'e' => 'a') # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

def uncompress(str)
  output = ''

  i = 1
  while i < str.length 
    output += str[i - 1] * str[i].to_i
    i += 2
  end

  return output
end

puts
puts 'uncompress:'.upcase
p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzz

def conjunct_select(arr, *prcs)
  arr.select { |ele| prcs.all? { |prc| prc.call(ele) } }
end

is_positive = proc { |n| n > 0 }
is_odd = proc { |n| n.odd? }
less_than_ten = proc { |n| n < 10 }

puts
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten)

def convert_pig_latin(str)
  vowels = 'aeiouAEIOU'

  str.split(' ').map do |word|
    if word.length >= 3
      if vowels.include?(word[0])
        word + 'yay'
      else
        vowel_index = vowel_finder(word)
        tempWord = word[vowel_index..-1] + word[0...vowel_index] + 'ay'
        word[0] == word[0].upcase ? tempWord.capitalize : tempWord
      end
    else
      word
    end
  end.join(' ')
end

def vowel_finder(word) # => return index of the first vowel
  vowels = 'aeiou'

  word.each_char.with_index do |char, i|
    return i if vowels.include?(char)
  end
end

p convert_pig_latin('We like to eat bananas') == 'We ikelay to eatyay ananasbay'
p convert_pig_latin('I cannot find the trash') == 'I annotcay indfay ethay ashtray'
p convert_pig_latin('What an interesting problem') == 'Atwhay an interestingyay oblempray'
p convert_pig_latin('Her family flew to France') == 'Erhay amilyfay ewflay to Ancefray'
p convert_pig_latin('Our family flew to France') == 'Ouryay amilyfay ewflay to Ancefray'

def reverberate(sent)
  words = sent.split(' ')
  vowels = 'aeiou'

  words.map do |word|
    if word.length < 3
      word
    else
      if vowels.include?(word[-1])
        word += word.downcase # like => like + like
      else
        after_last_vowel(word)
      end
    end
  end.join(' ')
end

def after_last_vowel(word) # 'Joseph' => 'Joseph + eph'
  vowels = 'aeiou'
  i = word.length - 1
  while i >= 0
    return word + word[i..-1] if vowels.include?(word[i])

    i -= 1
  end

  word
end

puts
p reverberate('We like to go running fast') == 'We likelike to go runninging fastast'
p reverberate('He cannot find the trash') == 'He cannotot findind thethe trashash'
p reverberate('Pasta is my favorite dish') == 'Pastapasta is my favoritefavorite dishish'
p reverberate('Her family flew to France') == 'Herer familyily flewew to Francefrance'

def disjunct_select(arr, *prcs)
  arr.select { |ele| prcs.any? { |prc| prc.call(ele) } }
end

longer_four = proc { |s| s.length > 4 }
contains_o = proc { |s| s.include?('o') }
starts_a = proc { |s| s[0] == 'a' }

puts
p disjunct_select(%w[ace dog apple teeming boot zip],
                  longer_four) # ["apple", "teeming"]

p disjunct_select(%w[ace dog apple teeming boot zip],
                  longer_four,
                  contains_o) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(%w[ace dog apple teeming boot zip],
                  longer_four,
                  contains_o,
                  starts_a) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
  sentArr = sent.split(' ')

  sentArr.each_with_index do |word, i|
    sentArr[i] = if i.even?
                   first_vowel_remove(word)
                 else
                   last_vowel_remove(word)
                 end
  end
  sentArr.join(' ')
end

def first_vowel_remove(word)
  vowels = 'aeiou'

  word.each_char.with_index do |char, i|
    return word[0...i] + word[i + 1..-1] if vowels.include?(char.downcase)
  end

  word
end

def last_vowel_remove(word)
  vowels = 'aeiou'

  word.reverse!.each_char.with_index do |char, i|
    return (word[0...i] + word[i + 1..-1]).reverse if vowels.include?(char.downcase)
  end
  word
end

puts
p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

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



def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])

  merge(left, right)
end

def mereg(left, right)
  sorted = []

  until left.empty? || right.empty?
    if left[0] < right[0]
      sorted << left.shift
    else
      sorted << right.shift
    end
  end

  sorted + left + right
end