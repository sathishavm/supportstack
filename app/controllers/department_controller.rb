class DepartmentController < ApplicationController
		before_filter :authenticate_user!
	before_filter :verify_admin
		layout "admin"
def new
@depart=Department.new
end
def create
@dep=Department.new(params[:department])
if @dep.valid?
	@dep.save
	redirect_to "/department/dashboard"
else
		 @error=@dep.errors.messages
		 @depart=@dep
		 render:new
end

end
def dashboard
	@ticket=Department.paginate(:page => params[:page], :per_page => 3)
end
def manage
	@ticket=Department.paginate(:page => params[:page], :per_page => 3)
end
def edit
	@depart=Department.find_by_id(params[:id])
	if @depart.nil?
	redirect_to "/department/manage"
	end
end
def update
@depart=Department.find_by_id(params[:id])
@depart.update_attributes(params[:department])
redirect_to "/department/dashboard"
end
	
def show
@depart=Department.find_by_id(params[:id])	
if @depart.nil?
	redirect_to "/department/dashboard"
	end
end
def destroy
	@users=Department.find_by_id(params[:id])
if @users.destroy
redirect_to "/department/dashboard"
end
	end
	def verify_admin
		unless (current_user.role.name=="admin")
		   	redirect_to"/user/home"
					end
			end
end
