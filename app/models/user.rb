class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 8 }, presence: true, confirmation: true
    validates :password_confirmation, presence:  true, length: { minimum: 8 }
  end