class Photo < ActiveRecord::Base
  attr_accessor :image
	belongs_to :user
	has_attached_file :image, styles: { medium: "150x150>", thumb: "75x75>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end


