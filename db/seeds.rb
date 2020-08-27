# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email:'admin@sample.com',password:'itoito')
User.create!(name:'テストユーザー１',email:'ito@sample.com',password:'itoito')
User.create!(name:'テストユーザー２',email:'ito2@sample.com',password:'itoito')
User.create!(name:'テストユーザー３',email:'ito3@sample.com',password:'itoito')
User.create!(name:'テストユーザー４',email:'ito4@sample.com',password:'itoito')
User.create!(name:'テストユーザー５',email:'ito5sample.com',password:'itoito')
User.create!(name:'テストユーザー６',email:'ito6@sample.com',password:'itoito')
