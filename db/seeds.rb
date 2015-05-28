# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({first_name: "Dr. Sigmund", last_name: "Freud", email: "provider@example.com", password: "1234567890", is_provider: true})
User.create({first_name: "Dolores", last_name: "De Cabeza", email: "patient@example.com", password: "1234567890"})
