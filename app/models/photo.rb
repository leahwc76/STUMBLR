class Photo < ActiveRecord::Base
belongs_to :user
# has_attached_file :image, styles: { thumb: ["64x64#", :jpg], small: ['150x150>'], medium: ['250x250>'], original: ['500x500>', :jpg] }, convert_options: { thumb: "-quality 75 -strip", original: "-quality 85 -strip" }
# has_attached_file :image, url: "/system/:hash.:extension", hash_secret: "abc123"
# has_attached_file :image, preserve_files: "true"
# validates_attachment :image, presence: true, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, size: { in: 0..1700.kilobytes }
# validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	has_attached_file :image, styles: { medium: "150x150>", thumb: "75x75>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end


