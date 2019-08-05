class User < ApplicationRecord
	has_secure_password
	validates_presence_of :email, :password, :password_digest, :admin
	validates :email, 'valid_email_2/email': true
end
