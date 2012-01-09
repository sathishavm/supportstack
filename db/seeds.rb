# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
Role.create([{:name=>'admin'},{:name=>'Staff'},{:name=>'client'}])
u=User.create(:fullname=>'admin',:email=>'admin@supportstack.org',:username=>'administrator',:password=>'qwerty',:phone=>'04282-241215',:mobile=>'9003375353')
u.role=Role.first
u.save