require 'spec_helper'

describe User do
	it {should have_one(:staff_admin)}
	it {should have_many(:tickets)}
	it {should have_one(:client)}
  it {should validate_presence_of(:username)} 
	it {should validate_presence_of(:fullname)}
	it {should belong_to(:role)}
	it {should have_one(:attachment)}
	it {should have_many(:news)}
	end