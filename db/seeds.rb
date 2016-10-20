# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = User.new(email:'123@1.com', password:'123')
a.save
b = User.new(email:'123@2.com', password:'123')
b.save
c = a.listings.new(title:'Avenger HQ', location:'Manhathan', price:'12000', availability:'2')
c.save

