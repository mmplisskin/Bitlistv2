namespace :get do
  desc "updates rates"
  task :rate => :environment do
    puts "$%$%$%$%$%$% Getting Current BTC Rates $%$%$%$%$%$%"

    btcAvgApi = Net::HTTP.get_response(URI.parse("https://api.bitcoinaverage.com/exchanges/USD"))
    btcAvgAPiResponse = JSON.parse(btcAvgApi.body)

    bitstampApi = Net::HTTP.get_response(URI.parse("http://www.bitstamp.net/api/ticker/"))
    bitstampApiResponse = JSON.parse(bitstampApi.body)

    bitFinexApi = Net::HTTP.get_response(URI.parse("https://api.bitfinex.com/v1/pubticker/BTCUSD"))
    bitFinexApiResponse = JSON.parse(bitFinexApi.body)


    coinbase_rate = btcAvgAPiResponse["coinbase"]["rates"]["last"]
    okcoin_rate = btcAvgAPiResponse["okcoinintl"]["rates"]["last"]
    bitstamp_rate = bitstampApiResponse["last"].to_f
    bitfinex_rate = bitFinexApiResponse["last_price"].to_f

    average_rate = ((coinbase_rate+okcoin_rate+bitstamp_rate+bitfinex_rate)/4).round(2)

    puts "$%$%$%$%$%$% Got The Rates $%$%$%$%$%$%"
    puts "#{bitfinex_rate}" + " is the bitfinex rate"
    puts "#{okcoin_rate}" + " is the okcoin rate"
    puts "#{coinbase_rate}" + " is the coinbase rate"
    puts "#{bitstamp_rate}" + " is the bitstamp rate"
    puts "#{average_rate}" + " is the average rate"

    rate = Rate.first
    rate.average_rate = average_rate
    rate.save


  end
  puts "The Rates have been saved"
end
