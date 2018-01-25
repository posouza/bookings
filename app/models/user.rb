class User < ApplicationRecord
  #Hashed password is more secured
  has_secure_password
  #This prevents user to register with an empty e-mail field.
  validates name, presence: true, length: {maximum: 50}
  validates password, presence: true, length: {minimum: 6}
  validates email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  before_save { self.email = email.downcase }
end
