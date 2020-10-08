require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'


page = Nokogiri::HTML(RestClient.get( "https://coinmarketcap.com/all/views/all/")) 

page.xpath('//h3/a').each do |node|
      puts node.text
end


all_currencies_name = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div//a')

all_currencies_price = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a')

currencies_name_text=[] 
currencies_price_text=[] 

all_currencies_name.each do |currencies_name|
    currencies_name_text << currencies_name.text 
    end
    
all_currencies_price.each do |currencies_price|
    currencies_price_text << currencies_price.text 
    end

combined = Hash[*currencies_name_text.zip(currencies_price_text).flatten]
puts combined
