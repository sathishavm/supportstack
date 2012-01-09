include ActionDispatch::TestProcess

Factory.define :ticket do |a|
	a.user_id 1
	a.department_id 2
	a.description "This is my first Ticket"
	a.priority "high"
	a.status "open"
	a.category "product"
	a.subject "to test the ticket"
	a.submitedby 1
end