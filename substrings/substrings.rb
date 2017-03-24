def substrings(word, dictionary)
  substrings_frequency = Hash.new(0)

  dictionary.each do |substring|
    if /#{substring}/ =~ word
      substrings_frequency[substring] += 1
    end
  end
  substrings_frequency
end
