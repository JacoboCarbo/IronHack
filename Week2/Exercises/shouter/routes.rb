require 'sinatra'
require 'sinatra/reloader'
require './shouter.rb'


set :port, 3000
enable :sessions

get '/' do
  @current_user = User.find_by_id(session[:id])
  erb :home
end

post '/signup' do
  name = params[:name]
  handle = params[:handle]
  password = params[:password]
  User.create(name: name, handle: handle, password: password)
  redirect '/'
end

get '/login' do
  handle = params[:handle]
  password = params[:password]
  if user = User.find_by_handle(handle)
    if user.password == password
      session[:id] = user.id
      redirect '/'
    end
  end
  redirect '/'
end

get '/logout' do
  session[:id] = nil
  redirect '/'
end

post '/create_shout' do
  message = params[:message]
  User.find_by_id(session[:id]).shouts.create(message: message, likes: 0)
  redirect '/'
end

post '/like_shout' do
  shout = Shout.find(params[:id])
  shout.likes += 1
  shout.save
  redirect '/'
end

get '/user/:id' do |id|
  @user = User.find(id)
  erb :user
end

get '/best/shouts' do
  erb :best_shouts
end

get '/best/users' do
  erb :best_users
end




