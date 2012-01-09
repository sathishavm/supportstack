require 'spec_helper'

describe Department do
	it {should have_many(:staff_admins)}
	it {should have_many(:tickets)}
  it {should validate_presence_of(:name)} 
	it {should validate_presence_of(:description)}
	it {should validate_presence_of(:email_id)}
	
		it "should have a unique email" do
    Department.create!(:name=>"firstname",:description=>"description",:email_id=>"aaa@gmail.com")
    con = Department.new(:name=>"firstname",:description=>"description",:email_id=>"aaa@gmail.com")
    con.should_not be_valid
    con.errors[:email_id].should include("has already been taken")
	end
	end