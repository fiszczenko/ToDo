# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#  user_id     :integer          default(0), not null
#

class List < ActiveRecord::Base
  attr_accessible :title, :description
  validates_presence_of :title

  has_many :tasks
  belongs_to :user
end
