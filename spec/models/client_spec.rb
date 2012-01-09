require 'spec_helper'

describe Client do
  it {should belong_to(:user)}
  it {should validate_presence_of(:company)} 
	it {should validate_presence_of(:address_1)}
	it {should validate_presence_of(:phone_1)}
	it {should validate_presence_of(:city)}
	it {should validate_presence_of(:state)}
end