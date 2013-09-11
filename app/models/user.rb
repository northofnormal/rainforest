class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :password, on: :create
	validates_presence_of :email

	has_many :reviews
	has_many :products :through => :reviews
end
