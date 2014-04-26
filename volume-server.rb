#!/usr/bin/env ruby
require 'sinatra'
set :bind, '0.0.0.0'
set :port, 8080
set :public_folder, File.dirname(__FILE__)
get '/volume' do
  output = `amixer get Master`
  volume = output.match(/\[([0-9]{1,3})%\]/)
  volume && volume[1] || "0"
end

post '/volume' do
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
