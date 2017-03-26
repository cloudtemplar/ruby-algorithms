require_relative '../enumerable_methods'

describe Enumerable do
  let(:numbers) { [2, 1, 3, 7] }
  let(:domains) { { de: 'germany', dk: 'denmark' } }
  let(:various_objects) { [Hash.new, 2, 3.14, "hey", true] }
  let(:pet_names) { %w( Bailey Bella Buddy ) }
  let(:car_makes) { %w( Bentley Mercedes Chrysler ) }

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

  describe '#my_select' do
    # let(:numbers) { [2, 1, 3, 7] }
    # let(:domains) { { de: 'germany', dk: 'denmark' } }
    let(:domes) { { dk: 'denmark' } }
    it 'returns an array of elements for which the block\'s return value was truthy' do
      expect(numbers.my_select { |el| el > 2 }).to eq([3, 7])
      expect(numbers.my_select { |el| true }).to eq([2, 1, 3, 7])
    end

    it 'works with hashes' do
      expect(domains.my_select { |domain, country| country[0] == 'd' }).to eq({:dk=>"denmark"})
    end

    it "doesn't return elements for which the block was falsey" do
      expect(numbers.my_select { |el| false }).to eq([])
      expect(domains.my_select { |domain, country| country[0] == 'x' }).to eq({})
    end
  end

  describe '#my_all?' do
    # let(:pet_names) { %w( Bailey Bella Buddy ) }
    # let(:car_makes) { %w( Bentley Mercedes Chrysler ) }
    it 'returns true if block\'s return value was truthy for each element' do
      expect(pet_names.my_all? { |name| name[0].downcase == 'b' }).to be_truthy
    end
    it 'returns false if any of the block\'s return values was falsey' do
      expect(car_makes.my_all? { |name| name[0].downcase == 'b' }).to be_falsey
    end
  end

  describe '#my_any?' do
    # let(:numbers) { [2, 1, 3, 7] }
    it 'returns true if block\'s value was truthy for any of the elements' do
      expect(numbers.my_any? { |el| el > 3 }).to be_truthy
    end

    it 'returns false if block\'s value was falsey for all of the elements' do
      expect(car_makes.my_any? { |make| make[0] == 'A'}).to be_falsey
    end
  end

  describe 'my_none?' do
    it 'returns true if block\'s value was falsey for all of the elements' do
      expect(car_makes.my_none? { |make| make[0] == 'A'}).to be_truthy
    end
  end

  describe '#my_count' do
    # let(:numbers) { [2, 1, 3, 7] }
    it 'returns the size of an array' do
      expect(numbers.my_count).to eq(4)
    end

    # let(:domains) { { de: 'germany', dk: 'denmark' } }
    it 'returns the size of a hash' do
      expect(domains.my_count).to eq(2)
    end
  end

  describe '#my_map' do
    # let(:numbers) { [2, 1, 3, 7] }
    it 'returns an array of each block\'s value' do
      expect(numbers.my_map { |num| num.to_s + 'foo' }).to eq(['2foo', '1foo', '3foo', '7foo'])
      expect(numbers.my_map { |num| 'quux' }).to eq(['quux', 'quux', 'quux', 'quux'])
    end
  end

  describe '#my_inject' do
    # let(:numbers) { [2, 1, 3, 7] }
    it 'returns memory value after each block pass and returns memo at the end' do
      expect(numbers.my_inject { |memo, num| memo + num }).to eq(13)
      expect(numbers.my_inject { |memo, num| 666 }).to eq(666)
    end
  end

end
