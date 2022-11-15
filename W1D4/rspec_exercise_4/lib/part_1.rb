def my_reject(arr, &blk)
  arr.select { |ele| !blk.call(ele) }
end

def my_one?(arr, &blk)
  arr.count { |ele| blk.call(ele) } == 1
end

def dupe_indices(array)
    indices = Hash.new { |h, k| h[k] = [] }
    array.each_with_index { |ele, i| indices[ele] << i }
    indices.select { |ele, indices| indices.length > 1 }
end

def hash_select(hash, &blk)
  hash.reject { |k, v| !blk.call(k , v)}
end


def xor_select(arr, prc_1, prc_2)
  arr.select { |ele| (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele)) } 
end


def proc_count(val, procs)
  procs.count { |prc| prc.call(val) }
end