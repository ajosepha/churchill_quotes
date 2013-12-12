require 'open-uri'
require 'nokogiri'

class Scraper

    attr_reader :html

    def initialize(url)   
        download = open(url)
        @html = Nokogiri::HTML(download)
    end    

    def get_quote
        #this returns an array
        quote = html.search("p")
        quote1 = quote.map {|name| name.text}
        quote1.map! do |string|
            string.delete! "\r\n"
            string.gsub("\u0093", "")
            string.gsub("\u0094", "")
        end
        quote1.delete_if{|x| x == "" }
        quote1
    end    
end  

 # my_scraper = Scraper.new("http://jpetrie.myweb.uga.edu/bulldog.html") 
 # ap my_scraper.get_quote     