class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, presence: true
    validates :password, length: {:in => 8..40,}, presence: true
end
