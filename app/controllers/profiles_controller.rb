class ProfilesController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:user_id])
		@diary = @user.diary
	end
	
end
