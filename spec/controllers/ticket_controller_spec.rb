require 'spec_helper'

describe TicketController, :type => :controller do
	include Devise::TestHelpers

	def mock_user(stubs={})
        @mock_user ||= mock_model(User, stubs).as_null_object
    end
    before(:each) do
       
        request.env['warden'] = mock(Warden, :authenticate => mock_user,:authenticate! => mock_user)
	
				@current_user = {:id => 1,:name=>"admin"}
    end
	
		describe "new" do
    it "should be successful" do
 get :new
          response.should be_success
					end
	end
	
	describe "create" do
    it "should be successful" do
      get :create
			params=Factory.attributes_for(:ticket)
			@partner=Ticket.new(params)
			if @partner.valid?
			@partner.save
          response.should be_success
		else
					response.should render_template("new")
		end	
	end
	end
	
	
	end