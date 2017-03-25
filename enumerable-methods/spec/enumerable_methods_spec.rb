require_relative '../enumerable_methods'

describe Enumerable do
  let(:numbers) { [2, 1, 3, 7] }
  let(:domains) { { de: 'germany', dk: 'denmark' } }
  let(:various_objects) { [Hash.new, 2, 3.14, "hey", true] }

  describe '#my_each' do
    it 'returns this array' do
      expect(numbers.my_each { |el| el }).to eq(numbers)
    end

    it 'works for several object types' do
      expect(various_objects.my_each { |el| el }).to eq(various_objects)
    end

    it 'works with hashes' do
      expect(domains.my_each { |k, v| "#{k}:#{v}" }).to eq(domains)
      
      expect do
        domains.my_each { |k, v| puts "#{k} => #{v}" }
      end.to output("de => germany\ndk => denmark\n").to_stdout
    end
  end

  describe '#my_each_with_index' do
    it 'returns calling object' do
      expect(numbers.my_each_with_index { |el| el }).to eq(numbers)
    end

    it 'works for several object types' do
      expect(various_objects.my_each_with_index { |el| el }).to eq(various_objects)
    end

    it 'works with hashes' do
      expect(domains.my_each_with_index { |k, v| "#{k}:#{v}" }).to eq(domains)
    end

    it 'accepts index and prints it to the screen' do
      expect do
        domains.my_each_with_index { |k, v| puts "#{k}:#{v}" }
      end.to output("[:de, \"germany\"]:0\n[:dk, \"denmark\"]:1\n").to_stdout

      expect do
        numbers.my_each_with_index { |num, index| puts "#{index}:#{num}" }
      end.to output("0:2\n1:1\n2:3\n3:7\n").to_stdout
    end
  end

  describe '#my_select'

  describe '#my_all?'

  describe '#my_any?'

  describe 'my_none?'

  describe '#my_count'

  describe '#my_map'

  describe '#my_inject'

end
