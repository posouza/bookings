class User < ApplicationRecord
  #Hashed password is more secured
  has_secure_password
end
