class User < ActiveRecord::Base

   before_save {self.email = email.downcase}
   before_save {self.roll = roll.upcase }

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 50},format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :roll, presence: true, length: {is: 9}
  validates :password, presence: true
  has_secure_password
end


def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

def User.new_token
  SecureRandom.urlsafe_base64
end
