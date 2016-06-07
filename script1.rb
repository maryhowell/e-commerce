require "./db/setup"
require "./lib/all"
require 'pry'

puts "How many items are there? #{Item.count}"

#----------------------

most_exspensive_item = Item.new(price: 0.0)
Item.all.each do |i|
  i.price.to_f
  if i.price.to_f > most_exspensive_item.price.to_f
    most_exspensive_item = i
  end
end
puts "What is the most expensive item? #{most_exspensive_item.description}"

#----------------------

address = Address.where(street: "7153 Predovic Falls")
address.first.user_id
user = User.find(96)
puts "#{user.first_name} #{user.last_name} lives at 7153 Predovic Falls?"

#----------------------





puts "How many Mediocre Copper Bottles did we sell? #{} "


# What is our total revenue (item cost * quantity sold for all purchases)?
# How much did Carmelo Towne spend?
# How many users have > 1 address?
