class Bike < ApplicationRecord
  belongs_to :owner, class_name: "User"
  validates :name, :price, :capacity, presence: true
end
