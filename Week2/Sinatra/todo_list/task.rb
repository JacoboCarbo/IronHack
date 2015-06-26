
require 'rubygems'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'oc1.sqlite'
)

class Task < ActiveRecord::Base
	# we have name, date, done
  validates_presence_of :name, :date, :done

end