require 'bundler'
Bundler.require
require './lib/churchill_scraper'

module Churchill_Generator
  
  class Churchill < Sinatra::Application

    before do
        @quotes = Scraper.new("http://jpetrie.myweb.uga.edu/bulldog.html")
        @quote_array = @quotes.get_quote 
    end 
    
    get '/home' do
      "here are some quotes"
      @quote = @quote_array.sample

      erb :quotes
    end

  end

end