require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'

page = Nokogiri::HTML(RestClient.get( "https://coinmarketcap.com/all/views/all/")) 