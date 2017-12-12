# assignment model, I'm almost certain the has_one grade relation is unused as grades
# are related to both a user and assignment, an assignment doesn't just have a blanket grade
class Assignment < ApplicationRecord
  belongs_to :course
  has_many :users, through: :courses
  has_one :grade
  has_one :photo
end
