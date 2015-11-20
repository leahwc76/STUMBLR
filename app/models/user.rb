class User < ActiveRecord::Base
	attr_accessor :password
	validates_confirmation_of :password
	before_save :encrypt_password
	validates_presence_of :username, :fname, :lname, :email
	validates_presence_of :password, :password_confirmation, on: :create
	validates_uniqueness_of :email
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :photos, dependent: :destroy
	# has_attached_file :photo, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(email, password)
		user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

end
