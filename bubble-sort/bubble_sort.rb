def bubble_sort(array)
  sorted_array = array.dup
  swapped = false
  array.size.times do |i|
    array[0..-(i + 2)].each_index do |index|
      if sorted_array[index] > sorted_array[index + 1]
        sorted_array[index], sorted_array[index + 1] = sorted_array[index + 1], sorted_array[index]
        swapped = true
      end
    end
    break if swapped == false
  end
  sorted_array
end
