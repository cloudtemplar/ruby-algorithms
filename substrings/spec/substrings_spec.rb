require_relative '../substrings'

# Implement a method #substrings that takes a word as the first
# argument and then an array of valid substrings (your dictionary)
# as the second argument. It should return a hash listing each substring
# (case insensitive) that was found in the original string and how many
# times it was found.

describe '#substrings' do

  before do
    @dictionary = ["below", "down", "go", "going", "horn", "how", "howdy",
                   "it", "i", "low", "own", "part", "partner", "sit"]
  end

  it 'returns a hash listing each substring and its frequency' do
    expect(substrings("below", @dictionary)).to eq({ "below" => 1, "low" => 1 })
  end

end

