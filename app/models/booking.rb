class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :bike
  validates :start_time, :end_time, :renter_id, :bike_id, presence: true
end
