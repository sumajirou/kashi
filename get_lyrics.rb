#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'addressable/uri'

url = ARGV[0] || ''
exit unless url.include?('https://www.uta-net.com')

html = Nokogiri::HTML(URI.open(url))

puts "【#{html.css('h2').first.text}】"

song_title = html.css('h2')
kashi_area = html.css('#kashi_area').first
kashi = kashi_area.inner_html.gsub(/<br>/, "\n")
puts kashi
