#!/usr/bin/env ruby

require 'open3'
require 'uri'

url = ARGV.first
u = URI.parse(url)
output = u.host
real_output = output.gsub(".", "") + ".jpg"
output = output + "_raw.png"

puts "Processing #{url} as #{output}"
puts "Sending output to #{real_output}"

#Open3.popen3 "phantomjs rasterize.js #{url} #{output} && convert #{output} -resize 400x800^ -gravity north -extent 400x200 #{real_output} && rm #{output}"
Open3.popen3 "phantomjs rasterize.js #{url} #{output} && convert #{output} -resize 400x200 -gravity north -extent 400x200 #{real_output} && rm #{output}"
