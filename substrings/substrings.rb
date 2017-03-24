def substrings(words, dictionary)
  substrings_frequency = Hash.new(0)
  words = words.downcase.split

  words.each do |word|
    dictionary.each do |substring|
      if /#{substring}/ =~ word
        substrings_frequency[substring] += 1
      end
    end
  end
  substrings_frequency
end
