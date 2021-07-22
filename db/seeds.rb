# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Shelter.destroy_all
# Pet.destroy_all
# Application.destroy_all
# PetApplication.destroy_all
# # require 'pry'; binding.pry
# foothills = Shelter.create!(name: "Foothills Animal Shelter", city: "Golden", rank: 5)
# dumb_friends = Shelter.create!(name: "Dumb Friend's League", city: "Aurora", rank: 3)
# davids = VeterinaryOffice.create!(name: "David's Vet Practice", max_patient_capacity: 13)
# pinnacle = VeterinaryOffice.create!(name: "Pinnacle Pet", max_patient_capacity: 70)

# pet_1 = foothills.pets.create!(name: "legolis", breed: "Fish", age: 9, adoptable: true)
# pet_2 = foothills.pets.create!(name: "Zeke", breed: "Zebra", age: 1, adoptable: true)
# pet_3 = foothills.pets.create!(name: "Bam", breed: "Husky", age: 3, adoptable: false)
# pet_4 = dumb_friends.pets.create!(name: "Paul", breed: "Bat", age: 16, adoptable: true)
# pet_5 = dumb_friends.pets.create!(name: "Bag", breed: "Polar Bear", age: 6, adoptable: true)
# pet_6 = dumb_friends.pets.create!(name: "Pane", breed: "Doberman", age: 30, adoptable: false)

# davids.veterinarians.create!(name: "Dale Gribble", review_rating: 4, on_call: false)
# davids.veterinarians.create!(name: "Hank Hill", review_rating: 5, on_call: false)
# pinnacle.veterinarians.create!(name: "Boomhouer", review_rating: 3, on_call: true)
# pinnacle.veterinarians.create!(name: "Dale Dauterive", review_rating: 2, on_call: true)
# pinnacle.veterinarians.create!(name: "Lucky", review_rating: 1, on_call: true)

# # Applications begin here:
# app1 = Application.create!(name: "Dee", address: "123 Wayward S", city: "Denver", state: "CO", zip_code: "80122", status: 1, description: "Pets are cool.")
# app2 = Application.create!(name: "Christian Bell", address: "3421 Sleepy Rd", city: "Boulder", state: "CO", zip_code: "81302", status: 0, description: "Yes")
# app3 = Application.create!(name: "Messi", address: "4 Carp Dr", city: "Callahan", state: "CO", zip_code: "80915", status: 3, description: "Pets for me please")
# app4 = Application.create!(name: "Franck Sanatra", address: "66 Garage Ln", city: "Englewood", state: "CO", zip_code: "80110", status: 2, description: "Music is good for the soul")
# #Create PetApps
# PetApplication.create!(pet_id: pet_1.id,application_id: app1.id)
# PetApplication.create!(pet_id: pet_2.id,application_id: app1.id)
# PetApplication.create!(pet_id: pet_3.id,application_id: app2.id)
# PetApplication.create!(pet_id: pet_4.id,application_id: app2.id)
# PetApplication.create!(pet_id: pet_5.id,application_id: app3.id)
# PetApplication.create!(pet_id: pet_6.id,application_id: app3.id)
# # require 'pry'; binding.pry
# # Adding pets to applications
# # app1.pets << pet_1
# # app1.pets << pet_2
# # app2.pets << pet_3
# # app2.pets << pet_4
# # app3.pets << pet_5
# # app3.pets << pet_6
# # require 'pry'; binding.pry
