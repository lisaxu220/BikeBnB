class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bikes, foreign_key: :owner_id, dependent: :destroy
  has_many :bookings, foreign_key: :renter_id, dependent: :destroy
  has_many :reviews, foreign_key: :renter_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
