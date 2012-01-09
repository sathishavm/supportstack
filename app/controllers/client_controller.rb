class ClientController < ApplicationController
		before_filter :authenticate_user!
	before_filter :verify_admin
	layout "admin"
	def new
		@user=User.new
		@client=Client.new
	end
	def create
			@c=Client.new(params[:client])
			@u=User.new(params[:user])
			password=((0..7).map{ rand(36).to_s(36) }.join)
		   @u.password=password
			@a=Role.find_by_name('client')
			@u.role_id=@a.id
			if((@u.valid? )&& (@c.valid?))
		 @u.save
  		@c.user_id=@u.id
	  	@c.save
		  email=@u.email
			user_name=@u.username
		  Confirmation.send_mail(email,password,user_name).deliver
			 redirect_to "/client/dashboard"
			 else
				   @error=@u.errors.messages
					 @error1=@c.errors.messages
				@user=@u
		    @client=@c
		 render:new
		end
		end

		def edit
			 @client=Client.find_by_id(params[:id])
			 			 if (!@client.nil?)
			@user=User.find_by_id(@client.user_id)
				else
				redirect_to "/client/manage"
				end
		end
		def update
		  @c_user=User.find_by_id(params[:id])
			@client_user=Client.find_by_user_id(params[:id])
      if((@c_user.update_attributes(params[:user]))&&( @client_user.update_attributes(params[:client])))
			       redirect_to "/client/dashboard"
			 else
				   @error=@c_user.errors.messages
					 @error1=@client_user.errors.messages
				@user=@c_user
		    @client=@client_user
		 render:edit
				 end
		end
		def show
		
		   @client=Client.find_by_id(params[:id])
			 if (!@client.nil?)
			@user=User.find_by_id(@client.user_id)
			else
				redirect_to "/client/dashboard"
				end
		  end
		
		  def dashboard
						  @ticket=Client.paginate(:page => params[:page], :per_page => 3)
						end
						def manage
							@ticket=Client.paginate(:page => params[:page], :per_page => 3)
						end
	def destroy
			@users=Client.find_by_id(params[:id])
			@user1=User.find_by_id(@users.user_id)
			@user1.destroy
@users.destroy
redirect_to "/client/dashboard"

		end
		def destroy1
			@users=Client.find_by_id(params[:id])
			@user1=User.find_by_id(@users.user_id)
			@user1.destroy
@users.destroy
redirect_to "/client/manage"

			end
			def verify_admin
		unless (current_user.role.name=="admin")
		   	redirect_to"/user/home"
					end
			end
end
