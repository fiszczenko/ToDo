class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :surname

  has_many :lists, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates_presence_of :username
  validates_presence_of :email
  
  validates_uniqueness_of :username
  validates_uniqueness_of :email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_format_of :email, with: VALID_EMAIL_REGEX
end
