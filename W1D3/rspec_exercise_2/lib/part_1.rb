def partition(arr, num)
    newArr = Array.new(2) { Array.new() }

    arr.each do |ele|
        if ele < num
            newArr[0] << ele
        else
            newArr[1] << ele
        end
    end

    newArr
end


def merge(hash_1, hash_2)
    resHash = {}

    hash_1.each { |k, v| resHash[k] = v}
    hash_2.each { |k, v| resHash[k] = v}

    return resHash
end


def censor(sent, arr)
    vowels = 'aeiou'
    words = sent.split(' ')

    words.map { |word| arr.include?(word.downcase) ? replace_vowel(word) : word }.join(' ')
end


def replace_vowel(word)
    vowels = 'aeiou'

    word.each_char.with_index { |char, i| word[i] = "*" if vowels.include?(char.downcase)}
end


def power_of_two?(n)
    i = 1

    while i <= n
        return true if i == n

        i *= 2
    end

    return false
end


