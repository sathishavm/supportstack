class UserController<ApplicationController
	before_filter :authenticate_user!
	def index

	end
	def home
		if(current_user.role_id==1)
		redirect_to '/dashboard/new'
		end
		if(current_user.role_id==2)
			redirect_to '/staffview/dashboard'
			end
				if(current_user.role_id==3)
						redirect_to '/clientview/dashboard'
					end
		end
	end