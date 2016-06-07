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

bottle = Item.find_by(description: "Mediocre Copper Bottle")
sold = bottle.purchases.map{ |p| p.quantity}.reduce(:+)
puts "How many Mediocre Copper Bottles did we sell? #{sold} "
#---------------------

purchases = Purchase.all
total_revenue = purchases.map { |p| (p.item.price.to_f)*(p.quantity)}.reduce(:+)

puts "What is our total revenue was $#{total_revenue.round(2)}."
#--------------------

all_users = User.all
carmelo = User.find_by(first_name:"Carmelo",last_name: "Towne")
spent = Purchase.where(user_id: carmelo.id).map { |p| (p.item.price.to_f)*(p.quantity)}.reduce(:+)
puts "Carmelo Towne spent $#{spent}."
#--------------------

#all_users
addresses = all_users.select{|u| u.addresses.count > 1}
addresses_over_one = addresses.count
puts "#{addresses_over_one} users have more than one address?"
