class Jobapp < ApplicationRecord
    belongs_to :job
    belongs_to :user

    validates :name, presence: true
end
