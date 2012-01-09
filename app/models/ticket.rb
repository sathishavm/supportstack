class Ticket < ActiveRecord::Base
	belongs_to:department
	belongs_to:user
	has_one :attachment,:as=>:attachable, :dependent => :destroy
	acts_as_commentable

validates :subject, :presence => true
validates :description, :presence => true


end
