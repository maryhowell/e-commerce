class Item  < ActiveRecord::Base
  validates_presence_of :description, :price, :category

  has_many :purchases
end
