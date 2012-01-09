class NewsController < ApplicationController
		before_filter :authenticate_user!,:except => [:show]
	before_filter :verify_admin,:except => [:show]
	layout "admin"
	def new
		@news=News.new
	end
	def create
	@u=	News.new(params[:news])
	if(@u.save)
	redirect_to "/news/newslist"
	else
		@error=@u.errors.messages
		@news=@u
		render:new
		end
end
def newslist
	@ticket=News.paginate(:page => params[:page], :per_page => 3).order("created_at Desc")
end
def edit 
	@news=News.find_by_id(params[:id])
	if(@news.nil?)
		redirect_to "/news/newslist"
		end
end
def update
	@u=News.find_by_id(params[:id])
	if(@news=@u.update_attributes(params[:news]))
redirect_to "/news/newslist"
else
	@error=@news.errors.messages
	@news=@u
	render:edit
	end

end
	def verify_admin
		unless (current_user.role.name=="admin")
		   	redirect_to"/user/home"
					end
				end
		def destroy
			@users=News.find_by_id(params[:id])
if @users.destroy
redirect_to "/news/newslist"
end
			end
			def show
			
				p params[:id]
					@newsdetails=News.find_by_id(params[:id])
	
						render :layout=>false
				end
			
end