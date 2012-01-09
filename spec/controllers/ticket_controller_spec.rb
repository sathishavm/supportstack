require 'spec_helper'

describe TicketController, :type => :controller do
	
	 #before(:each) do
    #@current = mock_model(User, :id => 1,:role=>"admin")
#  end
	
		describe "new" do
    it "should be successful" do
 get :new
 #~ puts " ##################################### "
				#~ @ticket=Ticket.new
				#~ puts @ticket.inspect
				#~ puts "***********************************"
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