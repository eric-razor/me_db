class User < ApplicationRecord
    has_many :plant_cards
    has_many :plants, through: :plant_cards

    validates :email, :password presence: true
    validates :username, uniqueness: true
end
