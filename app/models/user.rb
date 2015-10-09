class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :photos, dependent: :destroy
	# has_attached_file :photo, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
end
