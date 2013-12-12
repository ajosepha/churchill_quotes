require 'bundler'
require 'nokogiri'
Bundler.require
require './lib/churchill_scraper'

module Churchill_Generator
  
  class Churchill < Sinatra::Application

    before do
        @quotes = Scraper.new("http://jpetrie.myweb.uga.edu/bulldog.html")
        @quote_array = @quotes.get_quote 
        @images = Dir["./public/images/*"].map {|image| "/images/#{Pathname.new(image).basename}"}
    end 
    
    get '/home' do
      "here are some quotes and pictures"
      @quote = @quote_array.sample
      @image = @images.sample

      erb :quotes
    end

  end

end