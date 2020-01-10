# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all
Transaction.delete_all

Flight.create!(
  [
    { origin: 'Durham', destination: 'Raleigh', cost: 3},
    { origin: 'Chapel Hill', destination: 'Carrboro', cost: 2},
    { origin: 'Cary', destination: 'Garner', cost: 11},
    { origin: 'Bahama', destination: 'Benson', cost: 24},
    { origin: 'Apex', destination: 'Knightdale', cost: 7},
  ]
)
