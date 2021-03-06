#!/usr/bin/env ruby
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 8080
set :public_folder, File.dirname(__FILE__)

LAST_VOLUME_FILE = "last_volume"

get '/volume' do
  get_volume
end

post '/volume' do
  volume = request["volume"].to_i
  set_volume(volume)
  200
end

post '/mute' do
  mute
  200
end

post '/unmute' do
  unmute
  [200, get_volume]
end

get '/' do
  redirect 'index.html'
end

def get_volume
  output = `amixer get Master`
  volume = output.match(/\[([0-9]{1,3})%\]/)
  volume && volume[1] || "0"
end

def set_volume(volume)
  raise "invalid volume" unless volume.is_a?(Integer) and volume.between?(0,100)
  `amixer set Master #{volume}%`
end

def mute
  `amixer set Master mute`
end

def unmute
  `amixer set Master unmute`
end
