class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  validates :email, format: {with: VALID_EMAIL_REGEX}, presence: true, uniqueness: true
  validates :name, length: {maximum: 50}, presence: true
  validates :password, length: {minimum: 8}, presence: true, on: :create
  validates :password, length: {minimum: 8}, presence: true, on: :update,
    :unless => lambda { |user| user.password.blank? }

  before_save { self.email = email.downcase }

end
