# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( 
  email: 'un@sharklasers.com',
  password: '123456',
  birthday: "2021-07-01",
  first_name: 'Dead',
  last_name: 'Moroz',
  address: 'Laplandia',
  role: 'santa',
)
User.create!( 
  email: 'ma@sharklasers.com',
  password: '123456',
  birthday: "2021-07-01",
  first_name: 'Dead',
  last_name: 'Moroz',
  address: 'Laplandia',
  role: 'admin',
)