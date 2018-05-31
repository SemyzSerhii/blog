# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

password = 'password'
count = ENV.fetch('count', '1').to_i

def save_and_notify(entity)
  if entity.save
    puts "SUCCESS: #{entity.class}"
  else
    puts "ERROR: #{entity.class} #{entity.errors.full_messages}"
  end
end

count.times do |i|
  puts "STARTED CREATING #{i + 1}"
  user = User.new(
    username: Faker::Internet.user_name,
    password: password
  )
  user.build_avatar(url: Faker::Placeholdit.image)

  save_and_notify(user)

  billing_info = BillingInfo.new(
    last4: Faker::Number.number(4),
    country: Faker::Address.country,
    brand: Faker::Business.credit_card_type,
    user_id: user.id
  )
  save_and_notify(billing_info)

  book = user.books.build(body: Faker::Book.title)
  save_and_notify(book)

  post = user.posts.build(
    title: Faker::RickAndMorty.character,
    body: Faker::RickAndMorty.quote
  )
  post.build_cover(url: Faker::Placeholdit.image)
  save_and_notify(post)

  comment = user.comments.build(
    body: Faker::HarryPotter.quote,
    post: post
  )
  save_and_notify(comment)
end
