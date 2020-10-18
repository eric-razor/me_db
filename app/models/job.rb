class Job < ApplicationRecord
    has_many :jobapps
    has_many :users, through: :jobapps
end
