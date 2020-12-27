class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, presence: true
    validates :password, length: {:in => 8..40,}, presence: true

    has_many :posts
    has_many :comments
    has_many :commented_posts, through: :comments,
        source: :post
    # sourced based on comment model :post
    

    
end
