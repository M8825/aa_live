 def proper_factors(num)
  (1...num).select { |ele| num % ele == 0}
 end

 
 def aliquot_sum(num)
  proper_factors(num).sum
 end


 def perfect_number?(num)
  aliquot_sum(num) == num
 end

 def ideal_numbers(n)
    ret_arr = []

    i = 0
    while ret_arr.length < n
      i += 1
      ret_arr.push(i) if perfect_number?(i)
    end

    ret_arr
 end