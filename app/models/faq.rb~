class Faq < ActiveRecord::Base
	acts_as_commentable
	validates :question, :presence => true
  default_scope :order => 'created_at DESC'


end
