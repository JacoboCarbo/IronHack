# SL7. Valid students are valid students

# You loved the example about students, huh? Let’s student you up then!

# So we are going to do some implementation on this Student class with the following:
# 1. Add a “complete_name” method.
# 2. Add some more validations of your own. For example, we won’t accept students born before 1970 that have more
# than one dog, and we also won’t accept students which have “Llorenç" and "Sharon" name, because we want them to be the only ones in Ironhack <3
# the same with “Nick”, because we love him starting at us doing yoga)
# 3. Finally, remove all the ActiveRecord validations and implement them on your own with the “validate” DSL method. Let’s go, folks!

# Note: you will find a student.rb template file and the student.sqlite database in Slack.
require 'rubygems'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'activerecord.sqlite'
)

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16
  DOGS_MINIMUM = 0

  validate :name_not_empty, :surname_not_empty, :website_format, :special_validation

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

  def special_validation
  	unless birthday < (AGE_MINIMUM).years.ago && number_of_dogs > DOGS_MINIMUM
  		errors.add("Need to be #{AGE_MINIMUM} years old and have at least #{DOGS_MINIMUM}")
  	end
  end


end



