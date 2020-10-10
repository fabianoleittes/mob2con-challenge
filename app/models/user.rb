class User < ApplicationRecord
  has_secure_password
  validates :name, :email, :password_digest, presence: true
  belongs_to :retail_chain, optional: true
  
end
