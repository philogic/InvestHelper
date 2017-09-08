class Stock < ActiveRecord::Base

  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.retrieve_from_api(ticker_symbol)
    found_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless found_stock.name

    my_stock = new(ticker: found_stock.symbol, name: found_stock.name)
    my_stock.last_price = my_stock.price
    my_stock
  end

  def price
    final_price = StockQuote::Stock.quote(ticker).close
    final_price.to_s if final_price

    starting_price = StockQuote::Stock.quote(ticker).open
    starting_price.to_s if starting_price
  end
end
