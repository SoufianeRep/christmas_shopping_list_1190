# lib/scraper.rb
require 'nokogiri'
require 'open-uri'

def etsy_scraper(keyword)
  # filepath = "lib/results.html"

  # html_content = File.open(filepath)
  html_content = URI.open("https://www.etsy.com/search?q=#{keyword}", "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read

  doc = Nokogiri::HTML.parse(html_content)

  # create an empty
  etsy_list = {}
  doc.search('.v2-listing-card__info .v2-listing-card__title').first(5).each do |element|
    # add element to my empty hash
    # hash[item] = false
    # item = element.text.strip.split.first(6).join(' ')
    item = element.text.strip.split(',')[0]
    etsy_list[item] = false
  end
  # return the etsu hash
  return etsy_list
end

p etsy_scraper('kjsfsjhdfj')
