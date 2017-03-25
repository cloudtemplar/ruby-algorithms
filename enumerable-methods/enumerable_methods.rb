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
end
