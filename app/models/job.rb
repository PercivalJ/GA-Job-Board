class Job < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :through => :users
  has_many :likes, :through => :users
end
