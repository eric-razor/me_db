# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


john = User.create(username: "John_dough", email:"j.dough@email.com", password:"password")

agar = Category.create(name:"agar")

post = Post.create!(title: "New agar tek", content: "this new agar tek works...", user_id: 1, category_id: 1)

comment = Comment.create(content: "Thank you; works grate", user_id: 1, post_id: 1)