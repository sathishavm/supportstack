require 'spec_helper'

describe Role do
	it {should have_many(:users)}
	end