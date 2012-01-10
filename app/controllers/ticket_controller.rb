class TicketController < ApplicationController
	before_filter :authenticate_user!
before_filter :verify_admin
	layout "admin"
	def new
	@ticket=Ticket.new
end
	def create

	@ticket_detail=Ticket.new(params[:ticket])

	if @ticket_detail.valid?
		attachment=Attachment.create(params[:attachment])
		@ticket_detail.attachment=attachment if attachment
		@ticket_detail.status="active"
		@ticket_detail.submitedby=current_user.id
		@ticket_detail.save
		redirect_to "/ticket/open_ticket"
         else

		 @error=@ticket_detail.errors.messages
		 @ticket=@ticket_detail
		 render:new
		 end
	end
	def dashboard
		@openticket=Ticket.find_all_by_status("active").count
		@pendingticket=Ticket.find_all_by_status("pending").count
			@completedticket=Ticket.find_all_by_status("completed").count
		end
	
	def open_ticket
	@ticket=(Ticket.where(:status=>"active")).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
	@user=User.all
	end
	 def pending_ticket
  @ticket=(Ticket.where(:status=>"pending")).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
  @user=User.all
	
  end
    def completed_ticket
  @ticket=(Ticket.where(:status=>"completed")).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
  @user=User.all
  end
	def assign
		@user=User.all
		@ticket_detail=Ticket.find_by_id(params[:id])
	if (!@ticket_detail.nil?)
		@ticketassign=StaffAdmin.where(:department_id=>@ticket_detail.department_id)
		@ticket_detail1=Ticket.find(params[:id],:include=>[:attachment])
		else
			redirect_to "/ticket/open_ticket"
			end
	end
	def save
			@ticket_detail=Ticket.find_by_id(params[:id])
			@ticket_detail.update_attributes(:user_id=>params[:ticket][:user_id],:status=>"pending")
redirect_to "/ticket/open_ticket"
		 end
		 def destroy
@users=Ticket.find_by_id(params[:id])
if @users.destroy
redirect_to "/ticket/open_ticket"
end
end
	 def destroy1
@users=Ticket.find_by_id(params[:id])
if @users.destroy
redirect_to "/ticket/pending_ticket"
end
end 
def destroy2
@users=Ticket.find_by_id(params[:id])
if @users.destroy
redirect_to "/ticket/completed_ticket"
end
end
def download_attachment
	@tick=Ticket.find_by_id(params[:id])
send_file("#{Rails.root}/public/system/avatars/#{@tick.attachment.id}/original/#{@tick.attachment.avatar_file_name}",:filename => "#{@tick.attachment.avatar_file_name}",:type=>"#{@tick.attachment.avatar_content_type}")
	end
	def verify_admin
		unless (current_user.role.name=="admin")
		   	redirect_to"/user/home"
					end
			end
end
