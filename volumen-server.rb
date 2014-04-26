#!/usr/bin/env ruby
require 'sinatra'
set :public_folder, File.dirname(__FILE__)
post '/set'do 
  #raise "Invalid volume: #{volume}" unless volume.between
  puts "request['volume']:", request["volume"]
  volume = request["volume"].to_i rescue nil
  puts 'volume:' , volume
  `amixer set Master #{volume}%`
  redirect '/'
end

get '/' do
  redirect 'index.html' 
end

