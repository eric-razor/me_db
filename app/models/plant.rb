class Plant < ApplicationRecord
    has_many :plant_cards
    has_many :users, through: :plant_cards
end
