require 'byebug'

def zip(*arrs)
  new_arr = []

  (0...arrs[0].length).each do |i|
    new_arr << arrs.map { |subArr| subArr[i] }
  end

  new_arr
end


def prizz_proc(arr, prc_1, prc_2)
  arr.select { |ele| [prc_1, prc_2].one? { |prc| prc.call(ele) }}
end


def zany_zip(*arrs)
  longest = arrs.inject(0) { |acc, subA| subA.length > acc ? subA.length : acc}
  new_arr = []

  (0...longest).each do |i|
    new_arr.push(arrs.map { |subA| subA[i] })
  end

  new_arr
end


def maximum(arr, &blk)
  arr.inject() { |acc, ele| blk.call(ele) >= blk.call(acc) ? ele : acc}
end


def my_group_by(arr, &blk)
  hash = Hash.new { |k, v| k[v] = [] }

  arr.each do |ele|
    hash[blk.call(ele)] << ele
  end

  hash
end


def max_tie_breaker(arr, prc, &blk)
  arr.inject() do |acc, ele|
    if blk.call(acc) == blk.call(ele)
      if prc.call(acc) == prc.call(ele) 
        acc
      else
        prc.call(acc) > prc.call(ele) ? acc : ele
      end
    elsif blk.call(acc) < blk.call(ele)
      ele
    else
      acc
    end
  end
end


def first_vowel(w)
   (0...w.length).each do |i|
    return i if "aeiouAEIOU".include?(w[i])
   end
end


def last_vowel(w)
  (w.length - 1).downto(0) do |i|
    return i if 'aeiouAEIOU'.include?(w[i])
  end
end


def silly_syllables(sent)
  words = sent.split(" ")
  vowels = 'aeiouAEIOU'

  words.map do|word|
    numberOfVowels = word.split('').count { |char| vowels.include?(char)}

    if numberOfVowels >= 2
      fist_vowel_idx = first_vowel(word) 
      last_vowel_idx = last_vowel(word) 

      word[fist_vowel_idx..last_vowel_idx]
    else
      word
    end
  end.join(' ')
end