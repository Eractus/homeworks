def sum_to(n)
  return nil if n < 0
  if n == 0
    0
  else
    n + sum_to(n-1)
  end
end

def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
  return nil if n < 1
  if n == 1
    1
  else
    (n-1) * gamma_fnc(n-1)
  end
end

def ice_cream_shop(flavors, favorite)
  return flavors.first == favorite if flavors.length <= 1
  if flavors.first == favorite
    return true
  else
    ice_cream_shop(flavors[1..-1], favorite)
  end
end

def reverse(string)
  return "" if string.chars.length < 1
  (reverse(string[1..-1])).concat(string.chars.first)
end
