# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.new( email: "pro@lewagon.com", password:"password")
admin.save!

category = Category.new( category: "Limpieza")
Category.new( category: "Sanitizacion").save!
Category.new( category: "Mantenimiento").save!
category.save!

Service.create(user: admin, category: category, title: "Limpieza de oficinas", description: "Limpieza profunda para sus oficinas", price: 20000, execution_time: 2, warranty: "si")
Service.create(user: admin, category: category, title: "Limpieza de autos", description: "Limpieza profunda para sus autos", price: 30000, execution_time: 2, warranty: "si")
Service.create(user: admin, category: category, title: "Limpieza de aviones", description: "Limpieza profunda para sus aviones", price: 500000, execution_time: 2, warranty: "si")
Service.create(user: admin, category: category, title: "Limpieza de transbordador", description: "Limpieza profunda para sus transbordador", price: 1000000, execution_time: 2, warranty: "si")