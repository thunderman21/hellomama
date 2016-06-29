class Picture < ActiveRecord::Base
  belongs_to :group_post

  #attachment for the pictures
  #no styles for now
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
