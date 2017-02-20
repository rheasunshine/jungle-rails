class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :password_digest, presence: true
  validates_confirmation_of :password
  validates :password_digest, length: {minimum: 3}
end
