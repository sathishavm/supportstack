class StaffviewController < ApplicationController
	layout "staff"
	before_filter :authenticate_user!
	before_filter :verify_staff
def staffmyaccount
		  @account=current_user
				a=current_user.id
		  @staffull=StaffAdmin.find_by_user_id(a)
		end
			def staffview
		   @user=User.all
		   @c_userid=current_user.id
  @ticket=(Ticket.where(:status=>"pending",:user_id=>@c_userid)).paginate(:page => params[:page], :per_page => 3)
end
def completed
	@user=User.all
		   @c_userid=current_user.id
	 @ticket=(Ticket.where(:status=>"completed",:user_id=>@c_userid)).paginate(:page => params[:page], :per_page => 3)
	end
		def staffcomplete
		  @ticket_detail=Ticket.find_by_id(params[:id])
			if(!@ticket_detail.nil?)
      @ticketcomment=Comment.new
			else
				redirect_to "/staffview/staffview"
				end
		end
		def dashboard
			@pendingticket=Ticket.where(:status=>"pending",:user_id=>current_user.id).count
			@completedticket=Ticket.where(:status=>"completed",:user_id=>current_user.id).count
		end
		def update
		  @c_user=User.find_by_id(current_user.id)
      @c_user.update_attributes(params[:user])
			redirect_to "/staffview/dashboard"
		end
		def save
		  @ticket_detail1=Ticket.find_by_id(params[:id])
			@a=Comment.create(:title => "Staff comment.", :comment => params[:comment][:comment],:user_id=>current_user.id)
			if(@a.valid?)
				@ticket_detail1.comments<<@a
      @ticket_detail1.update_attributes(:status=>"completed")
		  	redirect_to "/staffview/staffview"
			else
				@error=@a.errors.messages
				p @errors
				@ticket_detail=@ticket_detail1
				@ticketcomment=Comment.new
				render:staffcomplete
				end
		end
		 def destroy
@users=Ticket.find_by_id(params[:id])
if @users.destroy
redirect_to "/staffview/staffview"
end
end
def show
	@user=User.all
	@ticketall=Ticket.find_by_id(params[:id])
@comments = @ticketall.comments.recent.limit(15).all
	end
	def destroy1
@users=Comment.find_by_id(params[:id])
if @users.destroy
redirect_to "/staffview/completed"
end
end
def verify_staff
		unless (current_user.role.name=="Staff")
		   	redirect_to"/user/home"
					end
			end
end
