require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'


page = Nokogiri::HTML(RestClient.get('http://annuaire-des-mairies.com/val-d-oise.html')) 

page.xpath('//a/@href').each do |node|
    node = node.to_s
    townhall_url = townhall_url.to_s
    if node[0..3]=="./95"
        townhall_url = "http://www.annuaire-des-mairies.com" + node[1..-1]
            puts townhall_url
            #TOWN_URL << townhall_url

     #node = node[5..-1]
     #node = node.chomp(".html")
     #puts node
     #TOWN_LIST << node
    else
    end
    
end

def get_townhall_urls(district_url)
    page = Nokogiri::HTML(RestClient.get(district_url)) 

    page.xpath('/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/p[2]/object/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[@class="lientxt"]/@href').each do |district|
        puts district
    end



end

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(RestClient.get(townhall_url)) 

    page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
    puts email.text

    end
end

#page = Nokogiri::HTML(RestClient.get("http://annuaire-des-mairies.com/95/aincourt.html")) 


def perform
    district_url = "http://annuaire-des-mairies.com/val-d-oise.html"
    get_townhall_urls(district_url)
    townhall_url = "http://annuaire-des-mairies.com/95/aincourt.html"
    get_townhall_email(townhall_url)
end
perform