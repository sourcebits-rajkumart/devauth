class StoriesController < ApplicationController
	def new
		@story=Story.new
	end

	def index
		@stories = Story.all
		respond_to do |format|
      		format.html
      		format.json { render :json => @stories.to_xml }
    	end
	end

	def create
		@user=current_user
		x=@user.stories.new(:name=>params[:story][:name])
		x.save
		redirect_to my_stories_path(current_user.id)
	end

	def mystories
		@user=current_user
		@stories=@user.stories
	end

	def show
		@story = Story.find(params[:id])
		@sections = @story.sections
		
	end
end
