def second_anagram?(str1, str2)
  str1_arr = str1.chars
  str2_arr = str2.chars

  str1_arr.each_with_index do |el1, idx1|
    # debugger
    str2_arr.each_with_index do |el2, idx2|
      if el1 == el2
        str1_arr.slice!(idx1)
        str2_arr.slice!(idx2)
        idx1 = 0
      else
        return false
      end
    end
  end
  str1_arr.empty? && str2_arr.empty?
end


p second_anagram?("elvis", "lives")

# first_anagram?("gizmo", "sally")
