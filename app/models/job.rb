class Job < ApplicationRecord
    has_many :jobapps
    has_many :users, through: :jobapps

    validates :name, presence: true
    
    before_create do
        self.name = login.capitalize if name.blank?
    end
end
