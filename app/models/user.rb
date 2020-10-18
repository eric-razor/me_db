class User < ApplicationRecord
    has_many :jobs
    has_many :jobapps, through: :jobs

    validates :name, presence: true
end
