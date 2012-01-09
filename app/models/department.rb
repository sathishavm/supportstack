class Department < ActiveRecord::Base
	has_many :staff_admins,:dependent => :destroy
	has_many :tickets,:dependent => :destroy
	validates :name, :presence => true#,>{:name=>["can't be blank"]}
	validates :description,:presence => true
	validates :email_id,:presence => true,:uniqueness => true
	#p = Department.new
	#<Person id: nil, name: nil>

#p.valid?=> false

	
#validates :name, :presence => true #,:uniqueness => true,  
#validates :email_id, :presence => true#, :email => true,:uniqueness => true
end
