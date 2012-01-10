require 'spec_helper'

describe NewsController, :type => :controller do
	include Devise::TestHelpers

	def mock_user(stubs={})
        @mock_user ||= mock_model(User, stubs).as_null_object
    end
    before(:each) do
       
        request.env['warden'] = mock(Warden, :authenticate => mock_user,:authenticate! => mock_user)
	    Role.create([{:name=>'admin'},{:name=>'Staff'},{:name=>'client'}])
				@current_user = {:id => 1,:role=>"admin"}
				#@current_user.role="admin"
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
			params=Factory.attributes_for(:news)
			@partner=News.new(params)
			if @partner.valid?
			@partner.save
         response.should render_template("new")
		else
					response.should render_template("new")
		end	
	end
	end
	
	
	end