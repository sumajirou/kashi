#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'addressable/uri'

url = ARGV[0] || 'https://www.uta-net.com/search/?Aselect=1&Bselect=3&Keyword=babymetal&sort=4'
begin
  url = Addressable::URI.encode(url)
  unless url.include?('https://www.uta-net.com') then
    raise URI::InvalidURIError
  end
rescue
  STDERR.puts "invalid URL."
  exit 1
end

begin
  html = Nokogiri::HTML(URI.open(url))
rescue
  STDERR.puts "Not Found."
  exit 1
end

puts ["[index]","[タイトル]", "[歌手]", "[作詞家]", "[作曲家]", "[URL]"].join("\t")
html.css('tbody tr').each_with_index do |row, i|
  title = row.css('.td1 a').first.text
  artist = row.css('.td2 a').first.text
  lyricist = row.css('.td3 a').first.text
  composer = row.css('.td4 a').first.text

  path = row.css('.td1 a').first.attributes['href'].value
  song_url = 'https://www.uta-net.com' + path

  puts ["%2d" % i,title, artist, lyricist, composer, song_url].join("\t")
end

