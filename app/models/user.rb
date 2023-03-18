class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :name, presence: true
    validates :password, presence: true, length: {minimum: 6} 

    has_secure_password 
    validates :email, presence: true, uniqueness: { case_sensitive: false }
end
