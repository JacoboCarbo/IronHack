# OC2. The Sinatra TODO

# In the good old days, programming a basic blog was the "Hello World!" for the web. Now it seems to be writing a TODO list,
# as if we wanted to overthrone Evernote for that. So let's be hipsters about it, and do the job!

# Let's use Sinatra for that! Write a small application that allows us to:

# - Add tasks to a list
# - Clicking over a task should mark it as done
# - Once done we should be able to delete a task
# - The date of creation should be shown together with the task
# - If the task contains the word urgent the task will become the most prioritary
# - The task list should be saved in a file so we can restart the application and the tasks should persist.
# OC1. IronhackLIST

require 'sinatra'
require 'sinatra/reloader'
require './task.rb'
require 'pry'

set :port, 3000
set :bind, "0.0.0.0"
enable :sessions

last_id ||= 0
users ||= {}

get '/' do
  @users = users
  if session[:id]
    @current_user = users[session[:id]]
  end

  erb :home
end

post '/signup' do
  name = params[:name]
  last_id += 1
  users[last_id] = name
  session[:id] = last_id
  redirect '/'
end

post '/task/add' do
  name = params[:name]
  date = params[:date]
  done = params[:done]

  task = Task.new(params)

  redirect '/'
end

post '/task/:id' do
	student = Student.find(params[:id])
	p student
	student.destroy
	redirect '/'
end






