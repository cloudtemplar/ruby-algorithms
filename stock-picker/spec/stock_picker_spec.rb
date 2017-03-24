require_relative '../stock_picker'

describe StockPicker do
  it 'Returns a pair of days representing the best day to buy and sell.' do
    # for a profit of $15 - $3 == $12
    expect(StockPicker.pick([17,3,6,9,15,8,6,1,10])).to eq([1,4])
    # for a profit of $21 - $1 == $20
    expect(StockPicker.pick([2,1,3,7,8,1,21,16])).to eq([1,6])
  end

  # Edge cases
  it 'Works when highest price is on the first day' do
    expect(StockPicker.pick([88,3,7,8,1,33,16,21])).to eq([4,5])
  end

  it 'Works when lowest price is on the last day' do
    expect(StockPicker.pick([2,3,7,8,21,16,1])).to eq([0,4])
  end

end
