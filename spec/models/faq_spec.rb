require 'spec_helper'

describe Faq do
	it {should validate_presence_of(:question)}
	it {should have_many(:comments)}
	end