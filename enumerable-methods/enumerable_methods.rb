# Enumerable with its own enumerators built from scratch.
module Enumerable
  def my_each
    if block_given?
      i = 0
      while i < size
        yield(self.to_a[i])
        i += 1
      end
      self
    else
      self.to_enum(:my_each)
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < size
        yield(self.to_a[i], i)
        i += 1
      end
      self
    else
      self.to_enum(:my_each_with_index)
    end
  end

  def my_select
    if block_given?
      if self.is_a? Array
        selected_elements = []
        self.my_each do |el|
          selected_elements << el if yield(el)
        end
      elsif self.is_a? Hash
        selected_elements = {}
        self.my_each do |key, val|
          selected_elements.store(key, val) if yield(key, val)
        end
      end
      selected_elements
    else
      self.to_enum(:my_select)
    end
  end

  def my_all?
    if block_given?
      all_elements_truthy = true
      self.my_each do |el|
        all_elements_truthy = false unless yield(el)
      end
    else
      self.to_enum(:my_all)
    end
    all_elements_truthy
  end

  def my_any?
    if block_given?
      any_element_truthy = false
      self.my_each do |el|
        any_element_truthy = true if yield(el)
      end
    else
      self.to_enum(:my_any?)
    end
    any_element_truthy
  end

  def my_none?
    if block_given?
      all_element_falsey = true
      self.my_each do |el|
        all_element_falsey = false if yield(el)
      end
    else
      self.to_enum(:my_none?)
    end
    all_element_falsey
  end

  def my_count
    size = 0
    self.my_each do |el|
      size += 1
    end
    return size
  end

  def my_map
    transformed_array = []
    if block_given?
      self.my_each do |el|
        transformed_array << yield(el)
      end
    else
      self.to_enum(:my_none?)
    end
    transformed_array
  end

  def my_inject(value_passed = false)
    unless value_passed
      accumulator = self[0]
      self[1..-1].my_each do |el|
        accumulator = yield(accumulator, el)
      end
    else
      accumulator = value_passed
      self.my_each do |el|
        accumulator = yield(accumulator, el)
      end
    end
    accumulator
  end
end
