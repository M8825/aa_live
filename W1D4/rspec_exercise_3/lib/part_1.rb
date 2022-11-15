def is_prime?(num)
  return false if num < 2

  (2...num).none? { |i| num % i == 0}
end


def nth_prime(n)
  count = 0
  prime = 0

  while count < n
    prime += 1
    count += 1 if is_prime?(prime)
  end

  prime
end


def prime_range(min, max)
  (min..max).select { |i| is_prime?(i) }
end