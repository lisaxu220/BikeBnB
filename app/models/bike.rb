class Bike < ApplicationRecord
  belongs_to :owner, class_name: "User"
  validates :name, :price, :capacity, presence: true
  has_many_attached :photos
  has_one :booking, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_capacity,
    against: [ :name, :capacity ],
    using: {
      tsearch: { prefix: true }
    }
end
