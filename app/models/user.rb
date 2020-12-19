class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates_confirmation_of :password, :on => :create
    validates_length_of :password, :within => 5..40

    # returns user object if credentials are found. Nil if none
    def self.authenticate(user_info)
        find_by_username_and_password(user_info[:username],user_info[:password])
    end
end
