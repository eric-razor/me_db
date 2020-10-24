class User < ApplicationRecord
    has_many :plant_cards
    has_many :plants, through: :plant_cards

    validates :name, presence: true
end
