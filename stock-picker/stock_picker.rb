class StockPicker

  def self.pick(days)
    best_profit = 0
    best_days = []
    days.each_with_index do |buy_price, buy_day|
      days[buy_day..-1].each_with_index do |sell_price, sell_day|
        if sell_price - buy_price > best_profit
          best_profit = sell_price - buy_price
          best_days.replace([buy_day, sell_day + buy_day])
        end
      end
    end
    best_days
  end

end
