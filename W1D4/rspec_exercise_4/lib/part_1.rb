def my_reject(arr, &blk)
  newArr = []
  arr.each { |ele| newArr << ele if !blk.call(ele) }

  newArr
end


def my_one?(arr, &blk)
  arr.count { |ele| blk.call(ele)} == 1
end

def dupe_indices(array)
    indices = Hash.new { |h, k| h[k] = [] }
    array.each_with_index { |ele, i| indices[ele] << i }
    indices.select { |ele, indices| indices.length > 1 }
end

def hash_select(hash, &blk)
  newHash = {}
  hash.each { |k, v| newHash[k] = v if blk.call(k, v) }

  newHash
end


def xor_select(arr, prc_1, prc_2)
   arr.select { |ele| (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele))}
end


def proc_count(val, procs)
  procs.count { |prc| prc.call(val) }
end


def proper_factors(num)
  (1...num).select { |ele| (num % ele).zero? }
end


def aliquot_sum(num)
  proper_factors(num).sum
end


def perfect_number?(num)
  aliquot_sum(num) == num
end


def ideal_numbers(n)
  nums = []
  i = 1

  until nums.length == n
    nums << i if perfect_number?(i)
    i += 1
  end

  nums
end