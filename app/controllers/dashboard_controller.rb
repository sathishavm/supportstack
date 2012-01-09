class DashboardController < ApplicationController
	before_filter :authenticate_user!
	before_filter :verify_admin
	layout "admin"
	def new
		@c_user=current_user
		@staff=StaffAdmin.all.count
		@client=Client.all.count
		@openticket=Ticket.find_all_by_status("active").count
		@pendingticket=Ticket.find_all_by_status("pending").count
		end
		def my_account
					@account=current_user
					end
		def update
		 @c_user=User.find_by_id(current_user.id)
		  if(@c_user.update_attributes(params[:user]))
			redirect_to"/dashboard/new"
		    else
			@errors=(@c_user).errors.messages
			render :my_account
			@account=current_user
			end
		end
		def verify_admin
		unless (current_user.role.name=="admin")
		   	redirect_to"/user/home"
					end
			end
end
