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
      self.to_enum(:my_each)
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
      self.to_enum(:my_select)
    end
    all_elements_truthy
  end
end
