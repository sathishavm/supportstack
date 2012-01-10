include ActionDispatch::TestProcess

Factory.define :ticket do |a|
	a.id "1"
	a.user_id "1"
	a.department_id "2"
	a.description "This is my first Ticket"
	a.priority "high"
	a.status "open"
	a.category "product"
	a.subject "to test the ticket"
	a.submitedby 1
end

Factory.define :faq do |a|
	a.id "2"
	a.question "This is my first question"
end

Factory.define :department do |a|
	a.id "2"
	a.name "Support"
	a.description "This is for support"
	a.email_id"friends@gmail.com"
	a.phone_number "9003375353"
end

Factory.define :news do |a|
	a.id "2"
	a.subject "hai"
	a.description "This is for hai"
	a.place"chennai"
	a.date "21-01-1990"
end