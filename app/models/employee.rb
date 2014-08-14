class Employee < ActiveRecord::Base
	belongs_to :copy_center
  has_many :tickets
  has_many :comments
  has_many :passdowns
end
