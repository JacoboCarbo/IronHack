# OC1. IronhackLIST

# Oh, man. We are so proud of our Student class. Validated, short, compact. Is it love?

# Anyway, the thing you probably missed from SL7 is having some web in between. Some routes, some Sinatra, some ERB… so let’s do it, why
# not?

# You will now implement a Ironhack directory of students, that shows a list of everyone’s name, surname, birthday, a clickable link to
# their website, if they have programming experience or not (Yes/No) and, more importantly, ¡the number of dogs they have!

# Apart from that, you should be able to create new students through the interface, and also delete the ones which have 0 dogs (we cannot
# kick the others out, they have dogs!).

# Go for it!
require 'sinatra'
require 'sinatra/reloader'
require './student.rb'
require 'pry'

set :port, 3001
set :bind, "0.0.0.0"

get '/' do
  erb :home
end

post '/students/add' do
  name = params[:name]
  surnames = params[:surnames]
  website = params[:website]
  birthday = params[:birthday]
  number_of_dogs = params[:number_of_dogs]
  first_programming_experience = params[:first_programming_experience]

  student = Student.new({
    "name"=>name, "surnames"=>surnames, "website"=>website, "birthday"=>birthday, "number_of_dogs"=>number_of_dogs, "first_programming_experience"=>first_programming_experience
    })
  student.save

  if student.valid?
    student.save
    puts "#{student.name} added"
  else
    puts student.errors
  end

  redirect '/'
end

post '/students/:id' do
	student = Student.find(params[:id])
	student.destroy
	redirect '/'
end






