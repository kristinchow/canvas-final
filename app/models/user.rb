# this is the student model, partly generated with devise
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :courses
  has_many :assignments, through: :courses
  has_many :grades, dependent: :destroy
  has_many :photos
end
