class ProfileController < ApplicationController
	before_filter :authenticate

	def authenticate
		if current_user != User.find_by_id(params[:id])
			p current_user.id
			p params[:user_id]
			redirect_to user_path(current_user)
		end
	end

	def index
		@user=User.find_by_id(params[:id])
		if @user.nil?
		redirect_to root_path
		end	
	end

	def edit
		if user_signed_in?
			@user=current_user
			if @user.profile.nil?
				@user.profile=Profile.new
			end
			@profile=@user.profile
		else
			redirect_to root_path
		end
	end

	def update
		@user=current_user
		@user.profile[:first_name]=params[:profile][:first_name]
		@user.profile[:last_name]=params[:profile][:last_name]
		@user.profile[:sex]=params[:profile][:sex]
		@user.profile.save
		redirect_to user_path(current_user)
	end
end
