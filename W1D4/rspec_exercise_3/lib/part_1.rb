def is_prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if (num % i).zero?
  end

  true
end


def nth_prime(n)
  counter = 0
  prime = 0

  i = 2
  while counter < n
    if is_prime?(i)
      prime = i 
      counter += 1
    end

    i += 1
  end

  prime 
end

def prime_range(num_1, num_2)
  (num_1..num_2).select { |num| is_prime?(num)}
end

