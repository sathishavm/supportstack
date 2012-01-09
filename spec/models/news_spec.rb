require 'spec_helper'

describe News do
  it {should validate_presence_of(:subject)} 
	it {should validate_presence_of(:description)}
	it {should validate_presence_of(:place)}
	it {should validate_presence_of(:date)}
  it {should belong_to(:user)}
	end