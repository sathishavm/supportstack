class FaqController < ApplicationController
	require 'will_paginate/array'
	layout :verify_admin
		
	def new
		@faq=Faq.new
		@view=Faq.paginate(:page => params[:page], :per_page => 6)
	end
	def create
@faq=Faq.new(params[:faq])
	if @faq.valid?
	@faq.save
	@view=Faq.paginate(:page => params[:page], :per_page => 6)
	#render:update do |p|
		#		p.replace_html "comments", :partial =>"faq/display", :locals => { :view => @view }
			#end

			respond_to do |format|
       format.js
        end
	#	redirect_to "/faq/new"
         else
		 @error=@faq.errors.messages
    @faq=Faq.new
		@view=Faq.paginate(:page => params[:page], :per_page => 6)
		 render:new
		 end
end
def comments
	@allquestion=Faq.find_by_id(params[:id])
	if(!@allquestion.nil?)
	@question=@allquestion.question
	@faq=Comment.new
@view= (@allquestion.comments.all).paginate(:page => params[:page], :per_page => 5)
else
	redirect_to "/faq/new"
	end
end
def save
	@allquestion=Faq.find_by_id(params[:id])
	@a=Comment.create(:title => "faq comments.", :comment => params[:comment][:comment])
			if(@a.valid?)
				@allquestion.comments<<@a
					@question=@allquestion.question
	@faq=Comment.new
@view= (@allquestion.comments.all).paginate(:page => params[:page], :per_page => 5)
			respond_to do |format|
       format.js
        end
      #redirect_to "/faq/comments/#{@allquestion.id}"
			#else
				#@error=@a.errors.messages
				  #@allquestion=Faq.find_by_id(params[:id])
	#@question=@allquestion.question
	#@faq=Comment.new
	#@view= @allquestion.comments.recent.limit(10).all
		#		render:comments
				end
			end
			def destroy
				@users=Comment.find_by_id(params[:id])
if @users.destroy
	@q=@users.commentable_id
	@allquestion=Faq.find_by_id(@q)
	@question=@allquestion.question
	@faq=Comment.new
@view= (@allquestion.comments.all).paginate(:page => params[:page], :per_page => 5)
respond_to do |format|

		p format
       format.js
        end
end
				end
				def destroy1
				@users=Faq.find_by_id(params[:id])
if @users.destroy
	@view=Faq.paginate(:page => params[:page], :per_page => 6)
respond_to do |format|

		p format
       format.js
        end
			end
		end
		def feed
  # this will be the name of the feed displayed on the feed reader
  @title = "Support Stack"

  @news_items = Faq.order("updated_at desc")

  # this will be our Feed's update timestamp
  #@updated = @news_items.first.updated_at unless @news_items.empty?

  respond_to do |format|
    format.atom 

    # we want the RSS feed to redirect permanently to the ATOM feed
    #format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
  end
		end
				def verify_admin
		if ((current_user)&&(current_user.role.name=="admin"))
		  return "admin"
		elsif((current_user)&&(current_user.role.name=="Staff"))
			return "staff"
			elsif((current_user)&&(current_user.role.name=="client"))
				return "client"
			else
				return "application"
					end
			end
end
