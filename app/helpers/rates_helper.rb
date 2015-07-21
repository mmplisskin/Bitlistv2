module RatesHelper
  def current_rate
    rate = Rate.first.average_rate
  end
end
