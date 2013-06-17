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
	before { @list = List.new(title: "example", description: "example descr") }

	subject { @list }

	it { should respond_to(:title) }

	it { should respond_to(:description) }

	it { should be_valid }
	
	describe "when title is not present" do
		before { @list.title = "" }
		
		it { should_not be_valid }
	end

	describe "when description is not present" do
		before { @list.description =  "" }

		it { should be_valid }
	end
end
