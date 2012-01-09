class StaffAdminController < ApplicationController
		before_filter :authenticate_user!
	before_filter :verify_admin
	layout "admin"
	def new
		@user=User.new
		@staff=StaffAdmin.new
	end
	def create
			@u=User.new(params[:user])
			@c=StaffAdmin.new(params[:staff_admin])
			@a=Role.find_by_name('Staff')
			@u.role_id=@a.id
			password=((0..7).map{ rand(36).to_s(36) }.join)
			@u.password=password
			if (@u.save)
			email=@u.email
			user_name=@u.username
		@c.user_id=@u.id
		@c.save
		Confirmation.send_mail(email,password,user_name).deliver
		redirect_to "/staff_admin/dashboard"
	   else
			  @error=@u.errors.messages
				@user=@u
		    @staff=@c
		 render:new
		
		end
			
		end
		def manage
			@ticket=StaffAdmin.paginate(:page => params[:page], :per_page => 3)
			end
		def update
		  @c_user=User.find_by_id(params[:id])
			  @stafftable=StaffAdmin.find_by_user_id(params[:id])
      if(@c_user.update_attributes(params[:user]))
      @stafftable.update_attributes(params[:staff_admin])
			redirect_to "/staff_admin/dashboard"
			else
				@error=@c_user.errors.messages
				@user=@c_user
		    @staff=@stafftable
		 render:edit
				end
		end
		def edit
     @u=StaffAdmin.find_by_id(params[:id])
		 			 if (!@u.nil?)
		 @user=User.find_by_id(@u.user_id)
		 @staff=StaffAdmin.find_by_id(params[:id])
		 else
			 redirect_to "/staff_admin/manage"
			 end
    end
		def show
			 @u=StaffAdmin.find_by_id(params[:id])
			 if (!@u.nil?)
		 @user=User.find_by_id(@u.user_id)
		 @staff=StaffAdmin.find_by_id(params[:id])
			else
				redirect_to "/staff_admin/dashboard"
				end
			end
		
		def dashboard
			@ticket=StaffAdmin.paginate(:page => params[:page], :per_page => 3)
		end
		def destroy
			@users=StaffAdmin.find_by_id(params[:id])
			@user1=User.find_by_id(@users.user_id)
			@user1.destroy
@users.destroy
redirect_to "/staff_admin/dashboard"
		end
		def destroy1
	@users=StaffAdmin.find_by_id(params[:id])
			@user1=User.find_by_id(@users.user_id)
			@user1.destroy
@users.destroy
redirect_to "/staff_admin/manage"
			end
			def verify_admin
		unless (current_user.role.name=="admin")
		   	redirect_to"/user/home"
					end
			end
end
