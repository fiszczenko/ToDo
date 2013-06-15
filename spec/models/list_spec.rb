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

require 'spec_helper'

describe List do
  pending "add some examples to (or delete) #{__FILE__}"
end
