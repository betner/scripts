require 'nokogiri'
require 'httparty'


def extract_name(elements)
  names = []
  elements.each do |elem|
    names << elem.text
  end
  return names
end

page = HTTParty.get('http://svampguiden.com/matsvampar/lista/')

snamn_elem = Nokogiri::HTML(page).css('.caption').css('.snamn')
vnamn_elem = Nokogiri::HTML(page).css('.caption').css('.vnamn')

names = extract_name snamn_elem
lat_names = extract_name vnamn_elem

name_hash = Hash[names.zip(lat_names)]

name_hash.map do |k, v|
  printf("%s:%s\n", k, v)
end
