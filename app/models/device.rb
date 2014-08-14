class Device < ActiveRecord::Base
  has_many :issue_types
end
