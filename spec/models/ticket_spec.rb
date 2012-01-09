require 'spec_helper'

describe Ticket do
  it {should have_one(:attachment)}
	it {should belong_to(:department)}
  it {should belong_to(:user)}
	it {should have_many(:comments)}
  it {should validate_presence_of(:subject)} 
	it {should validate_presence_of(:description)}
end