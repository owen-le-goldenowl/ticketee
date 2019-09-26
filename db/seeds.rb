# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
admin = User.create!(name: 'admin', email: 'admin@sample.com', password: '123', password_confirmation: '123', admin: true)

u1 = User.create!(name: 'u1', email: 'u1@example.com', password: '123', password_confirmation: '123', admin: false)
u2 = User.create!(name: 'u2', email: 'u2@example.com', password: '123', password_confirmation: '123', admin: false)
u3 = User.create!(name: 'u3', email: 'u3@example.com', password: '123', password_confirmation: '123', admin: false)

p1 = Project.create!(name: 'p1', description: 'p1' * 10)
p2 = Project.create!(name: 'p2', description: 'p2' * 10)
p3 = Project.create!(name: 'p3', description: 'p3' * 10)

p1.tickets.create!(title: 't1', description: 't1' * 10, user: u1)
p1.tickets.create!(title: 't2', description: 't2' * 10, user: u2)
p1.tickets.create!(title: 't3', description: 't3' * 10, user: u3)
p1.tickets.create!(title: 't4', description: 't3' * 10, user: admin)

p2.tickets.create!(title: 't1', description: 't1' * 10, user: u1)
p2.tickets.create!(title: 't2', description: 't2' * 10, user: u2)
p2.tickets.create!(title: 't3', description: 't3' * 10, user: u3)
p2.tickets.create!(title: 't4', description: 't3' * 10, user: admin)

p3.tickets.create!(title: 't1', description: 't1' * 10, user: u1)
p3.tickets.create!(title: 't2', description: 't2' * 10, user: u2)
p3.tickets.create!(title: 't3', description: 't3' * 10, user: u3)
p3.tickets.create!(title: 't4', description: 't3' * 10, user: admin)


