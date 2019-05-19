# Use Gists to store entire functions
class QuickSort
 
  def self.sort!(keys)
    quick(keys,0,keys.size-1)
  end
 
  private
 
  def self.quick(keys, left, right)
    if left < right
      pivot = partition(keys, left, right)
      quick(keys, left, pivot-1)
      quick(keys, pivot+1, right)
    end
    keys
  end
 
  def self.partition(keys, left, right)
    x = keys[right]
    i = left-1
    for j in left..right-1
      if keys[j] <= x
        i += 1
        keys[i], keys[j] = keys[j], keys[i]
      end
    end
    keys[i+1], keys[right] = keys[right], keys[i+1]
    i+1
  end
 
end