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

require 'spec_helper'

describe Task do
	before { @task = Task.new(title: "Example", content: "Example content") }

	subject { @task }

	it { should respond_to(:title) }
	it { should respond_to(:content) }
	it { should respond_to(:done) }

	it { should be_valid }

	describe "title is not present" do
		before { @task.title = "" }

		it { should_not be_valid }
	end

	describe "content is not present" do
		before { @task.content = "" }

		it { should_not be_valid }
	end

end
