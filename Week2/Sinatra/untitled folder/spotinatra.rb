require 'sinatra'
require 'sinatra/reloader'

set port: 3000

visits ||= 0
songs ||= []

get '/' do
  
  visits += 1
  if songs.size >= 3
    redirect to('/enough')
  end
  @visits = visits
  @songs = songs

  "Number songs: #{songs.count}"
  erb :today

end

post '/songs/new' do
  # Gets info
  name = params[:name]
  author = params[:artist]

  # Stores info
  songs << [name, author]
end

get '/enough' do
  "LEAVE ME ALONE WITH THESE CRAPPY SONGS"
end
