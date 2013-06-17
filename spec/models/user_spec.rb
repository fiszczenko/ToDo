# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)      default(""), not null
#

require 'spec_helper'

describe User do
  before { @user = User.new(username: "example", email: "user@example.com", password: "testowe", password_confirmation: "testowe") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  it { should be_valid }

  describe "when username is not present " do
	  before { @user.username = "" }
	  it { should_not be_valid }
  end

  describe "when email format is invalid" do
	  it "should be invalid" do
		  addr = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
		  addr.each do |invalid_addr|
			  @user.email = invalid_addr
			  should_not be_valid
		  end
	  end
  end

  describe "when email format is valid" do
	  it "should be valid" do
		  addr = %w[user@foo.COM user@foo.org A_US-ER@f.b.com first.lst@foo.jp a+b@baz.cn]
		  addr.each do |valid_addr|
			  @user.email = valid_addr
			  should be_valid
		  end
	  end
  end

  describe "when email is already taken" do
	  before do
		  user_with_the_same_email = @user.dup
		  user_with_the_same_email.save
	  end
	  it { should_not be_valid }

  end

  describe "when username is already taken" do
	  before do
		  user_with_the_same_username = @user.dup
		  user_with_the_same_username.save
	  end
	  it { should_not be_valid }
  end

  describe "when password is not present" do
	  before { @user.password = @user.password_confirmation = " " }
	  
	  it { should_not be_valid }
  end

  describe "when passwords mismatch" do 
	  before { @user.password_confirmation = "mismatch" }

	  it { should_not be_valid }
  end

  describe "when password is too short" do
	  before { @user.password = @user.password_confirmation = "shor" }

	  it { should_not be_valid }
  end


end
