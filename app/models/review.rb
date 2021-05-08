class Review < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :booking
end
