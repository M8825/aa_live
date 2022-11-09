
def palindrome?(str)
    return true if str.length <= 1

    str[0] == str[-1] ? palindrome?(str[1...-1]) : false
end


def substrings(string) # 'jump' => ['j', 'ju']
    new_arr = [] # ['j', 'ju', 'jum']

    string.each_char.with_index do |char, i| # i = 0
        (i..string.length - 1).each do |j|   # j = 2
            new_arr << string[i..j] # string[0..2] => 'ju'
        end
    end

    new_arr
end


def palindrome_substrings(str)
    substrings(str).select { |ele| palindrome?(ele) }
end
