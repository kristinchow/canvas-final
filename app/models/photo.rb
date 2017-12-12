# file submissions, currently only of image type
class Photo < ApplicationRecord
  has_attached_file :image
  belongs_to :assignment
  belongs_to :user
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}
end
