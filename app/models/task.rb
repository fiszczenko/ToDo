class Task < ActiveRecord::Base
  attr_accessible :content, :done, :title
end
