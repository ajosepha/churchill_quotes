require 'open-uri'
require 'nokogiri'
require 'ap'
require 'debugger'

class Scraper

    attr_reader :html

    def initialize(url)
        
        download = open(url)
        @html = Nokogiri::HTML(download)
    end    

    def get_quote
        quote = html.search("p")
        quote1 = quote.map {|name| name.text}
        quote1.map! do |string|
            string.delete "\r\n"
        end
        ap quote1
    end    
end  

my_scraper = Scraper.new("http://jpetrie.myweb.uga.edu/bulldog.html")
my_scraper.get_quote      