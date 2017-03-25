require_relative '../bubble_sort'

describe '#bubble_sort' do
  it 'sorts given array' do
    expect(bubble_sort([4, 3, 78, 2, 0, 2])).to eq([0, 2, 2, 3, 4, 78])
  end
end
