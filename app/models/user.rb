class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:username,:fullname,:phone,:mobile
  
  # Relationships
  
 belongs_to :role 
  has_one :client ,:dependent => :destroy 
  has_one :attachment,:as=>:attachable,:dependent => :destroy
  has_one :staff_admin, :dependent => :destroy
  has_many :tickets ,:dependent => :destroy
  has_many :news,:dependent => :destroy
  has_many :transaction,:dependent => :destroy
  validates :fullname, :presence => true
  validates :username, :presence => true
end
