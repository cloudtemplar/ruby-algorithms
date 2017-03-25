# Enumerable with its own enumerators built from scratch.
module Enumerable
  def my_each
    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
    self
  end
end
