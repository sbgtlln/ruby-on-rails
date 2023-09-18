require 'HTTParty'
require 'nokogiri'

url = 'https://anekdot.ru/best/anekdot/0918'
html = HTTParty.get(url)
doc = Nokogiri::HTML(html)

puts doc.css('.text')[0].text