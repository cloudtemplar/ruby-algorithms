def bubble_sort(array)
  sorted_array = array.dup
  # I could use #each_with_index iterator, but that way code is more readable.
  array.size.times do
    array[0..-2].each_index do |index|
      if sorted_array[index] > sorted_array[index + 1]
        # Swapping elements by parallel assignment.
        sorted_array[index], sorted_array[index + 1] = sorted_array[index + 1], sorted_array[index]
      end
    end
  end
  sorted_array
end
