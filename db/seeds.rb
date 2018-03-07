# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cat1 = Cat.create(name: "Wiggles", birth_date: DateTime.now, color: "purple", sex: "F", description: "catastic")



cat_request = CatRentalRequest.create(cat_id: cat1.id, start_date: DateTime.now, end_date: (DateTime.now + 7), status: "APPROVED")
