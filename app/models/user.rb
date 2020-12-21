require 'digest'

class User < ApplicationRecord
    has_secure_password
    attr_accessor :password
    attr_reader :hashed_password
    validates :username, uniqueness: true
    validates_confirmation_of :password,
        :if => lambda {|user| user.new_record? or not user.password.blank?}
    validates_length_of :password, :within => 5..40,
        :if => lambda {|user| user.new_record? or not user.password.blank?}

    def self.hashed(str)
        # Hashes password
        str = Digest::SHA1.new.to_s
        return str
    end



    # returns user object if credentials are found. Nil if none
    def self.authenticate(user_info)
        @user = find_by_username(user_info[:username])
        if @user && @user.hashed_password == hashed(user_info[:password])
            return @user
        end
    end

    private 

    before_save :update_password

    def update_password
        if not password.blank?
            self.hashed_password = self.class.hashed(password)
        end
    end
end
