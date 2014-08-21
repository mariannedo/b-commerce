# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_marianne = User.create(
  email: "marianne.do@barrelny.com",
  first_name: "Marianne",
  last_name: "Do",
  username: "mariannedo",
  password: "barrel11",
  password_confirmation: "barrel11"
)
#user_marianne.skip_confirmation!
user_marianne.save

user_shayra = User.create(
  email: "sharya.kamal@barrelny.com",
  first_name: "Shayra",
  last_name: "Kamal",
  username: "shayrakamal",
  password: "barrel11",
  password_confirmation: "barrel11"
)
#user_shayra.skip_confirmation!
user_shayra.save

user_crystal = User.create(
  email: "crystal.ellis@barrelny.com",
  first_name: "Crystal",
  last_name: "Ellis",
  username: "crystalellis",
  password: "barrel11",
  password_confirmation: "barrel11"
)
#user_crystal.skip_confirmation!
user_crystal.save

user_jenna = User.create(
  email: "jenna.steckel@barrelny.com",
  first_name: "Jenna",
  last_name: "Steckel",
  username: "jennasteckel",
  password: "barrel11",
  password_confirmation: "barrel11"
)
#user_jenna.skip_confirmation!
user_jenna.save

user_diane = User.create(
  email: "diane.wang@barrelny.com",
  first_name: "Diane",
  last_name: "Wang",
  username: "dianewang",
  password: "barrel11",
  password_confirmation: "barrel11"
)
#user_diane.skip_confirmation!
user_diane.save

user_lucas = User.create(
  email: "lucas.ballasy@barrelny.com",
  first_name: "Lucas",
  last_name: "Ballasy",
  username: "lucasballasy",
  password: "barrel11",
  password_confirmation: "barrel11"
)
#user_lucas.skip_confirmation!
user_lucas.save