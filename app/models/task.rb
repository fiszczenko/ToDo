# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  done       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  list_id    :integer          default(0), not null
#  user_id    :integer          default(0), not null
#

class Task < ActiveRecord::Base
  attr_accessible :content, :done, :title
  validates_presence_of :content
  validates_presence_of :title
  belongs_to :list
  belongs_to :user
end
