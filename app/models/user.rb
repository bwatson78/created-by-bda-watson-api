class User < ApplicationRecord
  has_many :social_sites
  has_one_attached :headshot
	has_secure_password
	validates_presence_of :email, :password, :password_digest, :admin
	validates :email, 'valid_email_2/email': true
end
