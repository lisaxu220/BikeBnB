class Bike < ApplicationRecord
  belongs_to :owner, class_name: "User"
  validates :name, :price, :capacity, presence: true
  has_many_attached :photos

  # include PgSearch::Model
  # pg_search_scope :search_by_name,
  #   against: [ :name],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
