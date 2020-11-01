class User < ApplicationRecord
    has_secure_password
    has_many :plant_cards
    has_many :plants, through: :plant_cards

    validates :username, :email, :password, presence: true
    validates :username, uniqueness: true
end
