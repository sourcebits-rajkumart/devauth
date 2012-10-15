class SectionsController < ApplicationController
	before_filter :validate , :only=>[:create,:new]

	def validate
		if current_user.id != Story.find(params[:story_id]).user_id
			redirect_to story_path(params[:story_id])
		end
	end

	def new
		@story = Story.find(params[:story_id])
		@section=Section.new
	end

	def index
		story = Story.find(params[:story_id])
		@sections = story.sections
	end

	def create
		@story = Story.find(params[:story_id])
		newsection = @story.sections.new(params[:section])
		newsection.user_id = current_user.id
		newsection.save
		redirect_to story_path(params[:story_id])
	end
end
