require_relative '../enumerable_methods'

describe Enumerable do
  let(:numbers) { %w( 2 1 3 7) }

  describe '#my_each' do
    it 'returns this array' do
      expect(numbers.my_each { |el| el }).to eq(numbers)
    end
  end
end

