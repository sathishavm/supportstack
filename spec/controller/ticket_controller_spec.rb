require 'spec_helper'

describe TicketController do
	
	 before(:each) do
    @current_user = mock_model(User, :id => 1,:role=>"admin")
  end
	
		describe "new" do
    it "should be successful" do
 get "new"
				@ticket=Ticket.new
	  end
	end
	
	describe "create" do
    it "should be successful" do
      get "create"
			params=Factory.attributes_for(:create_ticket)
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