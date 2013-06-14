class Task < ActiveRecord::Base
  attr_accessible :content, :done, :title
  validates_presence_of :content
  validates_presence_of :title
  belongs_to :list
  belongs_to :user
end
