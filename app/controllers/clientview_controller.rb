class ClientviewController < ApplicationController
		require 'will_paginate/array'
	layout "client"
	before_filter :authenticate_user!
	before_filter :verify_staff
	def clientparticular
		@user=User.all
		   @ticketall=Ticket.find_by_id(params[:id])
			 if(!@ticketall.nil?)
			@comment1=Comment.new
@comments= (@ticketall.comments.all).paginate(:page => params[:page], :per_page => 3)
else
	redirect_to "/clientview/clientview"
	end
		end
		def clientmyaccount
		  @account=current_user
		  @clienttable=Client.find_by_user_id(current_user.id)
		end
				def clientview
		  @c_userid=current_user.id
  @ticket=(Ticket.where(:submitedby=>@c_userid)).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
end
def dashboard
			@pendingticket=Ticket.where(:status=>"pending",:submitedby=>current_user.id).count
			@completedticket=Ticket.where(:status=>"completed",:submitedby=>current_user.id).count
		end
		def new
		if (user_signed_in?)
if(current_user.role_id==3)
@c_user=Ticket.new
else
	redirect_to"/user/home"
end
else
	redirect_to"/user/home"
	end
end
	def create
		
		@ticket_detail=Ticket.new(params[:ticket])
	if @ticket_detail.valid?
		attachment=Attachment.create(params[:attachment])
		@ticket_detail.attachment=attachment if attachment
		@ticket_detail.status="active"
		@ticket_detail.submitedby=current_user.id
		@ticket_detail.save
		redirect_to "/clientview/clientview"
         else
		 @error=@ticket_detail.errors.messages
		 @c_user=@ticket_detail
		 render:new
		 end
	end
def update
	
	 @ticket_detail1=Ticket.find_by_id(params[:id])
			@a=Comment.create(:title => "client comment.", :comment => params[:comment][:comment],:user_id=>current_user.id)
			if(@a.valid?)
				@ticket_detail1.comments<<@a
     #redirect_to "/clientview/clientparticular/#{@ticket_detail1.id}"
		 @user=User.all
		   @ticketall=Ticket.find_by_id(params[:id])
			@comment1=Comment.new
@comments= (@ticketall.comments.all).paginate(:page => params[:page], :per_page => 3)
			respond_to do |format|
       format.js
        end
		  
		#	else
			#	@error=@a.errors.messages
				 #  @ticketall=Ticket.find_by_id(params[:id])
			#@comment1=Comment.new
#@comments = @ticketall.comments.recent.limit(10).all
	#			@user=User.all
		#		render:clientparticular
				end
	
	

end	

def update1
	 @ticketall=Ticket.find_by_id(params[:id])
@ticketall.update_attributes(:status => params[:ticket][:status], :priority => params[:ticket][:priority])
redirect_to "/clientview/dashboard"
end	
 def destroy
@users=Ticket.find_by_id(params[:id])
if @users.destroy
redirect_to "/clientview/clientview"
end
end
def download_attachment
	@tick=Ticket.find_by_id(params[:id])
send_file("#{Rails.root}/public/system/avatars/#{@tick.attachment.id}/original/#{@tick.attachment.avatar_file_name}",:filename => "#{@tick.attachment.avatar_file_name}",:type=>"#{@tick.attachment.avatar_content_type}")
	end
	 def destroy1
@users1=Comment.find_by_id(params[:id])
@user=User.all
@tick=Ticket.find_by_id(@users1.commentable_id)
if @users1.destroy
	  @ticketall=@tick
			@comment1=Comment.new
	@comments= (@tick.comments.all).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
	p @comments
	respond_to do |format|

		p format
       format.js
        end
end
end
def verify_staff
		unless (current_user.role.name=="client")
		   	redirect_to"/user/home"
					end
			end
end
