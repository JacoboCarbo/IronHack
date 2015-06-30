# OC1. IronhackLIST

# Oh, man. We are so proud of our Student class. Validated, short, compact. Is it love?

# Anyway, the thing you probably missed from SL7 is having some web in between. Some routes, some Sinatra, some ERB… so let’s do it, why
# not?

# You will now implement a Ironhack directory of students, that shows a list of everyone’s name, surname, birthday, a clickable link to
# their website, if they have programming experience or not (Yes/No) and, more importantly, ¡the number of dogs they have!

# Apart from that, you should be able to create new students through the interface, and also delete the ones which have 0 dogs (we cannot
# kick the others out, they have dogs!).

# Go for it!
require 'rubygems'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'oc1.sqlite'
)

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16
  DOGS_MINIMUM = 0

  validate :name_not_empty, :surname_not_empty, :website_format

  def complete_name
  	full_name = name + " " + surnames
  end

  private

  def name_not_empty
  	if name == nil
  		errors.add(:name, 'cannot be empty')
  	end
  end

  def surname_not_empty
  	if surnames == nil
  		errors.add(:surname, 'cannot be empty')
  	end
  end

  def website_format
  	unless website.start_with?("http:")
  		errors.add(:website, "must start with 'http:'" )
  	end
  end

  def proper_number_of_dogs
  	unless number_of_dogs > DOGS_MINIMUM
  		errors.add(:number_of_dogs, "must have at least 5 dogs!")
  	end
  end


end