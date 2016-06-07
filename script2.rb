require "./db/setup"
require "./lib/all"
require 'pry'


puts "What is your first name?"
first_input = gets.chomp
puts "what is your last name?"
last_input = gets.chomp
user = User.where(first_name: first_input, last_name: last_input).first_or_create!
#---------------------

puts "Available items are:"
all_items = Item.all
all_items.each do |item|
  puts "#{item.id}) #{item.description}"
end
#----------------------

puts "Please choose an item"
item_choosen = gets.chomp
item_name = all_items.find_by(id: item_choosen)
#-----------------------

puts "How many #{item_name.description}s would you like?"
quantity = gets.chomp.to_i
#-----------------------

Purchase.create(user_id: user.id, item_id: item_name.id, quantity: quantity)
puts "You have purchased #{quantity} #{item_name.description}s."
