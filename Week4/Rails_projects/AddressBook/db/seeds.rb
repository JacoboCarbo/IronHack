# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 25.times do |i| 
# 	Contact.create(
# 		name: "My name #{i}",
# 		address: "Address #{i}",
# 		primary_phone: i,
# 		primary_email: "#{i}@gmail.com")
# end


contact1 = Contact.create(
	name:"Jacobo",
 	address: "Avenida de los Alhelies",
 	primary_phone: 699045011
 	)

contact1.entries.create(hours: 0, minutes: 15, comments: " Hello", date: Date.current)
contact1.entries.create(hours: 2, minutes: 36, comments: " Hello", date: Date.current)