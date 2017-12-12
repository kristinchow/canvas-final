# this is the course model, owned by an instructor
class Course < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :assignments, dependent: :destroy
  has_many :grades, through: :assignments
  belongs_to :admin
  validates_presence_of :title, :description
  validates_uniqueness_of :title
end
